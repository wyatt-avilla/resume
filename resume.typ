#set document(author: "Wyatt Avilla", title: "Resume")
#set page(
  paper: "us-letter",
  margin: (left: 0.62in, top: 0.38in, right: 0.62in, bottom: 0.34in),
)
#set text(font: "TeX Gyre Heros", size: 8.55pt)
#set par(leading: 0.22em, justify: false)

#let separator = {
  line(length: 100%, stroke: 0.55pt + rgb("#777777"))
  v(-0.28em)
}
#let ext = text(size: 6.5pt, baseline: 1.5pt)[↗]
#let resume-header = align(center)[
  #text(size: 16.2pt, weight: "bold")[Wyatt Avilla] \
  #text(size: 9pt, fill: rgb("#444444"))[
    (408) 506-2189 | #link("mailto:wyatt@linux.com")[wyatt\@linux.com] |
    #link("https://github.com/wyatt-avilla")[github.com/wyatt-avilla #ext]
  ]
]

#let section(title, body) = {
  v(-0.9em)
  text(size: 10.9pt, weight: "bold")[#upper(title)]
  v(-1em)
  body
  v(-0.08em)
  separator
}

#let row(left, side) = grid(
  columns: (1fr, auto),
  column-gutter: 1em,
  left, align(right)[#side],
)

#let skill-row(label, body) = {
  grid(
    columns: (auto, 1fr),
    column-gutter: 0.25em,
    text(style: "italic")[#label:], body,
  )
  v(-0.8em)
}

#let bullet-list(items) = {
  set par(leading: 0.38em, justify: false)
  for item in items {
    grid(
      columns: (0.7em, 1fr),
      column-gutter: 0.18em,
      align(top)[•], item,
    )
    v(-0.67em)
  }
}

#let job(title, dates, company, items) = {
  row(text(size: 8.9pt, weight: "bold")[#title], dates)
  v(-0.8em)
  text(style: "italic")[#company]
  v(-0.8em)
  bullet-list(items)
  v(0em)
}

#let project(title, url, dates, body) = {
  row(text(size: 8.9pt, weight: "bold")[#link(url)[#title #ext]], dates)
  v(-0.8em)
  body
  v(-0.55em)
}

#resume-header
#v(0.04em)
#separator

#section("Education")[
  #row(
    text(size: 8.9pt, weight: "bold")[San José State University],
    text(style: "italic")[Aug 2025 - May 2027],
  )
  #v(-0.8em)
  #row[
    #text(style: "italic")[Major:] M.S Software Engineering, specializing in networking software
  ][
    #text(weight: "bold")[CGPA: 4.0]
    #link(
      "https://github.com/wyatt-avilla/resume/blob/main/assets/sjsu_unofficial_transcript.pdf",
    )[ Transcript #ext]
  ]
  #v(-0.8em)
  #skill-row(
    [Relevant Courses],
    [Database Systems, Operating System Design, Computer Network Design],
  )

  #v(0em)

  #row(
    text(size: 8.9pt, weight: "bold")[University of California, Santa Cruz],
    text(style: "italic")[Sept 2021 - June 2025],
  )
  #v(-0.8em)
  #row[
    #text(style: "italic")[Major:] B.S. Cognitive Science, specializing in AI & HCI
  ][
    #text(weight: "bold")[CGPA: 3.9]
    #link(
      "https://github.com/wyatt-avilla/resume/blob/main/assets/ucsc_official_transcript.pdf",
    )[ Transcript #ext]
  ]
  #v(-0.8em)
  #text(style: "italic")[Minor:] Computer Science
  #v(-0.8em)
  #skill-row(
    [Relevant Courses],
    [
      Data Structures & Algorithms, Object Oriented Programming, Parallel Programming,
      Computer System Design, Artificial Intelligence
    ],
  )
]

#section("Skills")[
  #skill-row(
    [Programming Languages],
    [Python, C, Rust, C++, Shell, Nix, Lua, SQL],
  )
  #skill-row(
    [Software & Tools],
    [Git, Linux, GitHub Actions, Docker, NixOS, SQLite, systemd],
  )
  #skill-row(
    [Frameworks & Libraries],
    [Pandas, LangChain, asyncio, NumPy, Actix Web, Embassy],
  )
]

#section("Work Experience")[
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

#section("Projects")[
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
