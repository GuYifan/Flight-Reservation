package flight_booking;

import java.util.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class Passenger {
	public int pid;
	public String name, flightNumber, date, cardNumber;
	public String bookTime, address, expDate;
	
	public Passenger (int pid, String cardNumber, String flightNumber,  String name, String date) {
			       this.pid = pid;
			       this.flightNumber = flightNumber;
			       this.cardNumber = cardNumber;
			       this.name = name;
			       this.date = date;
		       }
		       
	public int getPID(){
		return this.pid;
	}
	
	public String getCardNumber(){
		return this.cardNumber;
	}
	
	public String getName(){
		return this.name;
	}
	
	public String getFlightNumber(){
		return this.flightNumber;
	}
	
	public String getbookTime(){
		return this.bookTime;
	}
	
	public String getAddress(){
		return this.address;
	}
	
	public String getExpDate(){
		return this.expDate;
	}
	
	public void setPID(int pid) {
		this.pid = pid;
	}
	
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setFlightNumber(String flightNumber) {
		this.flightNumber = flightNumber;
	}
	
	public void setbookTime(String bookTime){
		this.bookTime = bookTime;
	}
	
	public void setAddress(String address){
		this.address = address;
	}
	
	public void setExpDate(String expDate){
		this.expDate = expDate;
	}
}