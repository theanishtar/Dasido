const container = document.querySelector(".container"),
    input_submit = container.querySelector(".main .input-control .input-submit"),
    back = container.querySelector(".wrapper_validator .info");
    wrapper = container.querySelector(".main .wrapper"),

    btn_confirm = container.querySelector(".wrapper_validator .btn-confirm"),
    wrapper_validator = container.querySelector(".main .wrapper_validator"),
    wrapper_changepass = container.querySelector(".main .wrapper_changepass"),

input_submit.addEventListener("click", () => {
    container.classList.add("active");
    wrapper.style.display = 'none';
    wrapper_changepass.style.display = 'none';
});

back.addEventListener("click", () => {
    container.classList.remove("active");
    wrapper.style.display = 'block';
});


btn_confirm.addEventListener("click", () => {
    container.classList.add("active");
    wrapper_validator.style.display = 'none';
    wrapper.style.display = 'none';
    wrapper_changepass.style.display = 'block';
});