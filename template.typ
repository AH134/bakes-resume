#import "src/main.typ": resume

#let author = "Bake Jones"
#let phone = "123-456-7890"
#let email = "bobjones@example.com"
#let linkedin = "linkedin.com/in/bakejones"
#let github = "github.com/bakejones"

#show: resume.with(
  author: author,
  phone: phone,
  email: email,
  linkedin: linkedin,
  github: github,
)

#lorem(10)

