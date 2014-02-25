We'll be going through in the order that the article ["A re-introduction to javascript"](https://developer.mozilla.org/en-US/docs/Web/JavaScript/A_re-introduction_to_JavaScript) has. You should probably use this article as a reference. For example `What is the syntax for an if statement in javascript again?`

The [[Resources]] page has some more thorough Javascript articles that explain more.

To determine what "class" something is, you can use `variablename.constructor`. (Technically, Javascript doesn't have classes, but rather "object prototypes")

The example page we used with javascript written to the HTML page is here:

- [full page](http://jsfiddle.net/mhquL/10/show)
- [jsfiddle](http://jsfiddle.net/mhquL/10)

##Bookmarklets
The [Rules for Bookmarklets](http://subsimple.com/bookmarklets/rules.asp) article is pretty useful.

The example bookmarklets we used are here:

- Select All Facebook Friends for an Event([source](http://www.yalewiki.org/wiki/Undergraduate_Organizations#Inviting_People_to_Facebook_Events))
```javascript
javascript:var x=document.getElementsByTagName("input");for(var i=0;i<x.length;i++) {if (x[i].type == 'checkbox') {x[i].click();}}; alert('Done: please scroll and repeat until all your friends have been selected');
```

- Pink Facebook
```javascript
javascript:document.getElementById("blueBar").style.background = "pink";
```

The website we used to properly indent the javascript is here:

- [JSBeautifier](http://jsbeautifier.org)