#import "../global/constants.typ": *

// Link
// ----
#let set-link(body) = {
  show link: it => {
    text(font: font-sans, size: textsize-link, weight: 500, fill: color-link)[#box[
      #underline()[#it]
    ]]
  }
  
  body
}
