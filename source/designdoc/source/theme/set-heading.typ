#import "../global/constants.typ": *

// Heading
// ----
#let set-heading(body) = {
  set heading(numbering: number-heading)
  show heading: it => {
    let size = heading-size-1
    let weight = "bold"
    let prefix = ""

    set text(font: font-heading)

    if        it.level == 1 {
      size   = heading-size-1
      weight = heading-weight-1
    } else if it.level == 2 {
      size   = heading-size-2
      weight = heading-weight-2
    } else if it.level == 3 {
      size   = heading-size-3
      weight = heading-weight-3
    } else if it.level == 4 {
      size   = heading-size-4
      weight = heading-weight-4
    } else if it.level == 5 {
      size   = heading-size-5
      weight = heading-weight-5
    } else if it.level == 6 {
      size   = heading-size-6
      weight = heading-weight-6
    }

    if it.numbering != none {
      if counter(heading).get().at(0) > 0 and it.level == 1 {
        prefix = counter(heading).display()
        prefix += ". "
      }
    }
    block(below: space-heading)[
      #text(size: size, weight:weight)[#prefix#it.body]
      #linebreak()
    ]
  }
  
  body
}
