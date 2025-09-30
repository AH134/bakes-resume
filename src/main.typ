#let resume(
  author: "",
  phone: "",
  email: "",
  linkedin: "",
  github: "",
  page-settings: (
    paper: "us-letter",
    font: "New Computer Modern",
    font-size: 11pt,
    author-font-size: 20pt,
    margin: 0.5in,
  ),
  doc,
) = {
  set document(author: author, title: author + " Resume")
  set page(
    paper: page-settings.paper,
    numbering: "1",
    margin: page-settings.margin,
  )
  set text(
    font: page-settings.font,
    size: page-settings.font-size,
  )

  // format a header item depending on their type (e.g. phone, email, url)
  let header-item(value, url-scheme: "") = {
    if value == "" {
      return
    }

    if link == "" {
      value
    } else if url-scheme == "https://" or url-scheme == "mailto:" {
      show link: underline
      link(url-scheme + value)[#value]
    } else {
      link(url-scheme + value)[#value]
    }
  }

  // create a lsit of header items, filtering out any that are empty and joining with a separator "|"
  let header-items-list = (
    header-item(phone, url-scheme: "tel:"),
    header-item(email, url-scheme: "mailto:"),
    header-item(linkedin, url-scheme: "https://"),
    header-item(github, url-scheme: "https://"),
  )

  set align(center)
  text(size: page-settings.author-font-size, weight: "bold")[#author]
  linebreak()
  header-items-list.filter(x => x != "").join(" | ")

  doc
}
