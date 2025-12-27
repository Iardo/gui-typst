#import "./@global.typ": *

#let table-of-tables(
  hide: false,
  body,
) = {[
  #if hide != true {
    page(
      align(left)[
        #block(width: 100%)[
          #show outline: set heading(numbering: number-heading, outlined: true)
          #outline(
            target: figure.where(kind: table),
            title: [Lista de Tablas],
          )
        ]
      ]
    )
  }
  #body
]}
