function change_Color(selected) {
	var lft = document.getElementById("left");
	var md = document.getElementById("mid");
	var rght = document.getElementById("right");
	var slctd = document.getElementById(selected.id);
	var seat = document.getElementById("seat");
	
	if(slctd.style.backgroundColor == "Yellow") {
		return;
	} else {
		if(lft.style.backgroundColor == "Green" ) {
			lft.style.backgroundColor = "White";
			slctd.style.backgroundColor = "Green";
			seat.setAttribute("value", selected.id);
			return;
		}
		if(md.style.backgroundColor == "Green" ) {
			md.style.backgroundColor = "White";
			slctd.style.backgroundColor = "Green";
			seat.setAttribute("value", selected.id);
			return;
		}
		if(rght.style.backgroundColor == "Green" ) {
			rght.style.backgroundColor = "White";
			slctd.style.backgroundColor = "Green";
			seat.setAttribute("value", selected.id);
			return;
		}
		
		slctd.style.backgroundColor = "Green";
		seat.setAttribute("value", selected.id);
		
		var form = document.getElementById("form");
		var input = document.createElement("input");
		input.setAttribute("type", "submit");
		input.setAttribute("value", "Continue");
		form.appendChild(input);
		
		return;
	}
}