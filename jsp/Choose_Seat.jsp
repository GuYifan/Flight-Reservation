<%@ page import="flight_booking.Flight" %>
<%@ page import="flight_booking.Passenger" %>
<%@ page import="java.util.*" %>

<%!
	Flight getFlight(int fid, ArrayList<Flight> ac01,ArrayList<Flight> ac02,ArrayList<Flight> ac03,ArrayList<Flight> ac04){
		int which = fid % 4;
		int index = fid / 4;
		if(which == 0){
			return ac01.get(index);
		}
		if(which == 1){
			return ac02.get(index);
		}
		if(which == 2){
			return ac03.get(index);
		}
		return ac04.get(index);
	}
%>
		
<%	
	int fid = new Integer(request.getParameter("fid")).intValue();
	ArrayList<Flight> ac01 = (ArrayList<Flight>)application.getAttribute("ac01");
	ArrayList<Flight> ac02 = (ArrayList<Flight>)application.getAttribute("ac02");
	ArrayList<Flight> ac03 = (ArrayList<Flight>)application.getAttribute("ac03");
	ArrayList<Flight> ac04 = (ArrayList<Flight>)application.getAttribute("ac04");
	
	Flight flight = this.getFlight(fid, ac01, ac02, ac03, ac04);
	ArrayList<String> seats = flight.getSeats();
%>

<html>
	<head>
		<title>Seats available</title>
		<link rel="Stylesheet" type="text/css" href="chooseSeats.css" />
		<script type="text/javascript" src="chooseSeat.js"></script>
	</head>
	<body>
		<center>
		<h2>Choose a seat</h2>
		<form action="Pay.jsp" id="form">
			<div class="ellipseDiv">
			</div>
					<%
						if(seats.get(0).equals("*")) {
					%>
					<div class="leftDiv" id="left" onclick="change_Color(this)" >1</div>
					<%
						} else {
					%>
					<div class="leftDiv" id="left" onclick="change_Color(this)" style="background-color:Yellow">1</div>
					<%
						}
						if(seats.get(1).equals("*")) {
					%>
					<div class="midDiv" id="mid" onclick="change_Color(this)" >2</div>
					<%
							
						} else {
					%>
					<div class="midDiv" id="mid" onclick="change_Color(this)" style="background-color:Yellow">2</div>
					<%
						}
						if(seats.get(2).equals("*")) {
					%>
					<div class="rightDiv" id ="right" onclick="change_Color(this)" >3</div>
					<%
						} else {
					%>
					<div class="rightDiv" id ="right" onclick="change_Color(this)" style="background-color:Yellow">3</div>
					<%
						}
					%>
			<p>Select a seat by click on one seat icon and click "Continue" to pay for the ticket.</p>
			<input type="hidden" name="fid" value='<%= fid%>' />
			<input type="hidden" id="seat" name ="seat" value="" />
			<button type="button"onclick="history.go(-1)">Back</button>
		</form>	
		<center>
	</body>
</html>