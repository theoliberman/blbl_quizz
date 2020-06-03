// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .

//Haut, haut, bas, bas, gauche, droite, gauche, droite, B, A
let k = [38, 38, 40, 40, 37, 39, 37, 39, 66, 65],
    n = 0;
$(document).keydown(function (e) {
    if (e.keyCode === k[n++]) {
        if (n === k.length) {
            document.getElementById("spell").style.display = "flex";
            var obj = document.getElementById("points");
            var start = obj !== null ? parseInt(obj.innerText.replace(" points", "")) : 0;
            animateValue("points", start, 1000, 3000);
            setTimeout(function () {
                    document.getElementById("spell").style.display = "none";
                    obj.innerText = start + " points";
                },
                5000);
            n = 0;
            return false;
        }
    } else {
        n = 0;
    }
});

function animateValue(id, start, end, duration) {
    var range = end - start;
    var current = start;
    var increment = end > start? 1 : -1;
    var stepTime = Math.abs(Math.floor(duration / range));
    var obj = document.getElementById(id);
    if (obj !== null) {
        var clock = setInterval(function () {
            current += increment;
            obj.innerText = current + " points";
            if (current === end) {
                clearInterval(clock);
            }
        }, stepTime);
    }
}
