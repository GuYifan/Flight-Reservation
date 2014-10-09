<%@ page import="flight_booking.Flight" %>
<%@ page import="flight_booking.Passenger" %>
<%@ page import="java.util.*" %>

<%	
	String fid = request.getParameter("fid");
	String seat = request.getParameter("seat");
	int seatNum = 0;
	if(seat.equals("left")) {
		seatNum = 0;
	}
	if(seat.equals("mid")) {
		seatNum = 1;
	}
	if(seat.equals("right")) {
		seatNum = 2;
	}
%>

<html>
	<head>
		<title>Pay for the ticket</title>
		<link rel="Stylesheet" type="text/css" href="pay.css" />
		<script type="text/javascript" src="pay.js"></script>
	</head>
	<body>
		<div class="mainWindow">
		<form name="payForm" action="Summary.jsp" ENCTYPE="multipart/form-data" onsubmit="return validateForm()">
			<table width=518 border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
				<tr class='title'>
				<td class="tdtitle"><strong>&nbsp;Billing Information (required)</strong></td>
				</tr>
				<tr>
				<td class="fn">First Name:</td>
				<td class="input"><input name="firstName" type="text" size="50"></td>
				</tr>
				<tr>
				<td class="ln">Last Name:</td>
				<td class="input"><input name="lastName" type="text" size="50"></td>
				</tr>
				<tr>
				<td class="otherinfo">Street Address:</td>
				<td class="input"><input name="address1" type="text" value="" size="50"></td>
				</tr>
				<tr>
				<td class="otherinfo">City:</td>
				<td class="input"><input name="city" type="text" value="" size="50"></td>
				</tr>
				<tr>
				<td class="otherinfo">Province:</td>
				<td class="input"><input name="state" type="text" value="" size="50"></td>
				</tr>
				<tr>
				<td class="otherinfo">Zip/Postal Code:</td>
				<td class="input"><input name="zip" type="text" value="" size="50"></td>
				</tr>
				<tr>
				<td class="space">&nbsp;</td>
				</tr>
				<tr class="card">
				<td height="22" colspan="3" align="left" valign="middle"><strong>&nbsp;Credit Card (required)</strong></td>
				</tr>
				<tr>
				<td class="ln">Credit Card Number:</td>
				<td class="new"><input name="CCNo" type="text" value="" class="card"></td>
				</tr>
				<tr>
				<td class="otherinfo">Card Type:</td>
				<td class="cardRltd">
				<select NAME="CCType" >
					<OPTION VALUE="" SELECTED>--Type--
					<OPTION VALUE="UnionPay">UnionPay
					<OPTION VALUE="MastarCard">MastarCard
					<OPTION VALUE="Viza">Viza
				</select>
				</td>
				</tr>
				<tr>
				<td class="ln">Expiry Date:</td>
				<td class="new">
				<select name = "CCExpiresMonth" >
					<option VALUE="" SELECTED>--Month--
					<option VALUE="01">January (01)
					<option VALUE="02">February (02)
					<option VALUE="03">March (03)
					<option VALUE="04">April (04)
					<option VALUE="05">May (05)
					<option VALUE="06">June (06)
					<option VALUE="07">July (07)
					<option VALUE="08">August (08)
					<option VALUE="09">September (09)
					<option VALUE="10">October (10)
					<option VALUE="11">November (11)
					<option VALUE="12">December (12)
				</select> /
				<select name = "CCExpiresYear">
					<option VALUE="" SELECTED>--Year--
					<option VALUE="12">2012
					<option VALUE="13">2013
					<option VALUE="14">2014
					<option VALUE="15">2015
				</select>
				</td>
				</tr>
				<tr>
				<td class="title">&nbsp;</td>
				</tr>
			</table>
			<input name="Submit" type="submit" value="Send Secure Form &gt;&gt;">
			<button type="button"onclick="history.go(-1)">Back</button>
			<input type="hidden" name="fid" value='<%= fid%>' />
			<input type="hidden" name="seat" value='<%= seatNum%>' />
		</form>
		</div>
	</body>
</html>