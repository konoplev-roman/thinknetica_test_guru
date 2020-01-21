document.addEventListener('turbolinks:load', function () {
    var timer = document.querySelector('#timer');

    if (timer) { timerHandler(timer) }
});

function timerHandler(timer) {
    var secMs = 1000;
    var minMs = secMs * 60;
    var hourMs = minMs * 60;
    var dayMs = hourMs * 24;

    var completeBefore = new Date(timer.dataset.completeBefore).getTime();
    var redirect = timer.dataset.redirect;

    var daysFiled = document.querySelector('#days');
    var hoursFiled = document.querySelector('#hours');
    var minutesFiled = document.querySelector('#minutes');
    var secondsFiled = document.querySelector('#seconds');

    var countdown = setInterval(function () {
        // Count of seconds between now and end time limit
        var now = new Date().getTime();
        var count = completeBefore - now;

        // Time calculations for days, hours, minutes and seconds
        var days = Math.floor(count / dayMs);
        var hours = Math.floor((count % dayMs) / hourMs);
        var minutes = Math.floor((count % hourMs) / minMs);
        var seconds = Math.floor((count % minMs) / secMs);

        daysFiled.innerHTML = days;
        hoursFiled.innerHTML = hours;
        minutesFiled.innerHTML = minutes;
        secondsFiled.innerHTML = seconds;

        // If the count down is finished, redirect
        if (count < 0) {
            clearInterval(countdown);

            window.location.href = redirect;
        }
    }, 1000);
}
