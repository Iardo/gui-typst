#import "../include/00-metadata.typ": *
#import "../../../../source/designdoc/source/block/cover.typ": cover

#show: cover.with(
  title: title,
  auth: (auth),
  uuid: uuid,
  version: version,
  caption: caption,
  abstract: abstract,
)
