package com.scorpio.bean;

import java.util.ArrayList;
import java.util.List;

public class Address {
	private String street;
	private String city;
	private int zip;
	private PhoneNumbers phoneNumbers = new PhoneNumbers();
	public Address(){
		
	}
	public Address(String street, String city, int zip, Object...ob){
		this.street = street;
		this.city = city;
		this.zip = zip;
		List<String> ps = new ArrayList<String>();
		for (int i = 0; i < ob.length; i++) {
			ps.add((String) ob[i]);
		}
		this.phoneNumbers.setPhone(ps);
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getZip() {
		return zip;
	}
	public void setZip(int zip) {
		this.zip = zip;
	}
	public PhoneNumbers getPhoneNumbers() {
		return phoneNumbers;
	}
	public void setPhoneNumbers(PhoneNumbers phoneNumbers) {
		this.phoneNumbers = phoneNumbers;
	}
	
}
