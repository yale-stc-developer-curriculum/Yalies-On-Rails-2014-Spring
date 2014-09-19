Example Site
http://ulua.its.yale.edu/bmec-training/


##Selectors
###Models Page

``` javascript
jQuery('section')
jQuery('section').css('background', 'pink')
jQuery('section').css('border', '5px solid green')
jQuery('hr').css('border', '1px solid green')
jQuery('section hr').css('border', '1px solid green')
jQuery('section').children('hr').css('border', '1px solid green')
jQuery('section').find('hr').css('border-color', 'green')
```
###Documentation
- [Basic Selectors API](http://api.jquery.com/category/selectors/basic-css-selectors/)
- [Attribute Selectors API](http://api.jquery.com/category/selectors/attribute-selectors/)
- [Hierarchy Selectors API](http://api.jquery.com/category/selectors/hierarchy-selectors/)
- [CSS Manipulation API](http://api.jquery.com/css/)



##Traversal
###Index Page
``` javascript
jQuery('.thumbnail').css('background', 'red')
jQuery('.thumbnail').children('img')
jQuery('.thumbnail').find('img')
jQuery('.thumbnail').find('img').css('border-radius', '300px')
jQuery('.thumbnail')
jQuery('.thumbnail').css('background', 'pink')
jQuery('.thumbnail').find('img')
jQuery('.thumbnail').find('img').css('border-radius', '300px')
```
###Documentation
- [Tree Traversal API](http://api.jquery.com/category/traversing/tree-traversal/)
- [Find vs Children Example](http://www.mkyong.com/wp-content/uploads/jQuery/jQuery-find-children-example.html)



##DOM Manipulation
###Index Page
``` javascript
jQuery('.thumbnail:first').prepend('<h2>New!</h2>')
```
or
``` javascript
newtag = jQuery('<h2>New!</h2>')
jQuery('.thumbnail:first').prepend(newtag)
```

###Documentation
- [DOM Manipulation API](http://api.jquery.com/category/manipulation/)
- [Inserting DOM Nodes Example](http://jsfiddle.net/tovic/2CueT/)


##Events
###Index Page
``` javascript
a = jQuery('.page-header').children('h1')
a.on('mousedown', function(){alert($(this).text())})

a = jQuery('.page-header').children('h1')
function beautify(){$(this).css('background', 'pink')}
a.on('click', beautify)

a = jQuery('.page-header').children('h1')
a.on('mousedown', function(){$(this).animate({'font-size':'100px'})})
a.on('mouseup', function(){$(this).animate({'font-size':'10px'})})

a = jQuery('.page-header').children('h1')
a.on('lol', function(){$(this).animate({'font-size':'100px'})})
a.on('trololol', function(){$(this).animate({'font-size':'10px'})})
a.trigger('lol')
a.trigger('trololol')
```

###Documentation
- ["On" Function API](http://api.jquery.com/on/)
- [Native DOM Events](http://en.wikipedia.org/wiki/DOM_events)
- Custom events can be made using [Trigger](http://api.jquery.com/trigger/)

##Animation
###Index Page
``` javascript
see above
```

###Documentation
- [Animation API](http://api.jquery.com/animate/)