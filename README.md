Flight-Reservation
==================

Flight Reservation Web System

Author: YIFAN GU

It may takes time to load the background image at first time, so please be
patient.

1.JAVA files:

There are two object classed in a3/WEB-INF/src/flight_booking and they are
Flight.java and Passenger.java. 

Flight.java represents a flight object and
stores all information about a flight. 

Passenger.java represents a passerger (or say ticekt) object and stores all
information about a passenger.

Initialization.java initializes all the useful data in memory. Data is all
flights in the following 14 days.

2.Some rules in this system:

The flight number are: AC01, AC02, AC03, AC04.
AC01 leaves from Toronto to Montreal at 10 A.M. everyday.
AC02 leaves from Montreal to Toronto at 10 A.M. everyday.
AC03 leaves from Toronto to Montreal at 8 P.M. everyday.
AC04 leaves from Montreal to Toronto at 8 P.M. everyday.

Each flight has an unique fid.
Ecah passenger has an unique passenger id pid.
All flights stores in an ArrayList of flights.
Each flight contains an ArrayList of all passengers it carries.


3.JSP files: 

There are 6 JSP files in a3/jsp, and they are index.jsp, Flight_Listing.jsp,
Choose_Seat.jsp, Pay.jsp, Summary.jsp and CheckReserved.jsp.

In index.jsp, it let you choose the date and departure city for a flight.
If the user clicks on search, it will take the user to Flight_Listing.jsp.

In Flight_Listing, the system lists all availaible flights (seats available on
the flight) on that date. The user can click continue to choose a seat for one
flight.

In Choose_Seat.jsp, the system lists all available seats, the user can select on
they like. After this the user goes to a page to pay for the ticket.

In Pay.jsp, the user has to input all payment information.
Every line in the form needs to be filled out.
Postal code has to be valid Canadian postal code.
Credit card number has to be 16-digit long.
Every other information cannot be numbers.

After the user pays for the ticket, system will display a summary sheet in
Summary.jsp. User can print it out by clicking on print button.

In index.jsp page, the user also can click on "Check Reseserved" button to see
information about all reserved seats.


If you have any questions about this system, please do not hesitate to contact
me via my email: evangyf@gmail.com.

Thanks for your time!
