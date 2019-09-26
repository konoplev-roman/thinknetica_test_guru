document.addEventListener('turbolinks:load', function () {
    let control = document.querySelector('.sort-by-title');

    if (control) { control.addEventListener('click', sortRowsByTitle) }
});

function sortRowsByTitle() {
    let arrowUp = this.querySelector('.sort-asc');
    let arrowDown = this.querySelector('.sort-desc');

    let table = this.parentNode.parentNode.parentNode;
    let tableBody = table.querySelector('tbody');

    let rows = tableBody.querySelectorAll('tr');
    let sortedRows = [];

    for (let i = 0; i < rows.length; i++) {
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

    let sortedTableBody = document.createElement('tbody');

    for (let i = 0; i < sortedRows.length; i++) {
        sortedTableBody.appendChild(sortedRows[i])
    }

    table.replaceChild(sortedTableBody, tableBody)
}

function compareRowsAsc(row1, row2) {
    let title1 = row1.querySelector('td').textContent;
    let title2 = row2.querySelector('td').textContent;

    if (title1 < title2) { return -1 }
    if (title1 > title2) { return 1 }
    return 0
}

function compareRowsDesc(row1, row2) {
    let title1 = row1.querySelector('td').textContent;
    let title2 = row2.querySelector('td').textContent;

    if (title1 < title2) { return 1 }
    if (title1 > title2) { return -1 }
    return 0
}
