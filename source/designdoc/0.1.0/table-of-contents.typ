#import "./@global.typ": *

#let table-of-contents(
  hide: false,
  body,
) = {[
  #if hide != true {
    page(
      numbering: none,
      header: none,
      footer: none,
      align(left)[
        #block(width: 100%)[
          #outline(
            title: [Contenido],
          )
        ]
      ]
    )
  }
  #body
]}
