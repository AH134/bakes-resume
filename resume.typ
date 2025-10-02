#import "src/main.typ": *

#let author = "Bake Jones"
#let phone = "123-456-7890"
#let email = "bjones@example.com"
#let linkedin = "linkedin.com/in/bjones"
#let github = "github.com/bjones"

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
