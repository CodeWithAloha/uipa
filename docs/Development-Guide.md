# Development Guide

This page covers the things that come up *after* you've got the site running via [Getting Started](Getting-Started.md) — day-to-day commands, where to look for things, and gotchas that aren't obvious from the code alone. If you're brand new to the domain (FOIA/UIPA/Froide), read [Domain-Knowledge.md](Domain-Knowledge.md) first; for what the app can do and where each behavior lives, see [Features.md](Features.md) and [Architecture.md](Architecture.md).

## Finding your way around the repo

| If you want to change... | Look in... |
|---|---|
| Page layout, header/footer, homepage copy | `uipa_org/templates/`, `uipa_org/theme/` |
| CSS/SCSS styling | `frontend/styles/` |
| Frontend JS/TS/Vue behavior | `frontend/javascript/main.ts` (custom) or `node_modules/froide/frontend/javascript/*` (engine — see `vite.config.js`'s `rollupOptions.input` for the full list of bundled entry points) |
| Django settings (env vars, `FROIDE_CONFIG`, installed apps) | `uipa_org/settings/base.py`, `uipa_org/settings/development.py` |
| URL routes | `uipa_org/theme/urls.py` (wraps Froide's `froide.urls`) |
| Hawaii-specific request-form logic (waiver, greeting/closing) | `uipa_org/uipa_constants.py`, `uipa_org/theme/templatetags/uipa_extras.py`, `uipa_org/theme/doc_utilities.py` |
| Scheduled/background jobs | `uipa_org/tasks.py` |
| Seed data / public body import | `data/seed/` (see [Seeding.md](Seeding.md)) |
| Generic FOI request behavior, accounts, search, the API, the document viewer | **Not in this repo.** That's in the `froide` package (installed from `CodeWithAloha/froide2`) — check `pyproject.toml`/`package.json` for the pinned source, or browse the [upstream Froide docs](https://froide.readthedocs.io/en/latest/) and [source](https://github.com/okfde/froide) since our fork tracks it closely. |

When in doubt, `grep` for the text you see on the page/error — if it's not found in `uipa_org/` or `frontend/`, it's almost certainly coming from the `froide` package in your virtual environment (e.g. `.venv/lib/.../site-packages/froide/` if you're using `uv`).

## Everyday commands

Run these from the repo root, with your virtual environment active (or prefix with `uv run` if you're using `uv` without activating it, matching `run-backend.sh`/`run-django.sh`).

```bash
# Start the dev server
python manage.py runserver

# See every effective Django setting (handy for confirming a Froide default vs. your override)
python manage.py diffsettings --all

# Apply database migrations
python manage.py migrate

# Create/rebuild the Elasticsearch index after model or mapping changes
python manage.py search_index --create
python manage.py search_index --populate

# Load seed fixtures (see Seeding.md for the full sequence)
python manage.py loaddata data/seed/<file>.json

# Open a Django shell with the project's settings loaded
python manage.py shell

# Open a psql shell against the dev database
python manage.py dbshell
```

Frontend (from the repo root, needs `yarn install` once):

```bash
yarn dev      # Vite dev server with hot reload (see Getting-Started.md for the
              # FRONTEND_DEBUG setting you need to flip to actually use it)
yarn build    # Production build of static assets into build/
```

## The "theme" override pattern, practically

Because this repo is a theme on top of Froide (see [Architecture.md](Architecture.md#engine-vs-theme-how-this-repo-relates-to-froide)), the day-to-day workflow for changing something usually looks like:

1. **Settings** — `UipaOrgThemeBase` in `uipa_org/settings/base.py` subclasses `froide.settings.Base` and overrides specific properties (`INSTALLED_APPS`, `TEMPLATES`, `STATICFILES_DIRS`, `FROIDE_CONFIG`, ...). To change a Froide-level setting, override it here rather than editing anything inside the `froide` package. Run `manage.py diffsettings --all` if you're unsure whether your override actually took effect.
2. **Templates** — Froide templates are designed to be extended. Our templates (`uipa_org/templates/index.html`, etc.) use `{% extends "index.html" %}` and only override specific `{% block %}`s, rather than copying the whole template. Find the block names by looking at the corresponding template in the installed `froide` package.
3. **URLs** — `uipa_org/theme/urls.py` is the `ROOT_URLCONF`. It imports Froide's pre-built URL pattern lists (`froide_urlpatterns`, `admin_urls`, `api_urlpatterns`, `jurisdiction_urls`) wholesale and adds UIPA-only routes (flatpages, `robots.txt`, the custom homepage) around them.
4. **Static/JS** — Custom assets go in `frontend/` and `uipa_org/theme/static/`; Froide's own JS modules are consumed straight from `node_modules/froide/...` as separate Vite build entry points (see `vite.config.js`).

Avoid vendoring/copying Froide files into this repo to "customize" them — it defeats the point of tracking the upstream `froide2` fork and will silently drift out of date. Prefer settings overrides, template block overrides, or (if you truly need new behavior) a small addition in `uipa_org/`.

## Code style & testing tooling

The `dev` dependency group in `pyproject.toml` includes: `black` (formatting), `isort` (import sorting), `flake8` + `flake8-bugbear` (linting), `mypy` + `django-stubs` (type checking), and `pytest-django` + `factory-boy` + `pytest-factoryboy` + `faker` + `coverage` (testing). Install them with your dev dependency group (e.g. `uv sync` picks up `dependency-groups.dev` automatically) and run them the standard way, e.g.:

```bash
black .
isort .
flake8
mypy .
pytest
```

> Note: at the time of writing, this repository doesn't yet have its own `tests/` directory, `pytest.ini`, or pre-commit config — most of the tested behavior lives in the `froide` package itself. If you add non-trivial logic to `uipa_org/` (e.g. to `doc_utilities.py` or `tasks.py`), it's a good candidate for a first test using the tooling above.

## Admin access

The seed data creates a default superuser for local development only (see [Getting-Started.md](Getting-Started.md#one-time-set-up)):

```
Email:    admin@uipa.org
Password: secret007
```

Log in at `http://127.0.0.1:8000/admin/`. **Never use these credentials, or load seed fixtures containing them, on a non-development server.**

## Common environment gotchas

- **GDAL/GEOS not found**: `django.contrib.gis`/PostGIS support needs native GDAL and GEOS libraries. If Django complains it can't find them, set `GDAL_LIBRARY_PATH` and `GEOS_LIBRARY_PATH` explicitly (see `setup-uipa.sh` and `docker-compose.local.yml` for known-good paths inside the container as a reference).
- **ImageMagick / Wand errors**: document thumbnailing depends on ImageMagick being installed and (on some setups) `MAGICK_HOME` being set.
- **Elasticsearch out of sync**: if search results look stale or missing after a schema/model change, re-run `manage.py search_index --create` and `--populate`.
- **Editing `uipa_org/settings/development.py` requires a server restart** — Django doesn't hot-reload settings changes, unlike template/view code.
- **Frontend changes not showing up**: by default the dev server serves the *built* assets from `build/`, not a live Vite server. You need to flip `FRONTEND_DEBUG = False` off (comment it out) in `development.py` and run `yarn run serve` alongside `runserver` — see the "Run the Frontend" section of [Getting-Started.md](Getting-Started.md).
- **"Which repo is this bug even in?"** — if the behavior isn't explained by anything under `uipa_org/` or `frontend/`, it's very likely coming from the `froide` package. Check [Architecture.md](Architecture.md) for the engine/theme split, and consider reproducing/reporting against [`CodeWithAloha/froide2`](https://github.com/codewithaloha/froide2) instead.

## Getting help

- Project Slack: `#project-uipa` (mentioned in [Emails.md](Emails.md) for shared dev credentials).
- Upstream Froide docs: https://froide.readthedocs.io/en/latest/ (a [Getting Started guide](http://froide.readthedocs.org/en/latest/gettingstarted/) for the engine itself is a useful second reference if something feels underdocumented here).
- CODEOWNERS: `@CodeWithAloha/uipa` for this repository.
