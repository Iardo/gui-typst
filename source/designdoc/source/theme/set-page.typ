#import "../global/constants.typ": *
#import "../block/header.typ": header_el
#import "../block/footer.typ": footer_el

// Page
// ----
#let set-page(body) = {
  set page(
    numbering: number-page,
    margin: (x: 2cm, y: 2.5cm),
    header: context {
      if counter(page).get().first() > 1 [
        #show: header_el.with(
          title: title,
          version: version,
        )
      ]
    },
    footer: context {
      show: footer_el.with()
    }
  )
  
  body
}
