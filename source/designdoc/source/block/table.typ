#import "../global/constants.typ": *

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
