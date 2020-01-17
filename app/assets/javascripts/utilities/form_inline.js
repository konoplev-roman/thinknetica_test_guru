document.addEventListener('turbolinks:load', function () {
    var controls = document.querySelectorAll('.edit-inline');

    if (controls.length) {
        for (var i = 0; i < controls.length; i++) {
            controls[i].addEventListener('click', formInlineLinkHandler)
        }
    }

    var errors = document.querySelector('.resource-errors');

    if (errors) {
        var resourceId = errors.dataset.resourceId;

        formInlineHandler(resourceId)
    }
});

function formInlineLinkHandler() {
    var resourceId = this.dataset.resourceId;

    formInlineHandler(resourceId)
}

function formInlineHandler(resourceId) {
    var form = document.querySelector('.form-inline[data-resource-id="' + resourceId + '"]');
    var title = document.querySelector('.title-inline[data-resource-id="' + resourceId + '"]');
    var link_edit = document.querySelector('.edit-inline[data-resource-id="' + resourceId + '"]');

    if (form) {
        if (form.classList.contains('hide')) {
            form.classList.remove('hide');
            title.classList.add('hide');
            link_edit.classList.add('hide');
        } else {
            form.classList.add('hide');
            title.classList.remove('hide');
            link_edit.classList.remove('hide');
        }
    }
}
