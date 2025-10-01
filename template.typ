#import "src/main.typ": *

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

= Technical Skills
#skill-item()
#skill-item()
#skill-item()

= Personal Projects
#project-item()
#project-item()
#project-item()

= Work Experiences
#work-item()
#work-item()

= Education
#education-item()
#education-item()
