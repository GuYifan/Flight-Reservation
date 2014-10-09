<%@ page import="flight_booking.Flight" %>
<%@ page import="flight_booking.Passenger" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>

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
	
	Passenger createPassenger(String date, String cardNumber, String flightNumber, String firstName, String lastName, int psgNum, String expDate, String address){
		String name = firstName + " " + lastName;
		int pid = psgNum;
		Passenger p = new Passenger(pid, cardNumber, flightNumber, name, date);
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		p.setbookTime(dateFormat.format(new Date()));
		p.setExpDate(expDate);
		p.setAddress(address);
		return p;
	}
	
	void reserveSeat(int fid, int p, String seat, ArrayList<Flight> ac01,ArrayList<Flight> ac02,ArrayList<Flight> ac03,ArrayList<Flight> ac04){
		Flight f = getFlight(fid, ac01, ac02, ac03, ac04);
		ArrayList tmp = f.getSeats();
		ArrayList tmp2 = new ArrayList();
		for(int i = 0; i < 3; i++){
			tmp2.add(tmp.get(i));
		}
		if(seat.equals("0")){
			tmp2.set(0, ""+p); 
		}
		if(seat.equals("1")){
			tmp2.set(1, ""+p); 
		}
		if(seat.equals("2")){
			tmp2.set(2, ""+p); 
		}
		f.setSeats(tmp2);
	}
%>

<%	
	int fid = new Integer(request.getParameter("fid")).intValue();
	String seat = request.getParameter("seat");
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");
	String cardNumber = request.getParameter("CCNo");
	String expDate = request.getParameter("CCExpiresMonth") + "/" + request.getParameter("CCExpiresYear");
	String address = request.getParameter("address1") + " " + request.getParameter("city") + " " + request.getParameter("state") + " " + request.getParameter("zip");
	
	ArrayList<Flight> ac01 = (ArrayList<Flight>)application.getAttribute("ac01");
	ArrayList<Flight> ac02 = (ArrayList<Flight>)application.getAttribute("ac02");
	ArrayList<Flight> ac03 = (ArrayList<Flight>)application.getAttribute("ac03");
	ArrayList<Flight> ac04 = (ArrayList<Flight>)application.getAttribute("ac04");
	
	Flight flight = this.getFlight(fid, ac01, ac02, ac03, ac04);
	String flightNumber = flight.getFlightNumber();
	String date = flight.getDate();
	String time = flight.getTime();
	
	ArrayList tmp = getFlight(fid, ac01, ac02, ac03, ac04).getSeats();
	if(seat.equals("0")){
		if(tmp.get(0)!="*"){
	%>
		<jsp:forward page="index.jsp" />
	<%
		}
	}
	if(seat.equals("1")){
		if(tmp.get(1)!="*"){
	%>
		<jsp:forward page="index.jsp" />
	<%
		}	 
	}
	if(seat.equals("2")){
		if(tmp.get(2)!="*"){
	%>
		<jsp:forward page="index.jsp" />
	<%
		}	
	}

	
	String tmp2 = application.getAttribute("psgNum").toString();
	int psgNum = Integer.parseInt(tmp2) + 1;
	application.setAttribute("psgNum", psgNum);
	
	Passenger p = this.createPassenger(date, cardNumber, flightNumber, firstName, lastName, psgNum, expDate, address);
	flight.addPassenger(p);
	this.reserveSeat(fid, p.getPID(), seat, ac01, ac02, ac03, ac04);
%>

<html>
	<head>
		<title><%= firstName%> <%= lastName%>'s ticket for <%= flightNumber%> on <%= time%> <%= date%></title>
		<link rel="Stylesheet" type="text/css" href="Summary.css" />
		<script type="text/javascript" src="summary.js"></script>		
	</head>
	<body>
		<div class="mainWIndow">
		<table>
			<tr>
				<td>Passenger Name</td>
				<td>Flight Number</td>
				<td>Seat</td>
				<td>Date</td>
				<td>Time</td>
				<td>Tickets Sold</td>
			</tr>
			<%
				int seatNum = 0;
				if(seat.equals("0")){
					seatNum = 1;
				}
				if(seat.equals("1")){
					seatNum = 2;
				}
				if(seat.equals("2")){
					seatNum = 3;
				}
			%>
			<tr>
				<td><%= firstName%> <%= lastName%></td>
				<td><%= flightNumber%></td>
				<td><%= seatNum%></td>
				<td><%= date%></td>
				<td><%= time%></td>
				<td><%= psgNum%></td>
			</tr>
		</table>
		<button type="button" onclick="goHome()" >OK</button>&nbsp;&nbsp;<button type = "button" onclick="window.print()">Print</button>
	</div>
	</body>
</html>