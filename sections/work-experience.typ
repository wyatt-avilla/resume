#import "../spacing.typ": multiline-leading, tight-line-gap
#import "../utils.typ": row, section

#let bullet-list(items) = {
  set par(leading: multiline-leading, justify: false)
  for item in items {
    grid(
      columns: (0.7em, 1fr),
      column-gutter: 0.18em,
      align(top)[•], item,
    )
    v(tight-line-gap)
  }
}

#let job(title, dates, company, items) = {
  row(text(size: 8.9pt, weight: "bold")[#title], dates)
  v(tight-line-gap)
  text(style: "italic")[#company]
  v(tight-line-gap)
  bullet-list(items)
  v(0em)
}

#let work-experience() = section("Work Experience")[
  #job(
    [Member of the Technical Staff],
    [Oct 2025 - Present],
    [Circuit Breaker Labs],
    (
      [Built Circuit Breaker Labs' FastAPI evaluation platform for AI safety red-teaming, owning typed REST and WebSocket endpoints for single-turn and multi-turn LLM evaluation workflows],
      [Designed WebSocket evaluation flows with typed protocol envelopes, protocol-version validation, progress notifications, completion-request routing, and close-code error mapping, with database-backed API key authentication and monthly quota enforcement shared across REST and WebSocket handlers],
      [Implemented model-provider call tracking across OpenAI, OpenRouter, and WebSocket client providers, recording prompts, token counts, and errors to calculate API expenditure and preserve evaluation provenance],
      [Designed and migrated PostgreSQL schemas for users, API keys, test cases, generation records, test results, provider-call logs, and quotas using SQLAlchemy async and Alembic],
      [Packaged and deployed the API with Nix flakes, uv2nix, a NixOS service module, systemd, PostgreSQL, agenix-managed secrets, nginx TLS/WebSocket proxying, and Prometheus/Alertmanager alerting, reducing build size from 17GB to 1GB and build time from 5+ hours to under a minute by removing CUDA dependencies and pinning Nix inputs],
      [Refactored evaluation and provider functions to errors-as-values for per-test-case failures and diagnosed production request hangs caused by HTTP client timeouts and leaked resources after extended uptime],
      [Established CI/CD across Python and Nix codebases with GitHub Actions workflows for Ruff, strict Mypy, pytest coverage, and Nix builds],
    ),
  )

  #job(
    [Software Engineer Intern],
    [May 2026 - Aug 2026],
    [Principal Financial Group],
    (
      [Extended TypeScript Helm chart-sync automation into a general transformation subsystem that parsed upstream charts, rendered templates, and patched every container definition to drop `CAP_SYS_ADMIN`],
      [Iteratively deployed transformed charts and triaged live Kyverno admission-controller policy reports, bringing all 51 development Kubernetes resources into compliance],
      [Authored and reviewed a 6,000+-line downstream pull request demonstrating the maintenance cost of injecting the security patch, then recommended that upstream chart maintainers implement the production fix],
      [Shipped chart-sync automation that created a Jira ticket for every generated pull request and cross-linked the two records, closing a manual release-tracking gap],
      [Owned AWS infrastructure for a five-person finalist intern hackathon team, provisioning API Gateway, Lambda, Bedrock, and DynamoDB with CDK for a context-aware prompt-refinement VS Code extension],
      [Built CI checks for testing, linting, formatting, and infrastructure validation for the completed extension, which was prepared for Visual Studio Marketplace publication],
      [Deployed CDK-managed SNS alerting for production CloudFront errors at a three-event/5-minute threshold and migrated two CDK applications to the enterprise pipeline while replacing deprecated GitHub Actions steps],
      [Diagnosed GitHub deployment failures to a repository merge-strategy misconfiguration, corrected it, and validated the fix across two core repositories],
      [Integrated a session-analytics platform into a Next.js-based internal sandbox to validate customer-site tracking and performed QA on the team's no-code A/B testing platform],
    ),
  )

  #job(
    [Backend Developer Intern],
    [Sept 2024 - Dec 2024],
    [Lillup],
    (
      [Prototyped a stateless FastAPI backend integrating LangChain with a self-hosted Llama model, designing approximately 10 tools with typed JSON parsing for multi-turn interaction with structured user-profile data],
      [Extended Markdown parsing with markdown-it-py and regex to encode tags, progress indicators, and due dates as structured context for the LLM],
      [Established backend quality gates with GitHub Actions, pytest, Mypy, and Ruff for a proof-of-concept delivered to company leadership],
    ),
  )
]
