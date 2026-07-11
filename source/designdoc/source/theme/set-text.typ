#import "../global/constants.typ": *

// Text
// ----
#let set-text(body) = {
  set text(font: font-serif, size: textsize-paragraph, fallback: false)
  
  body
}

// Text Raw
// ----
#let set-text-raw(body) = {
  set raw(theme: code-theme)
  show raw.where(block: true): set text(1em / 0.8)
  show raw: set text(font: font-mono, weight: 700, ligatures: true, fallback: false)
  show raw: it => {
    if it.block == false {
      it
    } else {
      block(inset: (y: space-heading))[
        #let stroke  = none
        #let inset   = 0.0pt
        #let outline = false // Toggle
        #if  outline { 
          inset  = space-xs
          stroke = (dash: "dotted", thickness: 1pt, paint: black)
        }
        #rect(inset: inset, stroke: stroke)[
          #text()[#it]
        ]
      ]
    }
  }
  
  body
}
