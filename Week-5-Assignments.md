#This is still being worked on, don't follow this yet
`Total time estimated: 5-10 hours`

##Assignment 9
###Sinatra CRUD Application
1. Fork the project to your own user's page [STC Developer Curriculum - YouTubeSets](https://github.com/yale-stc-developer-curriculum/youtubesets)
1. Create a branch called your name
1. Create an application that can CRUD (Create, Retrieve, Update, Destroy) youtubesets
1. Specification:
  - Create each of the routes listed in [[RESTful Routes]]
  - Each page should have a navigation bar at the top...
1. Hints
  - Anchored links (`<a href=''...>`) can only pass method="post" method (some claim they also do well with get)
  - Pure html forms can only pass method="post" and method="get"
  - to pass method="Destroy" in Sinatra, we need to enable method overriding by adding "_method = true" in the configure method of our app in the .rb file, then in the .erb file (or any part of HTML code) we can use method="delete" and it will be addressed properly.
  - For Destroy, see http://www.sinatrarb.com/configuration.html

## Submission
`10 minutes`

1. Submit your **time worked** for each of the assignments on the class google form (Found on the [[Assignments]] page).
2. Submit a pull request to the STC Developer Curriculum