#import "../../../../source/designdoc/source/global/constants.typ": *
#import "../../../../source/designdoc/source/block/references.typ": ref
#import "../../../../source/designdoc/source/block/separator.typ": separator_with_title
#import "../../../../source/designdoc/source/block/table.typ": table-header

#heading(level: 1)[#box[
  Diseño
]]


#heading(level: 2)[#box[
  References:
]]

En esta sección se listan los sistemas de diseño y librerías de componentes de referencia consultados durante la investigación previa al diseño.

#heading(level: 3)[#box[
  Design Systems:
]]
#list(
  box[#link("https://atlassian.design/")[Atlassian (Atlassian)] #ref(name: "ds-atlassian")],
  box[#link("https://base.uber.com/6d2425e9f/p/294ab4-base-design-system")[Base (Uber)] #ref(name: "ds-base")],
  box[#link("https://carbondesignsystem.com/")[Carbon (IBM)] #ref(name: "ds-carbon")],
  box[#link("https://m3.material.io/")[Material (Google)] #ref(name: "ds-material")],
  box[#link("https://shopify.dev/docs/api/app-home/web-components")[Polaris (Shopify)] #ref(name: "ds-polaris")],
  box[#link("https://protocol.mozilla.org/")[Protocol (Mozilla)] #ref(name: "ds-protocol")],
  box[#link("https://opensource.adobe.com/spectrum-web-components/")[Spectrum (Adobe)] #ref(name: "ds-spectrum")],
)

#heading(level: 3)[#box[
  Storybook:
]]
#list(
  link("https://www.blok.ink/")[Storyblok UI (Blok)],
  link("https://react.carbondesignsystem.com/")[Carbon (IBM) - React],
  link("https://svelte.carbondesignsystem.com/")[Carbon (IBM) - Svelte],
  link("https://vue.carbondesignsystem.com/")[Carbon (IBM) - Vue],
  link("https://web-components.carbondesignsystem.com/")[Carbon (IBM) - WebComponents],
  link("https://ec.europa.eu/component-library/playground/eu/")[Europa (European Commission)],
  link("https://ec.europa.eu/component-library/playground/ec/")[Europa (European Commission)],
  link("https://components.gilbarbara.dev/")[Components (Gilbara)],
  link("https://gitlab-org.gitlab.io/gitlab/storybook/")[Gitlab UI (Gitlab)],
  link("https://developers.grafana.com/ui/latest/index.html")[Grafana UI (Grafana)],
  link("https://wordpress.github.io/gutenberg/")[Gutenberg (Wordpress)],
  link("https://iq-tech.github.io/blueberry/")[Iq (Blueberry)],
  link("https://kiwicom.github.io/orbit/")[Kiwi (Orbit)],
  link("https://mistica-web.vercel.app/")[Mistica (Telefonica)],
  link("https://passbolt.github.io/passbolt_styleguide/")[Passbolt UI (Passbolt)],
  link("https://pharos.jstor.org/storybook/")[Pharos (JSTOR's) - WebComponents],
  link("https://polaris-viz.shopify.dev/")[Polaris Viz (Shopify)],
  link("https://react95.github.io/React95/")[Win95 UI (React95)],
  link("https://storybook.reablocks.dev/")[Reablocks (Reaviz)],
  link("https://reaflow.dev/")[Reaflow (Reaviz)],
  link("https://storybook.reagraph.dev/")[Reagraph (Reaviz)],
  link("https://jetbrains.github.io/ring-ui/master/index.html")[Ring UI (JetBrains)],
  link("https://opensource.adobe.com/spectrum-web-components/storybook/")[Spectrum (Adobe)],
)


#heading(level: 2)[#box[
  Base de Datos
]]


#heading(level: 3)[#box[
  Diagramas
]]
// #figure(
//   image("/static/image/designdoc/<name>-database.svg", width: 100%),
//   caption: [Diagrama Entidad-Relación],
//   kind: image,
// )


#pagebreak()
#heading(level: 3)[#box[
  Descripción de las tablas
]]
#let table_cell_x0_text = (font: font-mono, size: textsize-table, weight: 400)
#figure(caption: [Tabla User], kind: table)[
  #show table.cell.where(x: 0): set text(..table_cell_x0_text)
  #table(
    columns: (20%, 1fr),
    align: (left + top, left + top),
    inset: 5pt,
    table-header(
      table.cell(colspan: 2, align: center)[user],
    ),
      [],                 [],
  )
]


#pagebreak()
#heading(level: 2)[#box[
  Interfaz Gráfica
]]

