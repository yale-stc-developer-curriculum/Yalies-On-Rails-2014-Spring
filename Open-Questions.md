Write open questions here:

If you have trouble with the cart in chapter 9.
you need to make the module current_cart on pg 108.
(As it is not clear you needed to add it you might skip it and get errors later on.)


### Installing Packages for Sublime Text

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

### I made a typo when using a generator (e.g. rails generate scaffold ...) How can I fix it?

Let's say you do this by accident:

    rails generate scaffold Cat name class_year fur_colorrr

You have a few options:

**If you realized early on**, you can just destroy the scaffold and re-generate it with the correct spelling:

```
# delete all files created by the generator
rails destroy scaffold Cat

# generate a new scaffold without the typo
rails generate scaffold Cat name class_year fur_color
```

**If you don't realize it until much later** (i.e. you've already migrated, introducing the typo into your DB), you'll need to fix the typos for the attributes in your views & controller.

To fix the type in your DB, you can't just fix the old migration. Instead, generate a new migration that renames the column with the typo. See [this StackOverflow Q&A](http://stackoverflow.com/questions/1992019/how-can-i-rename-a-database-column-in-a-rails-migration) for instructions.

### Could you talk a little bit more about SQLite and what we should download to manage the database?

Sure, we'll have a dedicated lecture (and wiki page) on DBs, so for now, I'll just list some useful tools for SQLite.

* [SQLite Database Browser](http://sqlitebrowser.sourceforge.net): It's free and open-source, and works fine, but it's got a somewhat clunky interface.
* [FireFox SQLite Manager](https://addons.mozilla.org/en-us/firefox/addon/sqlite-manager/): Weird that it's an add-on for FireFox, but it works pretty well, and is cross-platform.
* [Base](http://menial.co.uk/base/) (Mac Only): Not free, but the best option I've found for Mac. (There is a trial version). 

### What are the Apple Shortcuts for tiling windows side-by-side that you use, Adam?

There are a few options for this:

* **Slate**: [Slate](https://github.com/jigish/slate) is very powerful, but requires setting up via a text config file. You can set any shortcuts to move and resize a window.
* **Moom**: [Moom](http://manytricks.com/moom/) isn't free, but it's very easy to use. It makes the little green button on the toolbar more powerful (can move and re-size windows).
* **Better Touch Tool**: [BTT](http://blog.boastr.net) is mostly a tool for improving your Mac Trackpad, but it also has window snapping features (drag the window to the right to snap to the right, top for full-screen, etc.
* **Other Options**: Divvy, Cinch, and more [here](http://alternativeto.net/software/moom/)

###Could you explain again how paths / links work?

As a followup to the in-class lecture on this, you may want to read:
* [Rails Routing](http://guides.rubyonrails.org/routing.html#path-and-url-helpers)
* [Rails link_to](http://apidock.com/rails/ActionView/Helpers/UrlHelper/link_to)

### How does [this](http://stackoverflow.com/questions/13221370/devise-cant-log-out) work? 
The problem here is related to a few things:
* This route requires (by default) a DELETE HTTP verb.
* The link generated for some reason isn't generating a DELETE request.
* As a consequence, the router doesn't match it to the devise views, and it proceeds until it finds something it can match.
** In this case, GET /users/sign_out matches '/users/:id' where :id = 'sign_out'

The proper fix is to make the link work as a DELETE request and not a GET request. I suspect the person asking this question has an issues with the jquery-UJS gem, since that's what helps fake the link as a DELETE request.

The other fix, which they did, was configure devise to map a GET request to '/users/sign_out' to the signout action. This is something the Devise gem provides as a workaround.

### Can you cover installing from the command line, homebrew, etc