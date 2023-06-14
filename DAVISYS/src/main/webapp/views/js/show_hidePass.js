function showHidePass() {
  var input = document.getElementById("passwordForm");
  if (input.type === "password") {
    input.type = "text";
    document.getElementById("eye").className = "fa-regular fa-eye";
  } else {
    input.type = "password";
    document.getElementById("eye").className = "fa-regular fa-eye-slash";
  }
}

function showHidePass1() {
   var input = document.getElementById("inputPasswordOld");
  if (input.type === "password") {
    input.type = "text";
    document.getElementById("eye").className = "fa-regular fa-eye";
  } else {
    input.type = "password";
    document.getElementById("eye").className = "fa-regular fa-eye-slash";
  }
}

function showHidePass2() {
   var input = document.getElementById("inputPasswordNew");
  if (input.type === "password") {
    input.type = "text";
    document.getElementById("eye1").className = "fa-regular fa-eye";
  } else {
    input.type = "password";
    document.getElementById("eye1").className = "fa-regular fa-eye-slash";
  }
}

function showHidePass3() {
   var input = document.getElementById("inputPasswordConfirm");
  if (input.type === "password") {
    input.type = "text";
    document.getElementById("eye2").className = "fa-regular fa-eye";
  } else {
    input.type = "password";
    document.getElementById("eye2").className = "fa-regular fa-eye-slash";
  }
}