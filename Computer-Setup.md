Getting a computer set up for web development can sometimes be a frustrating task, especially for a new developer who has no context for what all of the tools do, and how to read error messages when things go wrong. This is all made more complicated by the fact that some of us use Macs, some Windows PCs and others linux.

Thankfully, we have a tool called [Vagrant](http://www.vagrantup.com) to manage and run up our development environment. Vagrant technically adds a small bit of complexity, but in practice you won't notice it, and it's more than worth it because it simplifies every other aspect of getting setup (installing  Rails, databases, etc) and provides a level of consistency not otherwise possible across Mac/Win/Linux computers.

### What Tools to Install?

We'll need a few programs (or tools, I'll use the terms interchangeably) to build web applications. 

#### SublimeText

[Download](http://www.sublimetext.com)

SublimeText is my preferred and suggested text editor. We'll use this to read/write our code. If you have a preferred text editor already, you're welcome to use that (though don't use something like TextEdit, NotePad, or MS Word, you want something optimized for programmers).

#### Git / Github

Follow [these instructions](https://help.github.com/articles/set-up-git). Be sure to follow the main instructions on that page. If you want to install the special GitHub app they mention at the top, that's fine too, but must install the stuff below it as well.

Git is a tool that helps us track changes, view history, and collaborate when coding. We call these types of tools Version Control Systems (VCS) and git is the most popular among developers with refined taste. :)

Github is a website / service based on git that makes it even easier to collaborate.

#### Vagrant / VirtualBox

[Vagrant](http://docs.vagrantup.com/v2/installation/index.html) is a tool that runs another operating system (called a *Virtual Machine* or **VM**) . We'll use it to run a light-weight version of linux on everyone's computer. Once you get used to it, it's pretty transparent, and it ensures that we all are running the same versions of Ruby/Rails/etc.

You'll also need to install [VirtualBox](https://www.virtualbox.org/wiki/Downloads). Choose **VirtualBox platform packages** where the host matches your OS. So if you have Windows, choose **VirtualBox 4.x.x for Windows hosts**

### Download and Install the Rails Development VM

We need to tell Vagrant to download the Rails VM I've created for this course. To do this, we'll need to open up a terminal or command prompt:

* **Mac OS X**: Open the **Terminal** application located in */Applications/Utilities/*.
* **Windows**: Search the start menu for **Git Bash** and open that.

In the command prompt, enter the command below. (Don't include the '$', that's just how we indicate the text should be entered into the command prompt.


    $ vagrant box add rails http://weke.its.yale.edu/rails.box



Vagrant will go and download the VM and store a pristine copy on your computer. Later, when we start a new project (i.e. assignment or application), we'll have vagrant make a copy to use for the project. That way, any stuff we install for one project won't affect the others.

#### Test it out

We'll create a new folder, and tell vagrant to create a new VM for that folder based on the 'rails' VM we downloaded:

    $ cd ~
    $ mkdir code
    # here we're making a new folder called 'code' where we'll keep our projects. really you can call this whatever you want.
    $ cd code
    $ mkdir my_rails_apps
    $ cd my_rails_apps
    $ vagrant init rails
    $ vagrant up
    # this may take a few minutes as vagrant boots the VM
    $ vagrant ssh

If all went to plan, you should now have a command-line interface to a fully-functional development box. Test it by running a few commands such as `ls` or `pwd`.

To quit, type:
    
    exit
    vagrant halt

