// Color
// ----
#let color-link          = rgb("#1565C0")
#let color-blue-gray-50  = rgb("#BDBDBD")

// Font
// ----
#let font-serif   = "Crimson Text"
#let font-link    = "Crimson Text"
#let font-sans    = "Inter 18pt"
#let font-mono    = "Iosevka Custom"
#let font-heading = "Playfair Display"

// Numbering
// ----
#let number-page    = "1"
#let number-heading = "1.1"

// Marker
// ----
#let marker-list = [-]

// Padding
// ----
#let py-00  = v(0.0mm, weak: true)
#let py-xxs = v(0.4mm, weak: true)
#let py-xs  = v(0.8mm, weak: true)
#let py-sm  = v(1.2mm, weak: true)
#let py-md  = v(1.5mm, weak: true)
#let py-lg  = v(2.0mm, weak: true)
#let py-xl  = v(4.0mm, weak: true)

// Spacing
// ----
#let space-00      = 0.0em
#let space-xxs     = 0.4em
#let space-xs      = 0.8em
#let space-sm      = 1.2em
#let space-md      = 1.5em
#let space-lg      = 2.0em
#let space-xl      = 4.0em
#let space-heading = 0.80em
#let space-leading = 0.64em
#let space-list    = 0.64em

// Stroke
#let strokesize-separator = 0.5pt
#let strokesize-table     = 0.5pt

// Text Size
#let textsize-link      = 0.8em
#let textsize-outline   = 1.2em
#let textsize-paragraph = 1.0em
#let textsize-small     = 0.8em
#let textsize-table     = 0.9em


// Utilities
// ---------------
// Add reference by name
// ----
#let ref(
  name: ""
) = {[#box[
  #text(fill: color-link)[#super[#strong[#cite(label(name))]]]
]]}

// Starts page numbering
// ----
#let init_page_numbering() = {[
  #counter(page).update(int(number-page))
]}

// Style table.header
// ----
// https://github.com/typst/typst/issues/3640#issuecomment-2395133217
// https://github.com/typst/typst/issues/3640#issuecomment-2423819257
#let table-header(..headers) = table.header(
  ..headers.pos().map(cell => {
    if cell.func() == table.cell {
      let fields = cell.fields()
      table.cell(fill: color-blue-gray-50, [
        #text(font: font-heading, size: textsize-table, weight: 600)[#fields.remove("body")] 
      ], ..fields)
    } else {
      table.cell(fill: color-blue-gray-50)[
        #text(font: font-heading, size: textsize-table, weight: 600)[#cell]
      ]
    }
  }),
)
