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
      [Implemented model-provider call tracking across OpenAI, OpenRouter, and WebSocket client providers, capturing prompt contents, token counts, and errors to power precise API expenditure calculation and link generated tests and evaluated responses back to underlying model calls],
      [Designed and migrated PostgreSQL schemas for users, API keys, test cases, generation records, test results, provider-call logs, and quotas using SQLAlchemy async and Alembic],
      [Packaged and deployed the API with Nix flakes, uv2nix, a NixOS service module, systemd, PostgreSQL, agenix-managed secrets, nginx TLS/WebSocket proxying, and Prometheus/Alertmanager alerting, reducing build size from 17GB to 1GB and build time from 5+ hours to under a minute by removing CUDA dependencies and pinning Nix inputs],
      [Refactored evaluation and provider functions to errors-as-values, enabling per-test-case error reporting, and debugged production-only request hanging caused by HTTP client timeout and resource-leak issues only surfacing after extended server uptime],
      [Established CI/CD across Python and Nix codebases with GitHub Actions workflows for Ruff, strict Mypy, pytest coverage, Nix builds, statix, and nixfmt],
      [Built the public Rust cbl CLI client for the evaluation platform, implementing async WebSocket orchestration, multi-provider abstraction, and cross-platform release automation (see Projects)],
    ),
  )

  #job(
    [Backend Developer Intern],
    [Sept 2024 - Dec 2024],
    [Lillup],
    (
      [Built a FastAPI backend with LangChain integration for LLM tool calling, enabling the model to dynamically query user data through a RESTful endpoint that processed multi-turn conversations with tool execution],
      [Designed and implemented custom tool definitions with automated response parsing, handling JSON deserialization of LLM outputs into function arguments and returning structured responses],
      [Extended Markdown syntax using markdown-it-py and regex parsing to support structured metadata (tags, progress indicators, due dates) for improved LLM context in time-sensitive applications],
      [Established code quality standards with static typing (Mypy), Ruff for formatting/linting, and automated CI/CD pipeline through GitHub Actions],
    ),
  )

  #job(
    [Programming Course Developer & Tutor],
    [July 2024 - June 2025],
    [University of California, Santa Cruz],
    (
      [Independently migrated 4 programming assignments and 12 assessments (∼2,000 lines) from C++ to Python, ensuring 100% test compatibility across 1,600+ test cases while implementing modern Python idioms including static typing, generics, comprehensions, and lazy evaluation],
      [Led group tutoring sessions for data structures and algorithms, focusing on problem-solving strategies for technical interview preparation],
    ),
  )
]
