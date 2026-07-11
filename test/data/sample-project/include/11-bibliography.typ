#import "../../../../source/designdoc/source/block/bibliography.typ": references

// Definition
#let bib_hide = false
#let bib_data = "/test/data/sample-project/include/11-bibliography.yml"

#show: references.with(
  hide: bib_hide,
  data: bib_data,
)
