#import "../global/constants.typ": *

// Outline
// ----
#let set-outline(body) = {
  show outline: set text(size: textsize-outline)
  show outline: set underline(stroke: 0pt)
  show outline.entry: it => {
    let prefix = it.prefix()
    let separator
    if it.element.func() != figure {
      separator = " - "
    } else {
      if        it.element.kind == image {
        prefix    = "Figura"
        separator = ": "
      } else if it.element.kind == table {
        prefix    = "Tabla"
        separator = ": "
      }
    }
    block(below: space-list)[
      #link(it.element.location())[
        #text(font: font-serif, fill: black, weight: 400)[#it.indented(none, prefix + separator + it.inner())]
      ]
    ]
  }
  
  body
}
