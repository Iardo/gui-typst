#import "./@global.typ": *

#let table-of-figures(
  hide: false,
  body,
) = {[
  #if hide != true {
    page(
      align(left)[
        #block(width: 100%)[
          #show outline: set heading(numbering: number-heading, outlined: true)
          #outline(
            target: figure.where(kind: image),
            title: [Lista de Figuras],
          )
        ]
      ]
    )
  }
  #body
]}
