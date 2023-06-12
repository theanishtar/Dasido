/*document.getElementById("setting-btn").addEventListener("click", function() {
	//changeMode();
	console.log(456)
	setMode();
});*/
function first() {
	var element = document.body;
	var e = document.getElementById("dn").checked;
	console.log("element span darkmode: " + e);
	if (e == false) {
		element.classList.add("dark-mode");
	} else {
		element.classList.toggle("dark-mode");
	}
	setMode();
}

function changeMode() {
	var element = document.body;
	element.classList.toggle("dark-mode");
}

function darkModeEffect() {
	var element = document.body;
	element.classList.toggle("dark-mode");
}

function changesIcon(x) {
	darkModeEffect();
	x.classList.toggle("bx-sun");
	setMode();
}

function setMode() {
	let darkMode = document.getElementsByClassName("dark-mode");
	//alert(darkMode.length)
	// 
	if (darkMode.length == 0) {
		// alert("dark mode -> light mode")
		localStorage.setItem("modeByThean", "light")
	} else {
		// alert("light mode -> dark mode")
		localStorage.setItem("modeByThean", "dark")
	}
	//changeGiscusTheme();
}

function getMode() {
	let elm = document.getElementById("favDialog_setting");
	console.log(elm)
	let darkMode = document.getElementsByClassName("dark-mode");
	if(darkMode.length == 1){
		document.getElementById("dn").checked = true;
	}
}

window.onload = function() {
	let mode = localStorage.getItem("modeByThean");
	if (mode == "dark") {
		let darkMode = document.getElementsByClassName("dark-mode");

		// 
		if (darkMode.length == 0) {
			// alert("dark mode -> light mode")
			darkModeEffect();

			//thay đổi icon
			//let icon = document.getElementsByClassName("sun-moon");
			//console.log(icon);
			//icon[0].classList.toggle("bx-sun");
			//icon[1].classList.toggle("bx-sun");
		} else {
			changeMode();
		}
	}
}


// comment
function changeGiscusTheme() {
	const theme = localStorage.getItem("modeByThean") || "light";
	function sendMessage(message) {
		const iframe = document.querySelector('iframe.giscus-frame');
		iframe.contentWindow.postMessage({ giscus: message }, 'https://giscus.app');
	}
	sendMessage({
		setConfig: {
			theme: theme
		}
	});
}