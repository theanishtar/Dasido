let fileInputPost = '';
let imagesContainerPost = '';
let data = '';
let filesInputPostUpdate = '';
function loadImg(id) {
	fileInputPost = document.getElementById('ip_images' + id);
	imagesContainerPost = document.getElementById('images-to-upload' + id);
	data = window.sessionStorage;
}
function addImg(ev) {
	let filesPost = ev.target.files;
	let blobsPost = toBlobs(filesPost);
	filesInputPostUpdate = blobsPost;
	console.log(fileInputPost.filesPost)
	imagesContainerPost.innerHTML = '';
	blobsPost.forEach(appendImgPost);
}



function toBlobs(files) {
	let blobsPost = [];
	for (let i = 0; i < files.length; i++) {
		let file = files.item(i);
		console.log(file)
		let blob = new Blob([file], { type: file.type });
		blobsPost.push(blob);
	}

	return blobsPost;
}
function appendImgPost(src) {
	let imgSrcPost = URL.createObjectURL(src);
	let imageEltPost = document.createElement('IMG');

	imageEltPost.src = imgSrcPost;

	imagesContainerPost.appendChild(imageEltPost);
}
function getDistrictsUpdatePost(param,id) {
	var provinces = param.value;
	alert(id)
	$.ajax({
		url: "/getDistricts",
		type: "get", //send it through get method
		data: {
			selectProvince: provinces
		},
		success: function(data) {
			let districts = document.getElementById('selectDistrict'+id);
			districts.innerHTML = data;
		},
		error: function(xhr) {
			//Do Something to handle error
		}
	});
}

function getWardsUpdatePost(param,id) {
	var wards = param.value;
	$.ajax({
		url: "/getWards",
		type: "get", //send it through get method
		data: {
			selectDistrict: wards
		},
		success: function(data) {
			let districts = document.getElementById('selectWards'+id);
			districts.innerHTML = data;
		},
		error: function(xhr) {
			//Do Something to handle error
		}
	});
}