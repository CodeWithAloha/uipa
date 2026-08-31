# Domain Knowledge

This page is for developers who are new to UIPA.org and have never worked with a Freedom of Information (FOI) request platform before. It explains *why* this project exists, the legal/government concepts it's built around, and the vocabulary you'll see all over the codebase. If you already know what FOIA, UIPA, and Froide are, skip to [Getting Started](Getting-Started.md).

## The problem this project solves

In the United States, the public generally has a legal right to request records from government agencies. This right comes from:

- The federal **Freedom of Information Act (FOIA)** — applies to federal agencies.
- State-level equivalents — each state has its own version. Hawaii's is the **Uniform Information Practices Act (UIPA)**, codified as [Hawaii Revised Statutes Chapter 92F](https://oip.hawaii.gov/).

In theory, any resident can write a letter or email to a government agency and ask for records. In practice:

- Most people don't know this right exists, or don't know which agency to ask, or how to phrase the request.
- Every request and response happens in a private email thread, so the same information often gets requested (and answered) over and over by different people.
- There's no public record of what was asked, what was released, or how long agencies actually take to respond.

**UIPA.org exists to fix that.** It's a web portal that:

1. Walks a requester through drafting and sending a properly-formatted UIPA request to the correct Hawaii public agency.
2. Handles the back-and-forth (sending the request, receiving the agency's reply, tracking due dates).
3. Publishes the request and the agency's response publicly by default, so the resulting information is a public resource instead of a private email — nobody else has to ask the same question again.

The target users are:

- **Requesters** — members of the public, journalists, researchers, or advocates who want records from a Hawaii government agency and don't want to navigate the bureaucracy alone.
- **The general public** — people who browse already-completed requests instead of filing a new one.
- **Public agencies** — the state/county departments and offices that receive and respond to requests (they don't log in to anything; they just get and reply to emails, like a normal request).

See the main [README](../README.md#philosophy) for the project's mission statement, and the [news articles linked there](../README.md#news-articles) for real-world coverage of why this matters in Hawaii specifically.

## Key vocabulary

| Term | Meaning |
|---|---|
| **FOIA** | Freedom of Information Act. The general/federal U.S. term for public-records law. Used generically to refer to "this whole area of law," even when talking about a state law like UIPA. |
| **UIPA** | Uniform Information Practices Act — Hawaii's version of FOIA (HRS Chapter 92F). This is *this project's* namesake and the law its request-drafting flow is tuned for. |
| **OIP** | Hawaii's [Office of Information Practices](https://oip.hawaii.gov/) — the state office that administers/enforces UIPA and can rule on disputes between requesters and agencies. |
| **Public body** (Froide term) / **Public agency** (UIPA/OIP term) | A government office/department that can receive a records request — e.g. Department of Land & Natural Resources, Honolulu Police Department. Froide's codebase and admin UI say "public body"; UIPA/Hawaii materials say "public agency" or "government agency." They mean the same thing — see the note at the top of the [docs README](README.md). |
| **Froide** | The open-source FOI request software this project is built on top of. See [below](#froide-the-engine-uipa-the-theme). |
| **FOI request / `FoiRequest`** | The core object: one requester's request to one public body, plus its whole message thread and status. |
| **Message** | A single email in a request's thread — either sent by the requester (outgoing) or received from the public body (incoming). |
| **Secret address** | Froide gives every request a unique, auto-generated email address (e.g. `request-1234@uipa.org`). The public body replies to that address, and Froide matches the reply back to the right request automatically — the requester's real email address is never exposed to the agency. |
| **Deferred message** | An incoming email that Froide *couldn't* automatically match to a request (e.g. bounced, wrong address, spam). These need manual triage — see [Emails.md](Emails.md). |
| **Due date** | The legal deadline by which the agency should respond, calculated from the applicable FOI law. |
| **Jurisdiction** | The government level a public body belongs to (e.g. State of Hawaii, City & County of Honolulu). |
| **FOI Law** | The specific statute that applies to a jurisdiction (for Hawaii, this is UIPA itself) — defines things like response deadlines. |
| **Visibility (private/public)** | Whether a request and its messages are visible to the public. New requests typically start private/semi-private and are automatically made fully public after a review window (see [Features.md](Features.md)). |
| **Redaction** | Blacking out sensitive info (SSNs, personal addresses, etc.) in a released document before it's published, using Froide/[filingcabinet](https://github.com/okfde/django-filingcabinet)'s document viewer. |
| **Fee waiver / public interest waiver** | UIPA allows requesters to ask agencies to waive copying/search fees if the release serves the public interest. UIPA.org has custom form logic for this — see [Features.md](Features.md). |
| **Category / Classification / Tag** | Ways of grouping public bodies (e.g. "Police," "Land Use") so requesters can browse/search for the right agency. The legacy UIPA.org site used free-text "tags"; the current Froide-based site uses structured "categories" instead — see [Seeding.md](Seeding.md) for how one was migrated into the other. |

## Froide: the "engine," UIPA: the "theme"

This repository (`uipa`) does **not** contain the FOI request logic itself. That logic — accounts, request/message models, the public body directory, search, the document viewer, the REST API, etc. — lives in a separate, upstream project called **[Froide](https://github.com/okfde/froide)**, originally built by [Open Knowledge Foundation Germany](https://www.okfn.de/) for [FragDenStaat](https://fragdenstaat.de/), Germany's FOI portal. CodeWithAloha maintains a fork, [`CodeWithAloha/froide2`](https://github.com/codewithaloha/froide2), which this repo depends on (see `pyproject.toml`).

Think of Froide as a generic FOI platform *engine*, and this `uipa` repository as a *theme/skin* on top of it — similar to how a WordPress or Django-CMS theme customizes a generic content-management system without forking it. Concretely, `uipa` provides:

- Hawaii-specific branding, templates, and styling.
- Hawaii-specific configuration (default law, review windows, greeting/closing phrases like "Aloha"/"Mahalo," etc.).
- A few Hawaii-specific behaviors (fee-waiver document generation, legacy data import/seeding).

It does *not* reimplement request handling, email parsing, or search — those come from the `froide` Python package and its JS/Vue frontend modules, installed as dependencies.

This split matters day-to-day: if you're debugging something about *how a request works in general* (e.g. "why didn't this email get matched to a request?"), the answer is almost always in Froide, not in this repo. If you're debugging something *Hawaii/UIPA-specific* (e.g. "why does the request form insert this waiver paragraph?"), it's almost always in this repo. See [Architecture.md](Architecture.md) for a diagram of this relationship, and [Features.md](Features.md) for a full breakdown of which features come from which side.

## Where to go next

- [Features.md](Features.md) — what the site can do, split into "comes from Froide" vs. "custom to UIPA."
- [Architecture.md](Architecture.md) — diagrams of the system and the request lifecycle.
- [Development-Guide.md](Development-Guide.md) — day-to-day tips once your environment is running.
- [Getting Started](Getting-Started.md) — how to actually get the project running locally.
