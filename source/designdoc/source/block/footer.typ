#import "../global/constants.typ": *

#let footer_el(
  body,
) = {[
  #align(center)[
    #block()[
      #counter(page).display()
    ]
  ]
  #body
]}
