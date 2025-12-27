#import "./@global.typ": *

#let references(
  hide: false,
  data: none,
  body,
) = {[
  #if data != none and hide != true {
    page(
      align(left)[
        #block(width: 100%)[
          #show bibliography: set text(font: font-serif, size: textsize-paragraph)
          #show bibliography: set heading(numbering: "1.1", outlined: true)
          #bibliography(
            data,
            title: [Bibliografía],
            style: "ieee",
          )
        ]
      ]
    )
  }
  #body
]}
