

// show - close dialog detailPost
const showButton_detailPost = document.getElementById('showButton_detailPost');
const favDialog_detailPost = document.getElementById('favDialog_detailPost');
const close_detailPost = document.getElementById('close');

close_detailPost.addEventListener('click', () => {
    favDialog_detailPost.close();
});
showButton_detailPost.addEventListener('click', () => {
    favDialog_detailPost.showModal();
});

// show - close dialog update post
const showButton_updatePost = document.getElementById('showButton_updatePost');
const favDialog_updatePost = document.getElementById('favDialog_updatePost');
const close_updatePost = document.getElementById('close2');

close_updatePost.addEventListener('click', () => {
    favDialog_updatePost.close();
});
showButton_updatePost.addEventListener('click', () => {
    favDialog_updatePost.showModal();
});