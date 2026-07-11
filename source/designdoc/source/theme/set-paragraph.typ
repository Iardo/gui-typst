#import "../global/constants.typ": *

// Paragraph
// ----
#let set-paragraph(body) = {
  set par(leading: space-leading, justify: false, linebreaks: "optimized")
  
  body
}
