javascript:
function doit() {
  var x = document.getElementsByClass("checkbox");
  for (var i = 0; i < x.length; i++) {
    x[i].click();
  };
  alert('Done: please scroll and repeat until all your friends have been selected');
}
doit();
