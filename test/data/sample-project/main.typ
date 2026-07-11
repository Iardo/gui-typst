#import "./include/00-metadata.typ": *
#import "../../../source/designdoc/source/util/numbers.typ": *
#import "../../../source/designdoc/source/theme/set-block.typ": *
#import "../../../source/designdoc/source/theme/set-figure.typ": *
#import "../../../source/designdoc/source/theme/set-heading.typ": *
#import "../../../source/designdoc/source/theme/set-link.typ": *
#import "../../../source/designdoc/source/theme/set-list.typ": *
#import "../../../source/designdoc/source/theme/set-outline.typ": *
#import "../../../source/designdoc/source/theme/set-page.typ": *
#import "../../../source/designdoc/source/theme/set-paragraph.typ": *
#import "../../../source/designdoc/source/theme/set-references.typ": *
#import "../../../source/designdoc/source/theme/set-table.typ": *
#import "../../../source/designdoc/source/theme/set-text.typ": *

// Config
// ---------------
#show: set-block
#show: set-figure
#show: set-heading
#show: set-link
#show: set-list
#show: set-outline
#show: set-page
#show: set-paragraph
#show: set-references
#show: set-table
#show: set-text
#show: set-text-raw

// Document
// ----
#set document(
  title: [#title],
  author: auth,
  date: datetime.today(),
)

// Content
// ---------------
#include "./include/00-metadata.typ"
#include "./include/01-cover.typ"
#include "./include/02-table-of-contents.typ"
#init_page_numbering()
#include "./include/03-introduction.typ"
#include "./include/04-architecture.typ"
#include "./include/05-design.typ"
#include "./include/06-dependencies.typ"
#include "./include/07-appendix.typ"
#include "./include/08-glossary.typ"
#include "./include/09-table-of-figures.typ"
#include "./include/10-table-of-tables.typ"
#include "./include/11-bibliography.typ"
