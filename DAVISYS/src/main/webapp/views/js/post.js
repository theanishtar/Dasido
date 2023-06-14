function getDistricts(param) {
	var provinces = param.value;
	/*	alert(provinces)*/
	$.ajax({
		url: "/getDistricts",
		type: "get", //send it through get method
		data: {
			selectProvince: provinces
		},
		success: function(data) {
			let districts = document.getElementById('selectDistrict');
			districts.innerHTML = data;
		},
		error: function(xhr) {
			//Do Something to handle error
		}
	});
}

function getWards(param) {
	var wards = param.value;
	$.ajax({
		url: "/getWards",
		type: "get", //send it through get method
		data: {
			selectDistrict: wards
		},
		success: function(data) {
			let districts = document.getElementById('selectWards');
			districts.innerHTML = data;
		},
		error: function(xhr) {
			//Do Something to handle error
		}
	});
}