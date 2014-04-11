javascript:
function doit() {
    var x = document.getElementsByTagName("input");
    for (var i = 0; i < x.length; i++) {
        if (x[i].type == 'checkbox') {
            x[i].click();
        }
    };
    alert('Done: please scroll and repeat until all your friends have been selected');
}
doit();
