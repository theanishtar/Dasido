// Show-close dialog create post
const showButton = document.getElementById('showDialog');
const favDialog = document.getElementById('favDialog');
const close_createPost = document.getElementById('close_createPost');

showButton.addEventListener('click', () => {
    favDialog.showModal();
});
close_createPost.addEventListener('click', () => {
    favDialog.close();
});

// create post
const container = document.querySelector(".container"),
    privacy = container.querySelector(".post .privacy"),
    arrowBack = container.querySelector(".audience .arrow-back");
    
privacy.addEventListener("click", () => {
    container.classList.add("active");
    close_createPost.style.display = 'none';
});

arrowBack.addEventListener("click", () => {
    container.classList.remove("active");
    close_createPost.style.display = 'block';
});

// Show-close dialog notifications
const showButton_notifications = document.getElementById('showDialog_Notifications');
const favDialog_notifications = document.getElementById('favDialog_notifications');
const close_notifications = document.getElementById('close_notifications');

close_notifications.addEventListener('click', () => {
    favDialog_notifications.close();
});
showButton_notifications.addEventListener('click', () => {
    favDialog_notifications.showModal();
});

// Show-close dialog follow
const showButton_follow = document.getElementById('showButton_follow');
const favDialog_follow = document.getElementById('favDialog_follow');
const close_follow = document.getElementById('close_follow');

close_follow.addEventListener('click', () => {
    favDialog_follow.close();
});
showButton_follow.addEventListener('click', () => {
    favDialog_follow.showModal();
});

// Show-close dialog setting
const showButton_setting = document.getElementById('showButton_setting');
const favDialog_setting = document.getElementById('favDialog_setting');
const close_setting = document.getElementById('close_setting');

close_setting.addEventListener('click', () => {
    favDialog_setting.close();
});
showButton_setting.addEventListener('click', () => {
    favDialog_setting.showModal();
});





