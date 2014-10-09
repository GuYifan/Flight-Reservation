<!-- Begin: ListTheatres.jsp -->
<%@ page import="flight_booking.Passenger" %>
<%@ page import="flight_booking.Flight" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%!
	ArrayList<Flight> getRsvd(ArrayList<Flight> ac01, ArrayList<Flight> ac02, ArrayList<Flight> ac03, ArrayList<Flight> ac04) {
		ArrayList<Flight> ret = new ArrayList();
		ArrayList<Flight> tmp = new ArrayList();
		
		tmp = getRsvdForOne(ac01);
		for(int i = 0; i < tmp.size(); i++){
			ret.add(tmp.get(i));
		}
		
		tmp = getRsvdForOne(ac02);
		for(int i = 0; i < tmp.size(); i++){
			ret.add(tmp.get(i));
		}

		tmp = getRsvdForOne(ac03);
		for(int i = 0; i < tmp.size(); i++){
			ret.add(tmp.get(i));
		}

		tmp = getRsvdForOne(ac04);
		for(int i = 0; i < tmp.size(); i++){
			ret.add(tmp.get(i));
		}
		
		return ret;
	}
	
	ArrayList<Flight> getRsvdForOne(ArrayList<Flight> ac) {
		ArrayList<Flight> ret = new ArrayList();
		for(int i = 0; i < ac.size(); i++) {
			Flight tmp = ac.get(i);
			ArrayList<String> tmpS = new ArrayList();
			tmpS = tmp.getSeats();
			if(seatReserved(tmpS)){
				ret.add(tmp);
			}
		}
		return ret;
	}
	
	Boolean seatReserved(ArrayList<String> seats) {
		return (!seats.get(0).equals("*") || !seats.get(1).equals("*") || !seats.get(2).equals("*"));
	}
	
	Passenger getPsng(String pid, Flight f) {
		Passenger ret = null;
		int tmpPID = new Integer(pid).intValue();
		ArrayList<Passenger> passengers = new ArrayList(); 
		passengers = f.getPassenger();
		for(int i = 0; i < passengers.size(); i++) {
			Passenger tmpP = passengers.get(i);
			if(tmpPID == tmpP.getPID()){
				ret = tmpP;
				break;
			}
		}
		return ret;
}
%>

<%
	ArrayList<Flight> ac01 = (ArrayList<Flight>)application.getAttribute("ac01");
	ArrayList<Flight> ac02 = (ArrayList<Flight>)application.getAttribute("ac02");
	ArrayList<Flight> ac03 = (ArrayList<Flight>)application.getAttribute("ac03");
	ArrayList<Flight> ac04 = (ArrayList<Flight>)application.getAttribute("ac04");
	
	ArrayList<Flight> flights = new ArrayList();
	flights = getRsvd(ac01, ac02, ac03, ac04);
	
	ArrayList<String> tmpS = new ArrayList();
%>

<html>
	<head>
		<title>All Reserved Seats</title>
		<link rel="Stylesheet" type="text/css" href="CheckReserved.css" />
	</head>
	<body>
		<div class="mainWindow">
		<table>
			<tr>
				<td>Flight Number</td>
				<td>Passenger Name</td>
				<td>Departure Date</td>
				<td>Time</td>
				<td>Seat</td>
				<td>CC EXP Date</td>
				<td>Billing Address</td>
				<td>Booked Time</td>
			</tr>
			<%
				for(int i = 0; i < flights.size(); i++){
					Flight tmpF = flights.get(i);
					tmpS = tmpF.getSeats();
					for(int j = 0; j < 3; j++){
						if(!tmpS.get(j).equals("*")){
							String tmpFN = tmpF.getFlightNumber();
							String tmpD = tmpF.getDate();
							String tmpT = tmpF.getTime();
							String tmpP = null;
							if(j == 0){
								tmpP = "1";
							}
							if(j == 1){
								tmpP = "2";
							}
							if(j == 2){
								tmpP = "3";
							}
							Passenger tmpPsng = getPsng(tmpS.get(j), tmpF);
							String tmpPName = tmpPsng.getName();
							String tmpBT = tmpPsng.getbookTime();
							String expDate = tmpPsng.getExpDate();
							String bAddr = tmpPsng.getAddress();
			%>
			<tr>
				<td><%= tmpFN%></td>
				<td><%= tmpPName%></td>
				<td><%= tmpD%></td>
				<td><%= tmpT%></td>
				<td><%= tmpP%></td>
				<td><%= expDate%></td>
				<td><%= bAddr%></td>
				<td><%= tmpBT%></td>
			</tr>			
			<%
						}
					}
				}
			%>
		</table>
		<form action="index.jsp">
			<input type="Submit" value="OK" />&nbsp;&nbsp;<button type = "button" onclick="window.print()">Print</button>
		</form>
		</div>
	</body>
</html>