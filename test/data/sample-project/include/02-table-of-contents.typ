#import "../../../../source/designdoc/source/block/table-of-contents.typ": table-of-contents

// Definition
#let toc_hide = false

#show: table-of-contents.with(
  hide: toc_hide,
)
