###In Ruby/Rails
`raise varname.to_yaml` is the most straightforward way to inspect a variable/object. When rails comes across a raise line, it stops the application and raises an "error" whose text contains the text (yaml) representation of the variable/object.

After a page request (at the top of each controller action), a variable called "params" exists containing the data submitted by the form or implied by the URL. `raise params.to_yaml` is also super useful.

[Pry](https://github.com/pry/pry) is a much more powerful replacement for irb. It also allows you to enter breakpoints (`binding.pry`), where the code stops running and you are dumped into a pry environment, with full access to all of the live variables.

[Jazz Hands](https://github.com/nixme/jazz_hands) is a set of Pry-related gems which enhance pry even further. In particular, [Pry Debugger](https://github.com/nixme/pry-debugger) is a really useful one.

[Better Errors](https://github.com/charliesome/better_errors) gives you a lot of information up front, in the browser, when Rails encounters an error.