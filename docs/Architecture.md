# Architecture

This page diagrams how UIPA.org is put together: the runtime services, how this repository relates to the Froide engine, and how a request flows from submission to publication. Pair this with [Features.md](Features.md) (what each piece does) and [Domain-Knowledge.md](Domain-Knowledge.md) (the vocabulary used below).

## System / container diagram

This shows the services that run when you follow [Getting Started](Getting-Started.md), whether via Docker Compose or run manually. Solid arrows are request/data flow; the Django app is the hub everything else talks to.

```mermaid
flowchart TB
    browser["Browser<br/>(requester / public visitor / staff)"]
    agencyEmail["Public agency<br/>(reads/replies via email)"]

    subgraph frontend["Frontend build"]
        vite["Vite / Vue / TypeScript<br/>(frontend/javascript, frontend/styles)"]
    end

    subgraph appHost["Django app container"]
        django["Django web server<br/>(Froide engine + uipa_org theme)"]
        celery["Celery workers / beat<br/>(uipa_org/tasks.py + Froide tasks)"]
    end

    subgraph data["Data services"]
        postgres[("PostgreSQL + PostGIS<br/>db service")]
        es[("Elasticsearch<br/>search index")]
    end

    mailer["Outbound / inbound mail<br/>(per Emails.md)"]

    vite -- "yarn build → static assets" --> django
    browser -- "HTTP" --> django
    django -- "renders pages using" --> vite
    django -- "ORM" --> postgres
    django -- "index / query" --> es
    django -- "queues scheduled + async jobs" --> celery
    celery -- "reads/writes" --> postgres
    django -- "send request emails" --> mailer
    mailer -- "agency replies" --> django
    mailer <-. "SMTP" .-> agencyEmail
    browser -. "views public requests" .-> django
```

Notes:

- `docker-compose.yml` / `docker-compose.local.yml` define the `db` (PostgreSQL+PostGIS) and `elasticsearch` services; the `app` service (built from the `Dockerfile`) runs the Django server and, per `run-backend.sh`, can also run `yarn serve` for the frontend dev server and one-time DB init/seed steps controlled by the `INITIALIZE_DB` / `LOAD_DATA` / `DEBUG` env vars.
- In local (non-container) development, you run the same pieces yourself in separate terminals — see [Getting-Started.md](Getting-Started.md).
- Celery is wired up in the codebase (`uipa_org/tasks.py` imports a `uipa_org.celery` app) for scheduled jobs like the public-disclosure reminders described in [Features.md](Features.md); a message broker (e.g. Redis) is required for it to run, same as any Celery deployment.

## Engine vs. theme: how this repo relates to Froide

UIPA.org doesn't fork Froide — it depends on it as a package and plugs into its extension points. This is the same relationship described conceptually in [Domain-Knowledge.md](Domain-Knowledge.md#froide-the-engine-uipa-the-theme), shown here as code structure.

```mermaid
flowchart LR
    subgraph froidePkg["froide (external package)<br/>github.com/codewithaloha/froide2"]
        froideSettings["froide.settings.Base"]
        froideApps["Core apps:<br/>foirequest, publicbody,<br/>account, frontpage,<br/>comments, api, ..."]
        froideUrls["froide.urls<br/>(froide_urlpatterns, admin_urls,<br/>api_urlpatterns, jurisdiction_urls)"]
        froideTemplates["Base templates<br/>(e.g. index.html)"]
    end

    subgraph uipaRepo["uipa (this repository)"]
        uipaSettings["uipa_org.settings.base.UipaOrgThemeBase<br/>extends froide.settings.Base"]
        uipaTheme["uipa_org.theme<br/>(FROIDE_THEME app)"]
        uipaUrls["uipa_org.theme.urls<br/>(ROOT_URLCONF)"]
        uipaTemplates["uipa_org/templates/*<br/>(extends Froide templates)"]
        uipaConstants["uipa_org.uipa_constants<br/>+ theme/doc_utilities.py"]
        uipaTasks["uipa_org.tasks<br/>(imports froide.foirequest.models)"]
    end

    uipaSettings -- "subclasses, overrides<br/>FROIDE_CONFIG, INSTALLED_APPS,<br/>TEMPLATES, STATICFILES_DIRS" --> froideSettings
    uipaUrls -- "imports + wraps" --> froideUrls
    uipaTemplates -- "{% extends %}" --> froideTemplates
    uipaTasks -- "queries/updates" --> froideApps
    uipaTheme --> uipaTemplates
    uipaTheme --> uipaConstants
```

Key takeaway for new developers: **most business logic (what a `FoiRequest` is, how email matching works, how search works) lives in the `froide` package, not in this repo.** This repository mainly *configures* and *skins* that engine. When you're not sure where to look for something, check [Features.md](Features.md)'s table first.

## Request lifecycle (sequence diagram)

This traces a UIPA request from submission through to public disclosure, and shows where UIPA-specific logic (bold) plugs into the generic Froide flow.

```mermaid
sequenceDiagram
    actor R as Requester
    participant W as UIPA.org (Django/Froide)
    participant DB as PostgreSQL
    participant M as Mail server
    actor A as Public Agency
    participant C as Celery (scheduled tasks)

    R->>W: Fill out request form for a Public Body
    Note over W: **Waiver textarea pre-filled**<br/>(uipa_extras.prefill / WAIVER_DELIMITER)
    R->>W: Submit request
    W->>DB: Create FoiRequest + outgoing Message<br/>(assign secret address, due date from FoiLaw)
    W->>M: Send request email (Aloha/Mahalo template)
    M->>A: Deliver email
    A->>M: Reply (with or without attachments)
    M->>W: Deliver to request's secret address
    W->>DB: Match reply to FoiRequest, store as incoming Message
    alt Reply can't be matched
        W->>DB: Store as DeferredMessage
        C->>W: deferred_message_notification task<br/>notifies admins of unmatched mail
    end
    W-->>R: Notify requester of new message
    Note over W: Staff/requester may redact attachments<br/>via filingcabinet document viewer
    W->>DB: Requester marks status<br/>(successful / refused / partially successful)
    loop Daily scheduled check
        C->>DB: **private_public_reminder task**<br/>find requests due to go public in 14 days
        C->>R: Email warning: "made public in 14 days"
        C->>DB: **make_private_public task**<br/>flip visibility to public once window elapses,<br/>approve eligible attachments
    end
    Note over W: Request + response now visible<br/>to the public on UIPA.org
```

## Repository layout

```
uipa/
├── uipa_org/                  # The "theme": UIPA/Hawaii-specific Django app
│   ├── settings/              # Extends froide.settings.Base
│   ├── theme/                 # FROIDE_THEME app: urls, views, templates, static, doc utilities
│   ├── templates/             # Site templates that {% extends %} Froide's base templates
│   ├── fixtures/               # Seed fixtures (admin user, site config)
│   ├── uipa_constants.py      # Waiver/greeting/footer delimiter strings
│   └── tasks.py                # Celery tasks enforcing UIPA's public-disclosure rules
├── frontend/                   # TypeScript/Vue/SCSS entry points built by Vite
├── data/                       # Legacy CSV exports + seed/import scripts (see Seeding.md)
├── docs/                       # You are here
├── docker-compose*.yml, Dockerfile, run-*.sh  # Container orchestration
└── pyproject.toml, package.json                # Python (uv) and JS (yarn) dependencies,
                                                  # including the froide package itself
```

See [Development-Guide.md](Development-Guide.md) for a day-to-day tour of these directories.
