**Due: Wednesday, May 29th, 4pm**

## Reading

Read Chapter 4 of *Agile Web Development with Rails 4th Ed.* (it's in the shared Google Docs folder). (We'll read Chapters 2 - 3 for Assignment 6, so you can skip them for now if you want.)

You may optionally want to look at [Ruby section of the resources page](https://github.com/yale-stc-developer-curriculum/YEI-STC-Bootcamp-2013/wiki/Resources#ruby) for more reading. Below are selected suggestions from that page:

* If you want a clearly written intro to programming concepts (using Ruby), I suggest [Learn to Program](http://pine.fm/LearnToProgram/) by Chris Pine
  * There's an e-book version in the shared Google Docs folder
* If you want something quirky and fun, I suggest [Why's Poignant Guide Chapter](http://mislav.uniqpath.com/poignant-guide/book/)
* For a more advanced / complete treatment of the Ruby language (if you're feeling adventurous), I suggest [Programming Ruby (The Pickaxe Book)](http://pragprog.com/book/ruby4/programming-ruby-1-9-2-0). This is also a great reference book if you have questions about a specific part of the language.
  * There's an e-book version in the shared Google Docs folder

# Assignment

Your assignment is to complete a portion of the [Ruby Koans](http://rubykoans.com) (see note below before downloading). Specifically, you should complete all the koans through the section (i.e. file) called `about_iteration.rb`.

## Setting up the Ruby Koans (IMPORTANT!!)

Note that the version available for download on the website has a pretty major bug. Instead, do the following:

    # cd to your code folder (your location may be different)
    cd ~/code
    # create assignment4 folder if you don't already have one
    mkdir assignment4
    cd assignment4
    # create and start up a vagrant VM for this folder
    vagrant init rails
    # if you get an error message `'Vagrantfile' already exists in this directory...` then you can ignore it. 
    vagrant up
    vagrant ssh
    # switch to shared vagrant folder
    cd /vagrant
    # clone the ruby koans into a folder called assignment4
    git clone https://github.com/neo/ruby_koans.git
    cd ruby_koans
    # generate the koans
    rake gen
    # the koans are now in a folder called koans
    cd koans
    # Start the koans (at this point you can follow the instructions).
    ruby path_to_enlightenment.rb 
    
Once you've done everything above, you should have a copy of the koans synced between the VM (where you can run the ruby code) and your computer (in `~/code/assignment4/ruby-koans/koans`). You can open the `koans` folder in Sublime Text to edit them, and run the ruby commands in your VM.