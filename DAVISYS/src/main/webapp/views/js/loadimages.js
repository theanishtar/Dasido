const fileInput = document.getElementById('ip_images');
const imagesContainer = document.getElementById('images-to-upload');
const db = window.sessionStorage;

fileInput.addEventListener('change', (ev) => {
	const files = ev.target.files;
	const blobs = toBlob(files);
	console.log(fileInput.files)
	imagesContainer.innerHTML = '';
	blobs.forEach(appendImg);
});


function toBlob(files) {
	const blobs = [];

	for (let i = 0; i < files.length; i++) {
		let file = files.item(i);
		console.log(file)
		let blob = new Blob([file], { type: file.type });
		blobs.push(blob);
	}

	return blobs;
}
function appendImg(src) {
	const imgSrc = URL.createObjectURL(src);
	const imageElt = document.createElement('IMG');

	imageElt.src = imgSrc;

	imagesContainer.appendChild(imageElt);
}