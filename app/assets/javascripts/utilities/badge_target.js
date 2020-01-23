document.addEventListener('turbolinks:load', function () {
    var conditionSelect = document.querySelector('#badge_condition');

    if (conditionSelect) {
        conditionSelect.addEventListener('change', function () { conditionSelectHandler(this.value) });

        conditionSelectHandler(conditionSelect.value)
    }
});

function conditionSelectHandler(value) {
    disableAllTargetSelects();

    // Search for the select tag by the name of the selected condition
    // e.g. .success_by_category
    if (value) {
        var selectTarget = document.querySelector('.' + value)
    }

    // If the tag is not found, use a hidden tag without a target
    if (typeof selectTarget === 'undefined' || selectTarget === null) {
        selectTarget = document.querySelector('#target_empty')
    }

    if (selectTarget) { enableSelect(selectTarget) }
}

function disableAllTargetSelects() {
    var selects = document.querySelectorAll('.select-target');

    for (var i = 0; i < selects.length; i++) {
        disableSelect(selects[i])
    }
}

function disableSelect(select) {
    select.setAttribute('disabled', 'true');
    select.classList.add('hide')
}

function enableSelect(select) {
    select.removeAttribute('disabled');
    select.classList.remove('hide');

    // Reset the value so that the condition is saved without a target
    if (select.getAttribute('type') === 'hidden') {
        select.value = null
    }
}
