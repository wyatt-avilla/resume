#import "../spacing.typ": tight-line-gap
#import "../utils.typ": ext, italic-title-hanging-row, row, section

#let education() = section(
  "Education",
)[
  #row(
    text(size: 8.9pt, weight: "bold")[San José State University],
    text(style: "italic")[Aug 2025 - May 2027],
  )
  #v(tight-line-gap)
  #row[
    #text(style: "italic")[Major:] M.S Software Engineering, specializing in networking software
  ][
    #text(weight: "bold")[CGPA: 4.0]
    #link(
      "https://github.com/wyatt-avilla/resume/blob/main/assets/sjsu_unofficial_transcript.pdf",
    )[ Transcript #ext]
  ]
  #v(tight-line-gap)
  #italic-title-hanging-row(
    [Relevant Courses],
    [Database Systems, Operating System Design, Computer Network Design],
  )

  #v(0em)

  #row(
    text(size: 8.9pt, weight: "bold")[University of California, Santa Cruz],
    text(style: "italic")[Sept 2021 - June 2025],
  )
  #v(tight-line-gap)
  #row[
    #text(style: "italic")[Major:] B.S. Cognitive Science, specializing in AI & HCI
  ][
    #text(weight: "bold")[CGPA: 3.9]
    #link(
      "https://github.com/wyatt-avilla/resume/blob/main/assets/ucsc_official_transcript.pdf",
    )[ Transcript #ext]
  ]
  #v(tight-line-gap)
  #text(style: "italic")[Minor:] Computer Science
  #v(tight-line-gap)
  #italic-title-hanging-row(
    [Relevant Courses],
    [
      Data Structures & Algorithms, Object Oriented Programming, Parallel Programming,
      Computer System Design, Artificial Intelligence
    ],
  )
]
