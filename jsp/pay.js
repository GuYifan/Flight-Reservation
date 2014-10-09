function validateForm() {
	var x = document.forms["payForm"]["CCNo"].value;
	if (x == null || x == "" ) {
		alert("Credit card number must be filled out!");
		return false;
	}
	if(!isNumeric(x)){
		alert("Credit card number must be numberic!");
		return false;
	}
	if((x.length < 16) || (x.length > 16)){
		alert("Correct credit card number must be 16 digits!");
		return false;
	}
				
	var y = document.forms["payForm"]["CCExpiresMonth"].value;
	if(y == "") {
		alert("Expiration month must be selected!");
		return false;
	}
				
	var z = document.forms["payForm"]["CCExpiresYear"].value;
	if(z == "") {
		alert("Expiration year must be selected!");
		return false;
	}
					
	var a = document.forms["payForm"]["CCType"].value;
	if(a == "") {
		alert("Credit card type must be selected!");
		return false;
	}
				
	var b = document.forms["payForm"]["firstName"].value;
	if(b == "" || isNumeric(b)) {
		alert("First name is wrong!");
		return false;
	}
				
	var c = document.forms["payForm"]["lastName"].value;
	if(c == "" || isNumeric(c)) {
		alert("Last name is wrong!");
		return false;
	}
				
	var d = document.forms["payForm"]["address1"].value;
	if(d == "" || isNumeric(d)) {
		alert("Address is wrong!");
		return false;
	}
				
	var e = document.forms["payForm"]["city"].value;
	if(e == "" || isNumeric(e)) {
		alert("City is wrong!");
		return false;
	}
				
	var f = document.forms["payForm"]["state"].value;
	if(f == "" || isNumeric(f)) {
		alert("Province is wrong!");
		return false;
	}
				
	var g = document.forms["payForm"]["zip"].value;
	if(g == "") {
		alert("Postal code is required!");
		return false;
	}
	if(!(isPostCode(g))){
		alert("Not valid Canadian postal code!");
		return false;
	}
}
			
function isNumeric(input) {
	return (input - 0) == input && input.length > 0;
}
			
function isPostCode(entry){
	strlen=entry.length;if(strlen!==6){return false;}
	entry=entry.toUpperCase(); 
	s1='ABCEGHJKLMNPRSTVXY';s2=s1+'WZ';d3='0123456789';
	if(s1.indexOf(entry.charAt(0))<0){return false;}
	if(d3.indexOf(entry.charAt(1))<0){return false;}
	if(s2.indexOf(entry.charAt(2))<0){return false;}
	if(d3.indexOf(entry.charAt(3))<0){return false;}
	if(s2.indexOf(entry.charAt(4))<0){return false;}
	if(d3.indexOf(entry.charAt(5))<0){return false;}
	return true;
}