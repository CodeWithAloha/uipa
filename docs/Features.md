# Features

UIPA.org's functionality comes from two places: the **[Froide](https://github.com/okfde/froide)** engine (installed as a dependency, forked at [`CodeWithAloha/froide2`](https://github.com/codewithaloha/froide2)) and the **`uipa_org`** theme in this repository. If you haven't read [Domain-Knowledge.md](Domain-Knowledge.md) yet, it explains the "engine vs. theme" relationship this page assumes.

As a rule of thumb: **if a feature would make sense on a generic FOI site in any country, it's a Froide feature. If a feature only makes sense for Hawaii's UIPA process specifically, it's a UIPA feature.**

## Froide features (the engine)

These are provided by the `froide` package and its optional plugin modules. UIPA.org uses them largely as-is, with configuration tweaks (see below) rather than code changes.

| Area | What it does |
|---|---|
| **FOI requests & messaging** | Core request lifecycle: draft → send → awaiting response → overdue tracking → resolved (successful/partially successful/refused/withdrawn). Each request gets a unique "secret address" so incoming agency replies are auto-matched to the right thread without exposing the requester's real email. |
| **Public body directory** | Searchable/browsable directory of government agencies (`PublicBody`), organized by `Jurisdiction`, `Classification`, `Category`, and the `FoiLaw` that applies to them. |
| **Document handling** | File uploads/attachments on messages, PDF/document conversion, and an in-browser document viewer with **redaction** tools (via [django-filingcabinet](https://github.com/okfde/django-filingcabinet), integrated as `@okfde/filingcabinet` in the frontend). |
| **Search** | Full-text search over requests and public bodies, backed by Elasticsearch (`django-elasticsearch-dsl`). |
| **Accounts** | User registration/login, profile settings, a "my requests" dashboard, data export requests (see [Emails.md](Emails.md)). |
| **Moderation & deferred messages** | Handling of incoming email that couldn't be auto-matched to a request (bounces, misdirected replies, spam) for manual admin triage. |
| **Comments & following** | Public comments on requests, and the ability to "follow" a request for updates. |
| **REST API** | A DRF-powered API (`api_urlpatterns`) with OpenAPI schema generation (`drf-spectacular`) for programmatic access to requests/public bodies. |
| **Django admin** | Full admin site (`admin_urls`) for staff to manage requests, public bodies, users, and moderate content. |
| **Geomatching** | Location-based public body matching (`django-leaflet`, `geoip2`) — e.g. suggesting the right county agency based on a map location. |
| **Internationalization** | Django's i18n framework, with `LocaleMiddleware` and `i18n_patterns` wiring already in place. |
| **Optional plugins** (present as frontend build targets today; enable server-side only if/when needed) | `froide_campaign` (organizing requests into public campaigns), `froide_exam` (curriculum-style request series), `froide_food` (a food-safety-inspection specific request flow), `froide_legalaction` (tracking related lawsuits), `froide_payment` (handling paid fees). |

## UIPA-specific features (the theme)

These live entirely in this repository, mostly under `uipa_org/`, and either **configure** Froide's behavior or **add** Hawaii-specific behavior on top of it.

| Area | What it does | Where |
|---|---|---|
| **Branding & UI** | Hawaii/UIPA.org look and feel — logo, header/footer, homepage hero copy explaining UIPA to first-time visitors, custom color/type styling. | `uipa_org/theme/templates*`, `uipa_org/templates/`, `frontend/styles/`, `uipa_org/theme/static/` |
| **Request-form legal defaults** | `FROIDE_CONFIG` overrides tuned for Hawaii: default law set to UIPA, public bodies can't be freely created by requesters, public-body officials are shown but their emails hidden, no online fee payment flow, etc. | `uipa_org/settings/base.py` |
| **Greeting/closing detection** | Froide's message parser looks for greeting/closing phrases to separate the "message body" from boilerplate. UIPA.org customizes these patterns to recognize Hawaii-style greetings/closings (`"Aloha ..."` / `"Mahalo,"`) instead of the Froide defaults. | `uipa_org/settings/base.py` (`greetings`, `closings` in `FROIDE_CONFIG`) |
| **Public-interest fee waiver workflow** | UIPA law lets requesters ask for search/copy fees to be waived in the public interest. UIPA.org adds a dedicated section to the request form (a `WAIVER_DELIMITER` marker that gets pre-filled into the textarea) so it can later tell whether a requester asked for a waiver, and strip/extract that section when generating PDFs or the final public archive of the request. | `uipa_org/uipa_constants.py`, `uipa_org/theme/templatetags/uipa_extras.py`, `uipa_org/theme/doc_utilities.py` |
| **Official "Request Access" form generation** | Fills in Hawaii's official fillable `.docx` public-records request form from a submitted `FoiRequest` (agency name/email, requester info, request text, fee-waiver checkbox), for cases where an agency wants the formal paperwork. | `uipa_org/theme/doc_utilities.py`, `uipa_org/theme/data/Request-Access-form-*.docx` |
| **Automatic public disclosure enforcement** | UIPA.org's philosophy is "public by default." Three scheduled Celery tasks enforce this: warn a requester 14 days before their request is made public, flip requests to public once the review window elapses, and notify admins about unmatched ("deferred") incoming messages so they don't get missed. | `uipa_org/tasks.py` |
| **Legacy data migration & seeding tooling** | Scripts to import ~200 Hawaii public agencies (and their old free-text "tag" data, remapped to Froide's structured "category" model) from a CSV export of the previous UIPA.org site, plus fixtures for jurisdictions/FOI laws/classifications and a one-command dev DB seed. | `data/seed/`, see [Seeding.md](Seeding.md) |
| **Custom routing & static pages** | Wraps Froide's URL patterns with UIPA-specific flatpages (`/help/about/`, `/help/faq/`, `/help/privacy/`, `/help/terms/`) and a custom homepage view showing recent successful/featured requests and site-wide counts. | `uipa_org/theme/urls.py`, `uipa_org/theme/views.py` |
| **Containerized dev & deploy setup** | Docker/Podman Compose files and an Alpine-based Dockerfile that build the Python (uv) and JS (yarn/Vite) toolchains together, with `DEBUG`/`INITIALIZE_DB`/`LOAD_DATA` environment switches for one-command local setup. | `Dockerfile`, `docker-compose*.yml`, `run-backend.sh`, `setup-uipa.sh` |
| **Email configuration for two mail flows** | Distinguishes "general" transactional email (account/password/export emails) from "UIPA" email (the actual request correspondence with agencies), each independently configurable. | See [Emails.md](Emails.md) |

## Architecture diagrams

For diagrams of how these pieces fit together at runtime (containers, services) and how a request flows through the system end-to-end, see [Architecture.md](Architecture.md).
