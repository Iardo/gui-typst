#import "./@global.typ": *

#let frontpage(
  title: "",
  auth:  (),
  uuid:  "",
  date:  datetime.today(),
  version: none,
  caption: "",
  abstract: [],
  body,
) = {[
  #page(
    numbering: none,
    header: none,
    footer: context [
      #show table: set text(font: font-serif, size: 1.2em)
      #table(
        columns: (1fr, 1fr, 1fr),
        align: (left + horizon, center + horizon, right + horizon),
        stroke: none,
        fill: none,
        [],
        [
          // Date
          #block()[
            #text(font: font-serif, weight: 600)[#box[
                #datetime.today().display("[month repr:long] [year]")
              ]
            ]
          ]
        ],
        [
          // Version
          #block(below: 4.0mm)[
          #rect(fill: black, radius: 0pt, inset: 4pt, outset: 0pt)[
            #text(font: (font-mono), size: 1em, fill: white)[#version]
          ]
        ]
        ],
      )
    ],
    align(left + horizon)[
      #block(width: 100%)[
        // Caption
        #set par(leading: 0.32em)
        #block(below: 6.0mm)[
          #text(size: 1.4em)[#underline(offset: 2pt)[#box[
            #caption
          ]]]
        ]
        // Title
        #block(below: 5.5mm)[
          #text(size: 4.0em, hyphenate: true, weight: 500)[#box[
            #title
          ]]
        ]
        // Abstract
        #if abstract != none {
          block(below: 1.0cm, spacing: 0.32em)[
            #set text(size: 1.2em, hyphenate: true)
            #abstract
          ]
        }
        // Author
        #block()[
          #text(size: 1.0em)[#box[
            #if type(auth) != array {
              [#auth]
            } else {
              [#auth.join(", ")]
            }
          ]]
        ]
      ]
    ]
  )
  #body
]}
