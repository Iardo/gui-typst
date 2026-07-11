#import "../global/constants.typ": *

// References
// ----
#let set-references(body) = {
  show ref: it => {
    if query(it.target).len() == 0 {
      "[" + str(it.target) + "]" // Fallback plain text if the target doesn't exist
    } else {
      it
    }
  }
  
  body
}
