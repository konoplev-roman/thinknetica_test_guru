document.addEventListener('turbolinks:load', function () {
    var control = document.querySelector('.sort-by-title');

    if (control) { control.addEventListener('click', sortRowsByTitle) }
});

function sortRowsByTitle() {
    var arrowUp = this.querySelector('.sort-asc');
    var arrowDown = this.querySelector('.sort-desc');

    var table = this.parentNode.parentNode.parentNode;
    var tableBody = table.querySelector('tbody');

    var rows = tableBody.querySelectorAll('tr');
    var sortedRows = [];

    for (var i = 0; i < rows.length; i++) {
        sortedRows.push(rows[i])
    }

    if (arrowDown.classList.contains('sort-active')) {
        sortedRows.sort(compareRowsAsc);
        arrowDown.classList.remove('sort-active');
        arrowUp.classList.add('sort-active')
    } else {
        sortedRows.sort(compareRowsDesc);
        arrowUp.classList.remove('sort-active');
        arrowDown.classList.add('sort-active')
    }

    var sortedTableBody = document.createElement('tbody');

    for (var i = 0; i < sortedRows.length; i++) {
        sortedTableBody.appendChild(sortedRows[i])
    }

    table.replaceChild(sortedTableBody, tableBody)
}

function compareRowsAsc(row1, row2) {
    var title1 = row1.querySelector('td').textContent;
    var title2 = row2.querySelector('td').textContent;

    if (title1 < title2) { return -1 }
    if (title1 > title2) { return 1 }
    return 0
}

function compareRowsDesc(row1, row2) {
    var title1 = row1.querySelector('td').textContent;
    var title2 = row2.querySelector('td').textContent;

    if (title1 < title2) { return 1 }
    if (title1 > title2) { return -1 }
    return 0
}
