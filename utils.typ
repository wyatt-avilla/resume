#import "spacing.typ": (
  entry-gap, multiline-leading, section-bottom-gap, section-title-gap,
  section-top-gap, separator-gap, tight-line-gap,
)

#let separator = {
  line(length: 100%, stroke: 0.55pt + rgb("#777777"))
  v(separator-gap)
}

#let ext = text(size: 6.5pt, baseline: -0.15em)[]

#let section(title, body) = {
  v(section-top-gap)
  text(size: 10.9pt, weight: "bold")[#upper(title)]
  v(section-title-gap)
  body
  v(section-bottom-gap)
  separator
}

#let row(left, side) = grid(
  columns: (1fr, auto),
  column-gutter: 1em,
  left, align(right)[#side],
)

#let italic-title-hanging-row(label, body) = {
  set par(leading: multiline-leading, justify: false)
  grid(
    columns: (auto, 1fr),
    column-gutter: 0.25em,
    text(style: "italic")[#label:], body,
  )
  v(tight-line-gap)
}

#let project(title, url, dates, body) = {
  row(text(size: 8.9pt, weight: "bold")[#link(url)[#title #ext]], dates)
  v(tight-line-gap)
  set par(leading: multiline-leading, justify: false)
  body
  v(entry-gap)
}
