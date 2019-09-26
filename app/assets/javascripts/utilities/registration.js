document.addEventListener('turbolinks:load', function () {
    let inputPassword = document.querySelector('#user_password');
    let inputPasswordConfirmation = document.querySelector('#user_password_confirmation');

    if (inputPassword) { inputPassword.addEventListener('input', confirmationValidation) }
    if (inputPasswordConfirmation) { inputPasswordConfirmation.addEventListener('input', confirmationValidation) }
});

function confirmationValidation() {
    let inputPassword = document.querySelector('#user_password');
    let inputPasswordConfirmation = document.querySelector('#user_password_confirmation');

    if (inputPassword.value === '') { return }

    if (inputPassword.value === inputPasswordConfirmation.value) {
        inputPasswordConfirmation.classList.remove('is-invalid');
        inputPasswordConfirmation.classList.add('is-valid');
    } else {
        inputPasswordConfirmation.classList.remove('is-valid');
        inputPasswordConfirmation.classList.add('is-invalid');
    }
}
