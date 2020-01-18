document.addEventListener('turbolinks:load', function () {
    var progressBar = document.querySelector('.progress-bar');

    if (progressBar) { progressBarHandler(progressBar) }
});

function progressBarHandler(progressBar) {
    var progress = progressBar.dataset.progress;

    progressBar.style.width = progress + '%';
    progressBar.setAttribute('aria-valuenow', progress);
}
