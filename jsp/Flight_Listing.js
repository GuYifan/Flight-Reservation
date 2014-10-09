function validateForm() {
	var x = document.forms["payForm"]["CCNo"].value;
	if (x == null || x == "" ) {
		alert("Credit card number must be filled out!");
		return false;
	}
}
			
function goHome(){
	window.location = "index.jsp"
}