#This is still being worked on, don't follow this yet
`Total time estimated: 7-15 hours`

##Assignment 9
###Sinatra CRUD Application
Goal: Create an application that can CRUD (Create, Retrieve, Update, Destroy) youtubesets.

For specific instructions on how we'd like you to use github for this assignment, see the [Yalies On Rails 2014 Spring Repository](https://github.com/yale-stc-developer-curriculum/Yalies-On-Rails-2014-Spring/) (the repository the wiki is on top of).

You should be using git the whole time. You should create a separate commit in github for each small change you make, probably every 3-10 minutes. If you haven't done this yet you can just create one commit with it all, but continue doing this in the future.

I've separated this assignment into four sections:
1. Setup
2. Specifications - The main instructions for this assignment.
3. Additional Specifications - Additional instructions you also need to do. (But if you don't, you should still be able to proceed with the course.)
4. Bonus - You'll potentially learn the most from these, but they are optional.

####Setup
- You must use Ruby version `2.0.0-p247`
  - `rbenv install 2.0.0-p247` (anywhere, to install this on your machine) 
  - `rbenv local 2.0.0-p247` (in the project directory, to set this to be the ruby version of your project)
- You should copy over all of the files found in the `EXAMPLE` directory, and then customize those with your code.
  - `.gitkeep` - By default, github won't accept empty folders. .gitkeep is a dummy file used by github to allow you upload an otherwise empty folder. This file is blank and has no other function, it just let us make an empty folder with your name.
  - `.ruby-version` is used by rbenv (and its competitor RVM) to determine which ruby to run. 
  - `Gemfile` is used by bundler to determine which Gems to install
  - `Gemfile.lock` shows which version of the gems were used preivously. These same versions will be used forever -- until someone runs `bundle update`. This is to prevent buggy updates to gems from messing up your otherwise functional application.

####Base Specification
  - Create each of the routes listed in [[RESTful Routes]]
  - Layout
    - You shouldn't focus on making this application look beautiful at this point, don't worry about CSS
    - Each page should have a navigation bar at the top.
      - This bar should include a link to "Home" with the URL `"/"`
      - It should also include a link to "Sets" with the URL `"/sets"`
  - Data Input & Storage
    - We can assume that only youtube video numbers will be submitted (not `www.youtube.com/watch?v=jZVdDl_asYY` just `jZVdDl_asYY`)
    - Youtube video numbers should be submitted as a newline-separated list (press enter after each link).
    - Youtube video numbers should be stored in the session, in a variable structured as a hash with the format `"sets" => { "SETNAME" => { "name" => "SETNAME", vidnums => ["VID1", "VID2", "VID3"] } }`
    - each set will use its name as the key in the `sets` hash and will include the keys `name` and `vidnums` pointing to a string with the set name and an array with the Youtube links, respectively.
  - Hints for Destroy
    - Anchored links (`<a href=''...>`) can only pass method="post" method (some claim they also do well with get)
    - Pure html forms can only pass method="post" and method="get"
    - to pass method="delete" in Sinatra, we need to enable method overriding by adding "_method = true" in the configure method of our app in the .rb file, then in the .erb file (or any part of HTML code) we can use method="delete" and it will be addressed properly.
    - For Destroy, see http://www.sinatrarb.com/configuration.html
  - The application should work for `http://` but doesn't have to work for `https://` (that requires a trick I'm not interested in you learning right now)

####Additional Specification
Everyone should do these. However, even if you don't finish all of these you should be able to proceed with the course.
  - Add a description field to each playlist. (see Songza's playlist descriptions for some fun examples)
    - You'll have to add another input form and also decide where in the session to store this information.
  - At least check out the RuboCop/Ruby Style Guide (below).
  - Pass the tests we provide. Some of the test cases are intentionally very specific, this is an exercise in reading terminal output. This is a hugely valuable skill to practice.
    - This script will download an RSpec file and run this to ensure the application meets specifications that we've written. After running it, you should check out the file `YOURFOLDER/spec/features/site_spec.rb`
    - This is the first time we're using an RSpec/Capybara script to help guide this assignment. If you have any specific feedback on how we should change it, we'd love to hear from you on Piazza!
      - eg "why do we have test case X? I don't think that should be tested"
      - or "My app was broken like X but it passed all tests!"
    - Open Terminal and change to the directory of your project (your name).
    - Run these commands: (triple click to highlight the whole line)
      - `curl -O https://raw.github.com/jasonkliu/AutomaticHomeworkTesting/master/Ruby/selftest.sh`
        - if you don't have curl, try wget: `wget https://raw.github.com/jasonkliu/AutomaticHomeworkTesting/master/Ruby/selftest.sh`
      - `chmod +x selftest.sh`
      - `./selftest.sh`
    - RSpec/Capybara tests written by Oren Kanner
    - `selftest.sh` script written by Jason Liu

####Bonus
These are optional for everyone, but you'll potentially learn the most from these
  - Meet all [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide) guidelines. You can test this by running [rubocop](https://github.com/bbatsov/rubocop).
    - Add it to your gemfile and `bundle install` (or `gem install rubocop`)
    - (restart the terminal)
    - `rubocop` (in the right directory)
  - Get the input to handle additional list formats - comma separated, space separated, tab separated.
  - Get the input to accept whole URLs instead of just the video numbers (&v=a1hNo91)
    - One way would be to use a Regular Expression
    - Another way would be to use Ruby's URI Parser
  - Make your application work over HTTPS as well as HTTP

## Submission
`10-15 minutes`

1. Submit your **time worked** for each of the assignments on the class google form (Found on the [[Assignments]] page).
2. Submit a pull request to the STC Developer Curriculum, see the [Yalies On Rails 2014 Spring Repository](https://github.com/yale-stc-developer-curriculum/Yalies-On-Rails-2014-Spring/) page for specific details.