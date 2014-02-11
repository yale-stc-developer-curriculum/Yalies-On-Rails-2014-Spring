Total time estimated: `TBD`

##Ruby Reading
You may optionally want to look at [Ruby section of the resources page](Resources#ruby) for more reading. Below are selected suggestions from that page:

* Read [Learn to Program](http://pine.fm/LearnToProgram/) by Chris Pine. We've gone through Chapter 6, and we'll be moving further! If the website goes down, you should have a Google Drive folder shared with you which has the book printed to PDF.
* If you want something quirky and fun, try [Why's Poignant Guide](http://mislav.uniqpath.com/poignant-guide/book/).
  * [Why's Poignant Guide Chapter 3](http://mislav.uniqpath.com/poignant-guide/book/chapter-3.html) - Ruby Basics


## Assignment 3 - Ruby Koans
Your assignment is to complete a portion of the [Ruby Koans](http://rubykoans.com). Specifically, you should complete all the koans through the section (i.e. file) called `triangele_project.rb` (~1/2 of them).

If you would like to have them run automatically, you could try to use the trick described here:
https://github.com/neo/ruby_koans/#running-the-koans-automatically

Sometimes a "point" comes from completing multiple lines - pay close attention to which line the koan is pointing at to prevent frustration.

If you don't understand something in the koans, you should try these in order:

1. Try to figure it out by trying things in the koans environment
2. Look it up
3. Make a note to figure it out later

##Assignment 4 - Grandma
Write a Deaf Grandma program.
- Whatever you say to grandma (whatever you type in), she should respond with HUH?! SPEAK UP, SONNY! , unless you shout it (type in all capitals).
- If you shout, she can hear you (or at least she thinks so) and yells back, NO, NOT SINCE 1938! or other silly grandma phrases she has in her small repertoire.
  - To make your program really believable, have grandma shout a different year each time; maybe any year at random between 1930 and 1950.
- You can't stop talking to grandma until you shout BYE. Except she doesn't want you to leave, so you have to shout BYE three times in a row.
  - Make sure to test your program: if you shout BYE three times, but not in a row, you should still be talking to grandma.
- Hints
  - Don't forget about chomp! 'BYE'with an Enter is not the same as 'BYE' without one!
  - Try to think about what parts of your program should happen over and over again. All of those should be in your while loop.

(adapted from Chris Pine's "LearnToProgram" http://pine.fm/LearnToProgram/?Chapter=06)