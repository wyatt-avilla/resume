#set document(author: "Wyatt Avilla", title: "Resume")

#import "utils.typ": ext, separator

#set page(
  paper: "us-letter",
  margin: (left: 0.5in, top: 0.38in, right: 0.5in, bottom: 0.34in),
  footer: align(right)[
    #link("https://github.com/wyatt-avilla/resume")[
      #box(
        inset: (x: 4pt, y: 1.5pt),
        radius: 2pt,
        stroke: 0.4pt + rgb("#aaaaaa"),
      )[
        #text(
          size: 5.2pt,
          weight: "bold",
          tracking: 0.08em,
          fill: rgb("#555555"),
        )[THIS RÉSUMÉ IS BUILT WITH CI AND VERSION-CONTROLLED]
      ]
      #h(2pt)
      #box[#move(dy: -0.8pt)[#ext]]
    ]
  ],
)
#set text(font: "TeX Gyre Heros", size: 8.55pt)
#set par(leading: 0.22em, justify: false)

#let resume-header = align(center)[
  #v(-2em)
  #text(size: 16.2pt, weight: "bold")[Wyatt Avilla] \
  #v(-0.7em)
  #text(size: 9pt, fill: rgb("#444444"))[
    (408) 506-2189 | #link("mailto:wyatt@linux.com")[wyatt\@linux.com] |
    #link("https://github.com/wyatt-avilla")[github.com/wyatt-avilla] |
    #link("https://www.linkedin.com/in/wyatt-avilla/")[linkedin.com/in/wyatt-avilla] |
    #link("https://www.wyattavilla.dev")[wyattavilla.dev]
  ]
  #v(-0.5em)
]

#import "sections/education.typ": education
#import "sections/skills.typ": skills
#import "sections/work-experience.typ": work-experience
#import "sections/projects.typ": projects

#resume-header
#v(0.04em)
#separator

#education()
#skills()
#work-experience()
#projects()
