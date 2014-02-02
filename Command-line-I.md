## Why the Command Line?

Some students struggle a bit with using the command line at first. And that's totally natural; for someone who's always used a graphical interface, the command line may seem complex and non-intuitive (not to mention dated and slow).

And while text-based interfaces were the original interface to computers (well, not counting [punch cards](https://en.wikipedia.org/wiki/Punched_card)), and they are somewhat complex, almost everyone who sticks with using the command line finds it to be faster, more efficient, and even natural after a while.

We'll be using the command line quite a bit in this course, so it's important that you start getting comfortable with it.

##General Concepts
The command line (or 'terminal') is an interface for issuing commands to your computer, and viewing the results. It is entirely text-based.

Commands are almost always a single line in length. When you hit 'enter' after typing a command, the computer runs the command, and any output is displayed.

Commands consist of the *command*, followed by any *arguments* that modify the commands behavoir. For example, on a Mac/Linux, I can issue the following two commands

* **ls**
* **ls -a**

In both cases, I'm running the command **ls**, which lists the files in the current directory. But in the second case, I've added the arguement *-a*, which tells **ls** to show all files, even hidden ones.

When you're using the command line, your always working in the context of a directory on your computer. In example above, that's important, so my computer knows which directoy to list the contents of. If I want to see the contents of a different directory, I need to *change directory* (see command list below)

##Common Commands (Mac / Win / Linux)
* **cd *some_directory*** - change current working directory to *some_directory* (which must be in the current directory)
* **cd ..** - '..' has a special meaning, the parent directory of the current one. So this takes you up one level.
* **mkdir *new_folder_name*** - make a new directory in the current directory

##Mac/Linux Specific
* **pwd** - list the current directory
* **ls** - list files and folders in the current directory
* **rm *some_file*** - deletes *some_file* (add *-r* to delete folder, i.e. **rm -r *some_folder***)

##A note on IDEs
There are programs available called Integrated Development Environments (IDEs) which make it easy to manage and run your code. A popular one is [*RubyMine*](http://www.jetbrains.com/ruby/). It's ok to use these, but I've chosen not to highlight them in the course, becuase most people in the ruby community write how-to's assuming you're using a command line, and it's an important skill to master.

## Assignment 1

See [[Assignment 1]]