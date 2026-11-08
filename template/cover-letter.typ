#let main-cover(
  author: "author",
  phone: "123-456-7890",
  email: "email@example.com",
  linkedin: "linkedin.com/in/author",
  github: "github.com/author",
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
    margin: page-settings.margin,
  )
  set text(
    font: page-settings.font,
    size: page-settings.font-size,
  )

  show heading.where(level: 1): it => {
    set align(left)
    text(weight: "light")[#smallcaps(it)]
    v(-1em)
    line(length: 100%, stroke: 0.05em)
  }

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
    header-item("Vancouver, BC", url-scheme: "str"),
    header-item(phone, url-scheme: "tel:"),
    header-item(email, url-scheme: "mailto:"),
    header-item(linkedin, url-scheme: "https://"),
    header-item(github, url-scheme: "https://"),
  )

  set align(center)
  text(size: page-settings.author-font-size, weight: "bold")[#author]
  linebreak()
  header-items-list.filter(x => x != "").join(" | ")
  v(1em)

  set par(justify: false)
  set align(left)

  datetime.today().display("[month repr:long] [day], [year]")
  v(1em)

  doc

  block()[
    Sincerely, \
    #author
  ]
}

#let employer-detail(
  hr-manager: "John Doe",
  contact-title: none,
  company: "MC Nexus Inc.",
  job-title: "SIAT - Web Developer Co-op",
  address: (),
) = {
  // 1. Build a clean list of address lines, ignoring missing fields
  let address-lines = ()

  if address.at("street", default: none) != none {
    address-lines.push(address.street)
  }

  if (
    address.at("city", default: none) != none
      or address.at("province", default: none) != none
      or address.at("postal-code", default: none) != none
  ) {
    let parts = ()
    if address.at("city", default: none) != none { parts.push(address.city) }
    if address.at("province", default: none) != none { parts.push(address.province) }
    if address.at("postal-code", default: none) != none { parts.push(address.postal-code) }
    address-lines.push(parts.join(", "))
  }

  // 2. Render everything with consistent, tight spacing
  let header-lines = (
    hr-manager,
    contact-title,
    company,
  ).filter(x => x != none)

  stack(
    dir: ttb,
    spacing: 0.5em, // Controls the uniform gap between every visible line
    ..header-lines,
    ..address-lines,
  )

  v(1em)
  if job-title != none { text(weight: "bold")[Re: #job-title] }
  v(1em)
}

#let introduction(hr-manager: "John Doe", is-dr: false, is-ms: false, is-mr: false, is-mrs: false, body) = {
  let parts = hr-manager.split(" ")
  let last-name = parts.at(-1)

  let addressee = if is-dr { "Dr. " + hr-manager } else if is-ms { "Ms. " + last-name } else if is-mr {
    "Mr. " + last-name
  } else if is-mrs { "Mrs. " + last-name } else { hr-manager }

  block()[
    Dear #addressee,
    #v(1em)
  ]

  body
  v(1em)
}

#let body(body) = {
  body
  v(1em)
}

#let conclusion(body) = {
  body
  v(1em)
}
