# CareFlow Architecture Diagrams

This directory is the canonical home for portfolio-facing diagram sources. The authoritative architecture narrative remains in `docs/architecture/`.

## Diagram set

| Diagram | Source | Purpose |
|---|---|---|
| Architecture overview | [`architecture-overview.mmd`](architecture-overview.mmd) | Executive-level platform, regional, security, delivery and SRE view |
| Request & event flow | [`request-event-flow.mmd`](request-event-flow.mmd) | Synchronous API request plus asynchronous clinical-event processing |
| Deployment flow | [`deployment-flow.mmd`](deployment-flow.mmd) | CI/CD, security gates, supply-chain provenance and GitOps promotion |
| Disaster recovery | [`DR-flow.mmd`](DR-flow.mmd) | Warm-standby regional recovery sequence and abort conditions |

## Authoritative documentation

- [`docs/architecture/overview.md`](../docs/architecture/overview.md)
- [`docs/architecture/production.md`](../docs/architecture/production.md)
- [`docs/architecture/request-flow.md`](../docs/architecture/request-flow.md)
- [`docs/architecture/deployment-flow.md`](../docs/architecture/deployment-flow.md)
- [`docs/architecture/disaster-recovery.md`](../docs/architecture/disaster-recovery.md)

## Exporting images

The `.mmd` files are plain Mermaid sources and render directly in Mermaid-compatible tooling. For LinkedIn Featured, export the architecture overview as a **1920×1080 PNG** and use it as the executive architecture visual.

Recommended portfolio exports:

- `architecture-overview.png` — LinkedIn / portfolio hero visual
- `request-event-flow.png` — technical request/event walkthrough
- `deployment-flow.png` — DevSecOps/GitOps evidence
- `DR-flow.png` — resilience/DR evidence

Keep exported images synchronized with the Mermaid sources. The repository intentionally keeps the sources as text so the architecture remains reviewable, diffable and maintainable in Git.
