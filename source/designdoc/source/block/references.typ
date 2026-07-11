#import "../global/constants.typ": *

// Add reference by name
// ----
#let ref(
  name: ""
) = {
  context {
    // Determine whether a #bibliography(...) function has been declared anywhere in your document
    if query(bibliography).len() > 0 {
      [#box[
        #text(fill: color-link)[#super[#strong[#cite(label(name))]]]
      ]]
    }
  }
}
