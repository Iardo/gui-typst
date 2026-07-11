#import "../global/constants.typ": *

// Figure
// ----
#let set-figure(body) = {
  show figure: set figure.caption(position: top)
  show figure: it => block()[
    #set align(left)
    #if       it.kind == table {
      [Tabla]
    } else if it.kind == image {
      [Figura]
    } else {
      it.supplement
    }
    #it.counter.display(it.numbering):
    #it.caption.body
    #it.body
  ]
  
  body
}
