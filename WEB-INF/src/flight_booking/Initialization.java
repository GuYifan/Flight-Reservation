package flight_booking;

import javax.servlet.http.*;
import java.util.*;
import java.lang.*;

public class Initialization extends HttpServlet {
	private String[] months = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
	private String ac1 = "AC01";
	private String ac2 = "AC02";
	private String ac3 = "AC03";
	private String ac4 = "AC04";
	private String yyz = "Toronto";
	private String ylu = "Montreal";
	private String morning = "10 A.M." ;
	private String evening = "8 P.M." ;
	private ArrayList<String> seats = new ArrayList();
	
	public void init() {
		Calendar cal = Calendar.getInstance();
		int today = cal.get(Calendar.DATE);
		int month = cal.get(Calendar.MONTH);
		int year = cal.get(Calendar.YEAR);
		
		seats.add("*");
		seats.add("*");
		seats.add("*");
		
		// Flight ID
		int flightNum = 0;
		// Passenger ID
		int psgNum = 0;
		// All flights
		ArrayList<Flight> ac01 = new ArrayList();
		ArrayList<Flight> ac02 = new ArrayList();
		ArrayList<Flight> ac03 = new ArrayList();
		ArrayList<Flight> ac04 = new ArrayList();
		
		for(int i = 0; i < 14; i++){

			// AC01 form Toronto to Montreal in the morning.
			String tmpDate = getDate(i, today, month, year); 
			Flight flt1 = new Flight(flightNum++, ac1, yyz, tmpDate, morning, seats);
			ac01.add(flt1);
			
			// AC02 form Montreal to Toronto in the morning.
			Flight flt2 = new Flight(flightNum++, ac2, ylu, tmpDate, morning, seats);
			ac02.add(flt2);
			
			// AC03 form Toronto to Montreal in the evening.
			Flight flt3 = new Flight(flightNum++, ac3, yyz, tmpDate, evening, seats);
			ac03.add(flt3);
			
			// AC04 form Montreal to Toronto in the evening.
			Flight flt4 = new Flight(flightNum++, ac4, ylu, tmpDate, evening, seats);
			ac04.add(flt4);
		}
		this.getServletContext().setAttribute("ac01", ac01);
		this.getServletContext().setAttribute("ac02", ac02);
		this.getServletContext().setAttribute("ac03", ac03);
		this.getServletContext().setAttribute("ac04", ac04);
		this.getServletContext().setAttribute("psgNum", psgNum);
	}
	
	private String getDate(int i, int today, int month, int year){
		int limit = 31;
		int day = today;
		
		if(month == 1){
			limit = 28;
		}
		
		if((month == 3)||(month == 5)||(month == 8)||(month == 10)){
			limit = 30;
		}
		
		if((i+today+1) > limit){
			month++;
			day = today + i + 1 - limit;
		} else {
			day = today + i + 1;
		}
		
		String date = months[month] + "/" + Integer.toString(day) + "/" + Integer.toString(year);
		
		return date;
	}
}
