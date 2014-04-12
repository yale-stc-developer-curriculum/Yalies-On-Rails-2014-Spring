//explain regular expressions in general

//document.body is the <body> tag
//
////innerHTML is a way to select everything inside a node as text (good for find and replace)
////innerHTML will replace literally ANYTHING so it can be dangerous.
////If you find and replace "body" it will even affect the main "<body>" tag and break the page.
////More robust ways take a lot more programming.
//
//replace uses a regular expression, like find-and-replace
//.replace(/FIND/g, "REPLACE")
//
// /FIND/g
// the /.../ part outlines the regex (the find part)
// the g means "global" - not just the first one it finds - but find and replace ALL

document.body.innerHTML = document.body.innerHTML.replace(/cloud/g, "butt");
