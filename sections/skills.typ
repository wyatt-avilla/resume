#import "../utils.typ": italic-title-hanging-row, section

#let skills() = section("Skills")[
  #italic-title-hanging-row(
    [Programming Languages],
    [Python, Rust, TypeScript, SQL, C, C++, Nix, Shell],
  )
  #italic-title-hanging-row(
    [Backend & Data],
    [FastAPI, REST, WebSockets, PostgreSQL, SQLAlchemy, Alembic, Tokio, Redis],
  )
  #italic-title-hanging-row(
    [Cloud & Platform],
    [Kubernetes, Helm, Kyverno, AWS CDK, Lambda, API Gateway, DynamoDB, SNS, CloudFront, NixOS, Docker],
  )
  #italic-title-hanging-row(
    [Tooling & Systems],
    [GitHub Actions, CI/CD, Linux, systemd, nginx, Prometheus, Concurrency, Networking],
  )
]
