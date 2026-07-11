#import "../global/constants.typ": *

// Table
// ----
#let set-table(body) = {
  show table: set text(font: font-link, size: textsize-table, weight: 300)
  show table: set underline(stroke: 0pt)
  set table(
    inset: 5pt,
    stroke: (x, y) => {
      if y != 0 { (bottom: strokesize-table) } else { (top:  strokesize-table, bottom: 1pt) }
      if x  > 0 { (left:   strokesize-table) }
    },
  )
  
  body
}
