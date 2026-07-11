#import "../global/constants.typ": *

// Block
// ----
#let set-block(body) = {
  set block(spacing: space-leading)
  
  body
}
