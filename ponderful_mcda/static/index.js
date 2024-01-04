
function toggleDivs() {
    var div1 = document.querySelector('.div1');
    var div2 = document.querySelector('.div2');

    if (div1.style.display !== 'none') {
        div1.style.display = 'none';
        div2.style.display = 'block';
    } else {
        div1.style.display = 'block';
        div2.style.display = 'none';
    }
}