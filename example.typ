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
#skill-item(
  category: "Languages",
  skills: ("Python", "JavaScript", "C++", "TypeScript", "Java", "Go", "Ruby"),
)
#skill-item(
  category: "Libraries/Frameworks",
  skills: ("React", "Node.js", "Django", "Flask", "Spring Boot", "Express", "TensorFlow"),
)
#skill-item(
  category: "Developer Tools",
  skills: ("Git", "Docker", "Kubernetes", "Jenkins", "AWS", "Azure", "GCP"),
)

= Work Experiences
#work-item(
  company: "Tech Solutions Inc.",
  position: "Software Engineer",
  location: "Remote",
  start-date: "Jan 2022",
  end-date: "Present",
  points: (
    "Developed and maintained web applications using Django and React.",
    "Implemented RESTful APIs to support mobile and web clients, enhancing data accessibility.",
    "Collaborated with cross-functional teams to design and deploy scalable cloud solutions on AWS.",
    "Optimized application performance, reducing load times by 30% through code refactoring and database indexing.",
  ),
)
#work-item(
  company: "Moyang Studios",
  position: "Backend Developer Intern",
  location: "Overworld, MC",
  start-date: "Jun 2021",
  end-date: "Aug 2021",
  points: (
    "Assisted in the development of backend services for a popular online game using Java and Spring Boot.",
    "Implemented new features and fixed bugs in collaboration with senior developers, contributing to a smoother gaming experience.",
    "Participated in code reviews and team meetings, gaining valuable insights into software development",
  ),
)

= Personal Projects
#project-item(
  name: "Minecraft Plugin",
  technologies: ("Java", "Spigot API"),
  start-date: "May 2020",
  end-date: "Jun 2025",
  points: (
    "Developed a custom Minecraft plugin that adds new gameplay features and mechanics.",
    "Implemented event handling and command processing to enhance player interaction.",
    "Optimized performance to ensure smooth gameplay on multiplayer servers.",
  ),
)
#project-item(
  name: "Draw.io Clone",
  technologies: ("TypeScript", "React", "Canvas API"),
  start-date: "Aug 2024",
  end-date: "Sep 2025",
  points: (
    "Built a web-based diagramming tool similar to draw.io using React and the Canvas API.",
    "Implemented features such as drag-and-drop, shape creation, and real-time collaboration.",
    "Deployed the application using Docker and Kubernetes for scalability.",
  ),
)
#project-item(
  name: "Cooking Recipe App",
  technologies: ("Python", "Django", "PostgreSQL"),
  start-date: "Jul 2025",
  end-date: "Sep 2025",
  points: (
    "Created a web application for managing and sharing cooking recipes.",
    "Implemented user authentication, recipe CRUD operations, and search functionality.",
    "Designed a responsive UI using Bootstrap to ensure usability across devices.",
  ),
)

= Education
#education-item(
  name: "Moyang University",
  degree: "Bachelor of Science in Computer Science",
  location: "Overworld, MC",
  start-date: "Sep 2021",
  end-date: "Jun 2025",
)
#education-item(
  name: "Mohoyo College",
  degree: "Associate Degree in Information Technology",
  location: "Toyvat, GI",
  start-date: "Sep 2019",
  end-date: "Jun 2021",
)
