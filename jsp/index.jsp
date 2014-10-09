<!-- Begin: ListTheatres.jsp -->
<%@ page import="flight_booking.Passenger" %>
<%@ page import="flight_booking.Flight" %>

<html>
	<head>
		<title>Flight Booking</title>
		<link rel="Stylesheet" type="text/css" href="index.css" />
		<script type="text/javascript" src="index.js"></script>
	</head>
	<body>
		<div class="mainWindow">
		<h1>Welcome to Flight Booking!</h1>
		<p>Please select the city and date below:</p>
		<form action="Flight_Listing.jsp" name="selection" ENCTYPE="multipart/form-data">
			Date:&nbsp;&nbsp;
			<select id="monthdropdown" name="monthdropdown">
			</select> 
			<select id="daydropdown" name="daydropdown">
			</select> 
			<select id="yeardropdown" name="yeardropdown">
			</select> 
			<br/><br/>
			Departure City:
			<select id="depCity" name="depCity">
				<option value = "YYZ">Toronto</option>
				<option value = "YLU">Montreal</option>
			</select>
			<br/><br/>
			<input type="submit" value='Check Availability' />
			<button type="button" onclick="seeRsrv()">Reserved Seats</button>
		</form>
		</div>
		<script type="text/javascript">
			window.onload=function(){
				populatedropdown("daydropdown", "monthdropdown", "yeardropdown")
			}
		</script>
	</body>
</html>