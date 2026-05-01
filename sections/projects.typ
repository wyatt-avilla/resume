#import "../utils.typ": project, section

#let projects() = section("Projects")[
  #project(
    [Discord Bot with LLM Tool-Calling Integration],
    "https://github.com/wyatt-avilla/claude-discord-bot",
    [August 2025],
  )[
    Built a Discord bot in Rust enabling Anthropic's Claude to take actions in Discord servers through tool calling,
    featuring image analysis, message reactions, and configurable interaction patterns with per-server configuration
    management and probabilistic autonomous responses. Exposed as a NixOS service and packaged with Nix flakes.
  ]

  #project(
    [Type-Safe REST API with ESP32 Client Integration],
    "https://github.com/wyatt-avilla/hypha",
    [June 2025],
  )[
    Built a production-ready REST API in Rust using Actix Web to monitor systemd service statuses, with shared type
    definitions ensuring compile-time safety between server and ESP32 client firmware. Implemented asynchronous
    message-passing architecture using Embassy for low-power consumption, packaged as a configurable NixOS service
    with CLI interface for real-time system monitoring.
  ]

  #project(
    [Open Source Contributor for Assembly Reverse Engineering],
    "https://github.com/search?q=repo%3Adoldecomp%2Fmelee++author%3Awyatt-avilla&type=pullrequests&ref=advsearch",
    [January 2024 - April 2024],
  )[
    Contributed 10 pull requests translating 2,800 lines of PowerPC assembly into 3,200 lines of C code for
    reverse-engineering #text(style: "italic")[Super Smash Bros. Melee]. Ensured byte-perfect accuracy through
    GitHub Actions CI that validated the compiled binary against the original. Collaborated through code reviews
    with distributed team of developers.
  ]
]
