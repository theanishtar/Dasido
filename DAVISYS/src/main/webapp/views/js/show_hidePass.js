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