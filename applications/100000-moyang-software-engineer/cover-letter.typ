#import "/template/cover-letter.typ": *

#let author = "Bake Jones"
#let phone = "123-456-7890"
#let email = "bjones@example.com"
#let linkedin = "linkedin.com/in/bjones"
#let github = "github.com/bjones"

#show: main-cover.with(
  author: author,
  phone: phone,
  email: email,
  linkedin: linkedin,
  github: github,
)

#employer-detail(
  hr-manager: "Hiring Manager",
  contact-title: "Recruiting Team",
  company: "Moyang Software",
  job-title: "Software Engineer",
  address: (
    street: "123 Example Street",
    city: "Vancouver",
    province: "BC",
    postal-code: "V6B 1A1",
  ),
)

#introduction(hr-manager: "Hiring Manager")[
  I am writing to express my interest in the Software Engineer position at Moyang Software. I am excited by the opportunity to contribute to a team building thoughtful, reliable software that solves real user problems.
  #v(1em)
  My background includes developing web applications, shipping backend systems, and working across product and engineering teams. I enjoy building clean, scalable solutions and collaborating with others to turn technical ideas into production-ready work.
]

#body[
  In my recent work, I have designed and maintained services that improved performance, simplified developer workflows, and supported customer-facing features. I am especially motivated by roles where engineering craftsmanship, clear communication, and user impact all matter.
  #v(1em)
  I would welcome the opportunity to bring my experience in software development, problem solving, and team collaboration to Moyang Software. Thank you for considering my application. I look forward to the possibility of speaking with you about how I can contribute to your team.
]

#conclusion[
  Thank you for your time and consideration.
]
