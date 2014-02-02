Getting a computer set up for web development can sometimes be a frustrating task, especially for a new developer who has no context for what all of the tools do, and how to read error messages when things go wrong. This is all made more complicated by the fact that some of us use Macs, some Windows PCs and others linux.

###Installing Ruby & Rails
####Most People
Most people will be able to use [RailsInstaller](http://railsinstaller.org) to get everything up and running. 

If you get an error about `/opt/rix/` you will need to restart your computer to continue.

####Mavericks
If you are running OS X 10.9 Mavericks, you will not be able to run RailsInstaller. Talk to a TA or instructor in person to get instructions.

#### Test it out
To make sure everything is running properly, run these commands in your Terminal (OS X) or GitBash (Windows).
`ruby -v`
`rails -v`

The output should indicate that you have ruby 1.9 or higher, and rails 4.0 or higher.

If you need to update your rails, you can run `gem update rails` and then try `rails -v` again. If you need to update ruby, ask a TA or instructor.
### Installing A Text Editor

We'll need a few programs (or tools, I'll use the terms interchangeably) to build web applications. 

#### SublimeText

[Download](http://www.sublimetext.com)

SublimeText is our suggested text editor. We'll use this to read/write our code. If you have a preferred text editor already, you're welcome to use that (though don't use something like TextEdit, NotePad, or MS Word, you want something optimized for programmers).

The TAs have recommended SublimeText 3, but 2 should work as well.

#### Installing Packages for Sublime Text

First, make sure you've installed [Sublime Package Control](http://wbond.net/sublime_packages/package_control). 

Then to install packages, press **Shift + CTRL + P** (Windows) or **SHIFT + CMD + P** (Mac), then type 'install' and select 'Package Control: Install Packages'.

Here are some suggested packages:

* CoffeeScript
* ERB Snippets
* Git
* Git Gutter
* GitHubinator
* Lorem Ipsum Generator
* Ruby on Rails Snippets
* SCSS
* Sidebar Enhancements
* SublimeLinter
* Trailing Spaces

####A note on IDEs
There are programs available called Integrated Development Environments (IDEs) which make it easy to manage and run your code. A popular one is [*RubyMine*](http://www.jetbrains.com/ruby/). It's ok to use these, but we've chosen not to highlight them in the course, because most people in the ruby community write how-to's assuming you're using a command line, and it's an important skill to master. We recommend that you just use SublimeText.


### Installing Git (to use Github)

Follow [these instructions](https://help.github.com/articles/set-up-git). Be sure to follow the main instructions on that page. If you want to install the special GitHub app they mention at the top, that's fine too, but must install the stuff below it as well.

Git is a tool that helps us track changes, view history, and collaborate when coding. We call these types of tools Version Control Systems (VCS) and git is the most popular among developers with refined taste. :)

Github is a website / service based on git that makes it even easier to collaborate.