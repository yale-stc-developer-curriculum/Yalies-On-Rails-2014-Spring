#This is still being worked on, don't follow this yet
`Total time estimated: 5-10 hours`

##Assignment 9
###Sinatra CRUD Application
1. Fork the project to your own user's page [STC Developer Curriculum - YouTubeSets](https://github.com/yale-stc-developer-curriculum/youtubesets)
1. Create a branch called your name
1. Create an application that can CRUD (Create, Retrieve, Update, Destroy) youtubesets
1. Specification:
  - You must use Ruby version `2.0.0-p247`
    - `rbenv install 2.0.0-p247` (anywhere, to install this on your machine) 
    - `rbenv local 2.0.0-p247` (in the project directory, to set this to be the ruby version of your project)
  - Create each of the routes listed in [[RESTful Routes]]
  - Layout
    - You shouldn't focus on making this application look beautiful at this point, don't worry about CSS
    - Each page should have a navigation bar at the top...
      - This bar should include a link to "Home" with the URL `"/"`
      - It should also include a link to "Sets" with the URL `"/sets"`
  - Data Input & Storage
    - Youtube links should be submitted as a newline-separated list (press enter after each link).
    - Youtube links should be stored in the session, in a variable structured as a hash with the format `"sets" => { "SETNAME" => { "name" => "SETNAME", vidnums => ["VID1", "VID2", "VID3"] } }`
    - each set will use its name as the key in the `sets` hash and will include the keys `name` and `vidnums` pointing to a string with the set name and an array with the Youtube links, respectively.
  - The application should work for `http://` but doesn't have to work for `https://` (that requires a trick I'm not interested in you learning right now)
  - You should create a separate commit in github for each small change you make, probably every 3-10 minutes. If you haven't done this yet you can just create one commit with it all, but continue doing this in the future.
  - It should pass the tests we provide.
    - Open Terminal and change to the directory of your project.
    - Run these commands: (triple click to highlight the whole line)
    - `curl -O https://raw.github.com/jasonkliu/AutomaticHomeworkTesting/master/Ruby/selftest.sh`
    - `chmod +x selftest.sh`
    - `./selftest.sh`
    - If you have issues, please email @jasonkliu. Thanks.
1. Bonus
  - Meet all [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide) guidelines. You can test this by running [rubocop](https://github.com/bbatsov/rubocop).
    - `gem install rubocop`
    - (restart the terminal)
    - `rubocop` (in the right directory)
  - Bonus points if it can handle additional list formats - comma separated, space separated, tab separated.
  - Make your application work over HTTPS as well as HTTP
1. Hints
  - Destroy
    - Anchored links (`<a href=''...>`) can only pass method="post" method (some claim they also do well with get)
    - Pure html forms can only pass method="post" and method="get"
    - to pass method="delete" in Sinatra, we need to enable method overriding by adding "_method = true" in the configure method of our app in the .rb file, then in the .erb file (or any part of HTML code) we can use method="delete" and it will be addressed properly.
    - For Destroy, see http://www.sinatrarb.com/configuration.html

## Submission
`10 minutes`

1. Submit your **time worked** for each of the assignments on the class google form (Found on the [[Assignments]] page).
2. Submit a pull request to the STC Developer Curriculum