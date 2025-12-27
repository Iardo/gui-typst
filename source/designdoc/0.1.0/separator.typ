#import "./@global.typ": *

#let separator_with_title(
  title: "",
  body,
) = {[
  #block()[
    #block(below: 0.6em)[
      #text(weight: 600)[#box[
        #title
      ]]
    ]
    #block(below: 0.0em)[
      #line(length: 100%, stroke: strokesize-separator)
    ]
  ]
  #body
]}
