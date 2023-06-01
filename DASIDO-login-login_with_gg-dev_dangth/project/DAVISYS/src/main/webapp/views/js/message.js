const container_message = document.querySelector(".container_message"),
    clearfix = container_message.querySelector(".people-list .clearfix"),
    messageNull = container_message.querySelector(".message-null");
    close_mess = container_message.querySelector(".close_mess");
    clearfix.addEventListener("click", () => {
    container_message.classList.add("active");
    messageNull.style.display = 'none';
});

close_mess.addEventListener("click", () => {
    container_message.classList.remove("active");
    messageNull.style.display = 'block';
});