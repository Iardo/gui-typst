#import "../global/constants.typ": *

// Starts page numbering
// ----
#let init_page_numbering() = {[
  #counter(page).update(int(number-page))
]}
