#import "./@global.typ": *

#let header_el(
  title: "",
  version: "",
  body,
) = {[
  #block()[
    #text(size: 9pt, style: "italic")[#title]
    #text(size: 8pt, style: "italic", font: font-mono)[v#version]
    #h(1fr)
    #block(above: 0.4em, below: 0.6em)[#line(length: 100%, stroke: strokesize-separator)]
  ]
  #body
]}
