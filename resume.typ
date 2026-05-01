#set document(author: "Wyatt Avilla", title: "Resume")
#set page(
  paper: "us-letter",
  margin: (left: 0.62in, top: 0.38in, right: 0.62in, bottom: 0.34in),
)
#set text(font: "TeX Gyre Heros", size: 8.55pt)
#set par(leading: 0.22em, justify: false)

#import "utils.typ": ext, separator

#let resume-header = align(center)[
  #v(-2em)
  #text(size: 16.2pt, weight: "bold")[Wyatt Avilla] \
  #v(-0.7em)
  #text(size: 9pt, fill: rgb("#444444"))[
    (408) 506-2189 | #link("mailto:wyatt@linux.com")[wyatt\@linux.com] |
    #link("https://github.com/wyatt-avilla")[github.com/wyatt-avilla #ext]
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
