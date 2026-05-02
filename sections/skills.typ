#import "../utils.typ": italic-title-hanging-row, section

#let skills() = section("Skills")[
  #italic-title-hanging-row(
    [Programming Languages],
    [Python, Rust, C, C++, SQL, Nix, Lua, Shell],
  )
  #italic-title-hanging-row(
    [Backend & APIs],
    [FastAPI, Axum, WebSockets, REST, SQLAlchemy, Alembic, Pydantic, asyncio, asyncpg, Uvicorn, Tokio],
  )
  #italic-title-hanging-row(
    [Databases],
    [PostgreSQL, SQLite, InfluxDB, MongoDB, MariaDB, MySQL],
  )
  #italic-title-hanging-row(
    [AI & ML],
    [LangChain, LLM Evaluation, Hugging Face, OpenAI API, Ollama, Tool Calling],
  )
  #italic-title-hanging-row(
    [Infrastructure & DevOps],
    [NixOS, Nix Flakes, systemd, nginx, Docker, GitHub Actions, Prometheus, CI/CD],
  )
  #italic-title-hanging-row(
    [Concepts],
    [Concurrency, Async Programming, WebSocket Protocols, Distributed Systems, Networking, IoT, Embedded Systems],
  )
]
