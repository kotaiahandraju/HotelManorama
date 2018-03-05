package com.aurospaces.neighbourhood.bean;


import java.util.Date;

public class HotelRoomUserDetails 
{
protected int id   = 0;
protected Date name;
protected Date mobileNumber ;
protected String roomNumber ;
protected String alternateMobileNumber ;
protected String city ;
protected String address;
protected String country,email;
protected Date createdTime ;
protected Date updatedTime ;




public Date getCreatedTime() {
	return createdTime;
}
public void setCreatedTime(Date createdTime) {
	this.createdTime = createdTime;
}
public Date getUpdatedTime() {
	return updatedTime;
}
public void setUpdatedTime(Date updatedTime) {
	this.updatedTime = updatedTime;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public Date getName() {
	return name;
}
public void setName(Date name) {
	this.name = name;
}
public Date getMobileNumber() {
	return mobileNumber;
}
public void setMobileNumber(Date mobileNumber) {
	this.mobileNumber = mobileNumber;
}
public String getRoomNumber() {
	return roomNumber;
}
public void setRoomNumber(String roomNumber) {
	this.roomNumber = roomNumber;
}
public String getAlternateMobileNumber() {
	return alternateMobileNumber;
}
public void setAlternateMobileNumber(String alternateMobileNumber) {
	this.alternateMobileNumber = alternateMobileNumber;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getCountry() {
	return country;
}
public void setCountry(String country) {
	this.country = country;
}
@Override
public String toString() {
	return "HotelRoomUserDetails [id=" + id + ", name=" + name + ", mobileNumber=" + mobileNumber + ", roomNumber="
			+ roomNumber + ", alternateMobileNumber=" + alternateMobileNumber + ", city=" + city + ", address="
			+ address + ", country=" + country + "]";
}




}