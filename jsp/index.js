		function seeRsrv(){
			window.location = "CheckReserved.jsp"
		}

		var monthtext=['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sept','Oct','Nov','Dec'];
	
		function populatedropdown(dayfield, monthfield, yearfield){
			var today = new Date();
			var dayfield = document.getElementById(dayfield);
			var monthfield=document.getElementById(monthfield);
			var yearfield=document.getElementById(yearfield);
			for (var i=0; i<31; i++){
				dayfield.options[i]=new Option(i, i+1);
				dayfield.options[i].setAttribute("value", i);
			}
			dayfield.options[today.getDate() + 1]=new Option(today.getDate() + 1, today.getDate() + 1, true, true);
			
			for (var m=0; m<12; m++){
				monthfield.options[m]=new Option(monthtext[m], monthtext[m]);
				monthfield.options[m].setAttribute("value", monthtext[m]);
			}
			monthfield.options[today.getMonth()]=new Option(monthtext[today.getMonth()], monthtext[today.getMonth()], true, true);
			
			var thisyear=today.getFullYear();
			for (var y=0; y<2; y++){
				yearfield.options[y]=new Option(thisyear, thisyear);
				yearfield.options[y].setAttribute("value", thisyear);
				thisyear+=1;
			}
			yearfield.options[0]=new Option(today.getFullYear(), today.getFullYear(), true, true);
		}