#import "../utils.typ": italic-title-hanging-row, section

#let skills() = section("Skills")[
  #italic-title-hanging-row(
    [Programming Languages],
    [Python, C, Rust, C++, Shell, Nix, Lua, SQL],
  )
  #italic-title-hanging-row(
    [Software & Tools],
    [Git, Linux, GitHub Actions, Docker, NixOS, SQLite, systemd],
  )
  #italic-title-hanging-row(
    [Frameworks & Libraries],
    [Pandas, LangChain, asyncio, NumPy, Actix Web, Embassy],
  )
]
