<%@ page import="flight_booking.Flight" %>
<%@ page import="flight_booking.Passenger" %>
<%@ page import="java.util.*" %>

<%
	String month = request.getParameter("monthdropdown");
	String day = request.getParameter("daydropdown");
	String year = request.getParameter("yeardropdown");
	String depCity = request.getParameter("depCity");
	String date = month + "/" + day + "/" + year;
	
	ArrayList<Flight> ac01 = (ArrayList<Flight>)application.getAttribute("ac01");
	ArrayList<Flight> ac02 = (ArrayList<Flight>)application.getAttribute("ac02");
	ArrayList<Flight> ac03 = (ArrayList<Flight>)application.getAttribute("ac03");
	ArrayList<Flight> ac04 = (ArrayList<Flight>)application.getAttribute("ac04");
%>
<%!
	ArrayList<Flight> getFlightsForDate(String date, String depCity,ArrayList<Flight> ac01,ArrayList<Flight> ac02,ArrayList<Flight> ac03,ArrayList<Flight> ac04){
	
		ArrayList<Flight> morningFlight=new ArrayList<Flight>();
		ArrayList<Flight> nightFlight=new ArrayList<Flight>();
		

		if(depCity.equals("YYZ")) {
			morningFlight = ac01;
			nightFlight = ac03;
		} else {
			morningFlight = ac02;
			nightFlight = ac04;
		}
		
		ArrayList<Flight> flights = new ArrayList<Flight>();
		for (int i=0; i < 14; i++) {
			String tmpDate = morningFlight.get(i).getDate();
			String tmpDate2 = nightFlight.get(i).getDate();
			if (tmpDate.equals(date)) {
				flights.add(morningFlight.get(i));
			}
			if (tmpDate2.equals(date)) {
				flights.add(nightFlight.get(i));
			}
		}
		return flights;
	}
	
	Boolean seatAvailable(ArrayList<String> seats) {
		return (seats.get(0).equals("*") || seats.get(1).equals("*") || seats.get(2).equals("*"));
	}
	
	Boolean noSeatsAvail(ArrayList<Flight> f) {
		Boolean ret = true;
		ArrayList<String> tmp = new ArrayList();
		for (int i = 0; i < 2; i++) {
			tmp = f.get(i).getSeats();
			for(int j = 0; j < 3; j++) {
				if(tmp.get(j)=="*") {
					ret = false;
					return ret;
				}
			}
		}
		return ret;
	}
%>

<html>
	<head>
		<title>Flights available on <%= date%></title>
		<link rel="Stylesheet" type="text/css" href="Flight_Listing.css" />
		<script type="text/javascript" src="Flight_Listing.js"></script>
	</head>
	<body>
		<div class="mainWindow">	
		<%
			ArrayList<Flight> flights = getFlightsForDate(date, depCity, ac01, ac02, ac03, ac04);
			//Check if the date selected is within 2 weeks.
			if(flights.size() == 0){
		%>
			<form action="index.jsp">
				<p>No flight available on this day yet!</p>
				<input type="Submit" value="OK" />
			</form>
		<%
			} else {
				if(noSeatsAvail(flights)) {
		%>
			<form action="index.jsp">
			<p>All seates are reserved on <%= date%>!</p>
			<input type="Submit" value="OK" />
			</form>
		<%
				} else {
		%>
				<form action="Choose_Seat.jsp">
					<table>
						<tr>
						<td>Flight Number</td>
						<td>Price</td>
						<td>Time</td>
						</tr>
						<%	int flag = 0;
							for (int i=0; i < flights.size(); i++) {
								Flight f = (Flight)flights.get(i);
								String fNum = f.getFlightNumber();
								String time = f.getTime();
								int fid = f.getFID();
								ArrayList<String> seats = f.getSeats();
								if(seatAvailable(seats)){
						%>
						<tr>
						<td><input type="radio" name="fid" value='<%= fid%>'  <%if((i == 0)||( flag==0 )){%> checked/> <%flag = 1;} else {%>/> <%}%>
						<%= fNum%></td>
						<td>$100</td>
						<td><%= time%></td>
						</tr>
						<%
								}
							}
						%>
					</table>
					<input class="button" type="submit" value="Select" />
					<button type="button"onclick="history.go(-1)">Back</button>
				</form> 
		<%
				}
			}	
		%>
		</div>
	</body>
</html>