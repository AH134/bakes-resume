#let resume(
  author: "author",
  phone: "123-456-7890",
  email: "email@example.com",
  linkedin: "linkedin.com/in/author",
  github: "github.com/author",
  page-settings: (
    paper: "us-letter",
    font: "New Computer Modern",
    font-size: 11pt,
    author-font-size: 24pt,
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
    text(size: 13pt, weight: "light")[#smallcaps(it)]
    v(-1em)
    line(length: 100%, stroke: 0.05em)
  }

  // format a header item depending on their type (e.g. phone, email, url)
  let header-item(value, url-scheme: "") = {
    if value == "" {
      return
    }

    text(size: 10pt)[
      #if link == "" {
        value
      } else if url-scheme == "https://" or url-scheme == "mailto:" {
        show link: underline
        link(url-scheme + value)[#value]
      } else {
        link(url-scheme + value)[#value]
      }
    ]
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
  header-items-list.filter(x => x != "").join("|")

  set par(justify: true)
  doc
}

#let date-format(start-date: "2025", end-date: "Present") = {
  if end-date == "Present" or end-date == "" {
    start-date + " - Present"
  } else {
    start-date + " - " + end-date
  }
}

#let education-item(
  name: "University Name",
  degree: "Degree Name",
  location: "City, State/Province",
  start-date: "Start Date",
  end-date: "End Date",
) = {
  pad(left: 1em, right: 1em)[
    #grid(
      columns: (1fr, auto),
      align(left)[
        #text(weight: "bold")[#name] \
        #text(style: "italic")[#degree] \
      ],
      align(right)[
        #location \
        #text(style: "italic")[
          #date-format(start-date: start-date, end-date: end-date)
        ] \
      ],
    )
  ]
}

#let skill-item(
  category: "Category Name",
  skills: ("Skill 1", "Skill 2", "Skill 3"),
) = {
  set block(above: 0.6em)
  pad(left: 1em, right: 1em)[
    #set align(left)
    #block()[
      #text(weight: "bold")[#category:]
      #skills.join(", ")
    ]
  ]
}

#let project-item(
  name: "Project Name",
  technologies: ("Tech 1", "Tech 2"),
  start-date: "Start Date",
  end-date: "End Date",
  points: ("Did something cool", "Did another thing"),
) = {
  pad(left: 1em, right: 1em)[
    #grid(
      columns: (1fr, auto),
      align(left)[
        #block()[
          #text(weight: "bold")[#name]
          |
          #text(style: "italic")[#technologies.join(", ")]
        ]

        #set block(above: 0.6em)
        #pad(left: 1em)[
          #list(..points)
        ]
      ],
      align(right)[
        #date-format(start-date: start-date, end-date: end-date)
      ],
    )

  ]
}

#let work-item(
  company: "Company Name",
  position: "Job Title",
  start-date: "Start Date",
  end-date: "End Date",
  location: "City, State/Province",
  points: ("Did something cool", "Did another thing"),
) = {
  pad(left: 1em, right: 1em)[
    #grid(
      columns: (1fr, auto),
      align(left)[
        #block()[
          #text(weight: "bold")[#position]
          #linebreak()
          #text(style: "italic")[#position]
        ]

        #set block(above: 0.6em)
        #pad(left: 1em)[
          #list(..points)
        ]
      ],
      align(right)[
        #date-format(start-date: start-date, end-date: end-date)
      ],
    )
  ]
}
