#import "../spacing.typ": bullet-item-gap, multiline-leading, tight-line-gap
#import "../utils.typ": row, section

#let bullet-list(items) = {
  set par(leading: multiline-leading, justify: false)
  for item in items {
    grid(
      columns: (0.7em, 1fr),
      column-gutter: 0.18em,
      align(top)[•], item,
    )
    v(bullet-item-gap)
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
