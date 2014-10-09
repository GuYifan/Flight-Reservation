package flight_booking;

import java.util.*;

public class Flight {
	public int fid;
	public String flightNumber, depCity, time, date;
	public ArrayList<String> seats = new ArrayList<String>();
	public ArrayList<Passenger> passengers = new ArrayList();
	
	public Flight (int fid, String flightNumber, String depCity, String date, 
		       String time,  ArrayList<String> seats) {
			      this.fid = fid;
			      this.flightNumber = flightNumber;
			      this.depCity = depCity;
			      this.date = date;
			      this.time = time;
			      this.seats = seats;
		      }
		      
	public int getFID(){
		return this.fid;
	}
	
	public String getFlightNumber(){
		return this.flightNumber;
	}
	
	public String getDepCity(){
		return this.depCity;
	}
	
	public String getTime(){
		return this.time;
	}
	
	public String getDate(){
		return this.date;
	}
	
	public ArrayList<String> getSeats(){
		return this.seats;
	}
	
	public void setFID(int fid) {
		this.fid = fid;
	}
	
	public void setFlightNumber(String flightNumber) {
		this.flightNumber = flightNumber;
	}
	
	public void setDepCity(String depCity) {
		this.depCity = depCity;
	}
	
	public void setTime(String time) {
		this.time = time;
	}
	
	public void setDate(String date) {
		this.date = date;
	}
	
	public void setSeats(ArrayList<String> seats) {
		this.seats = seats;
	}
	
	public void addPassenger(Passenger p) {
		passengers.add(p);
	};
	
	public ArrayList<Passenger> getPassenger() {
		return this.passengers;
	};
}