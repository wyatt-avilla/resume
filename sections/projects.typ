#import "../utils.typ": project, section

#let projects() = section("Projects")[
  #project(
    [Circuit Breaker Labs CLI],
    "https://github.com/circuitbreakerlabs/cli",
    [January 2026 - Present],
    [Built and shipped `cbl`, the public Rust CLI for Circuit Breaker Labs' AI safety platform, connecting to a deployed FastAPI service over WebSockets with typed protocol envelopes, API-key authentication, and version negotiation. Implemented an async engine using `tokio::select!` and `JoinSet`, with model providers abstracted behind a shared trait supporting OpenAI, Ollama, and Rhai-scripted integrations. Shipped Ratatui progress displays, 79 tests, and cargo-dist releases targeting Apple Silicon, Intel macOS, Linux musl, and Windows MSVC.],
  )

  #project(
    [Type-Safe REST API with ESP32 Client Integration],
    "https://github.com/wyatt-avilla/hypha",
    [June 2025],
  )[
    Built a Rust REST API with Actix Web for monitoring systemd services, sharing types with ESP32 firmware for
    compile-time-safe client/server communication. Implemented asynchronous message passing with Embassy for low
    power consumption and packaged the server as a configurable NixOS service with a real-time monitoring CLI.
  ]

  #project(
    [Open Source Contributor for Assembly Reverse Engineering],
    "https://github.com/search?q=repo%3Adoldecomp%2Fmelee++author%3Awyatt-avilla&type=pullrequests&ref=advsearch",
    [January 2024 - April 2024],
  )[
    Contributed 10 pull requests translating 2,800 lines of PowerPC assembly into 3,200 lines of C for
    #text(style: "italic")[Super Smash Bros. Melee]. Ensured byte-perfect accuracy through GitHub Actions CI that
    validated the compiled binary against the original and collaborated through code reviews with a distributed team.
  ]
]
