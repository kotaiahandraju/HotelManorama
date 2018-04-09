package com.aurospaces.neighbourhood.bean;


import java.util.Date;

public class HotelRoomUserDetailsBean 
{
protected int id   = 0;
protected String name;
protected String mobileNumber ;
protected String roomNumber ;
protected String alternateMobileNumber ;
protected String city ;
protected String address;
protected String country,email;
protected Date createdTime ;
protected Date updatedTime ;
protected String checkIn ;
protected String checkOut ;
protected String roomTypeId ;
protected String capacityId,noOfRooms,roomPrice,GST,totalPrice,roomsStatus,userDetailsId,bookingStatus,numberOfAdult,numberOfChaild ;





public String getNumberOfAdult() {
	return numberOfAdult;
}
public void setNumberOfAdult(String numberOfAdult) {
	this.numberOfAdult = numberOfAdult;
}
public String getNumberOfChaild() {
	return numberOfChaild;
}
public void setNumberOfChaild(String numberOfChaild) {
	this.numberOfChaild = numberOfChaild;
}
public String getBookingStatus() {
	return bookingStatus;
}
public void setBookingStatus(String bookingStatus) {
	this.bookingStatus = bookingStatus;
}
public String getUserDetailsId() {
	return userDetailsId;
}
public void setUserDetailsId(String userDetailsId) {
	this.userDetailsId = userDetailsId;
}
public String getCheckIn() {
	return checkIn;
}
public void setCheckIn(String checkIn) {
	this.checkIn = checkIn;
}
public String getCheckOut() {
	return checkOut;
}
public void setCheckOut(String checkOut) {
	this.checkOut = checkOut;
}
public String getRoomTypeId() {
	return roomTypeId;
}
public void setRoomTypeId(String roomTypeId) {
	this.roomTypeId = roomTypeId;
}
public String getCapacityId() {
	return capacityId;
}
public void setCapacityId(String capacityId) {
	this.capacityId = capacityId;
}
public String getNoOfRooms() {
	return noOfRooms;
}
public void setNoOfRooms(String noOfRooms) {
	this.noOfRooms = noOfRooms;
}
public String getRoomPrice() {
	return roomPrice;
}
public void setRoomPrice(String roomPrice) {
	this.roomPrice = roomPrice;
}
public String getGST() {
	return GST;
}
public void setGST(String gST) {
	GST = gST;
}
public String getTotalPrice() {
	return totalPrice;
}
public void setTotalPrice(String totalPrice) {
	this.totalPrice = totalPrice;
}
public String getRoomsStatus() {
	return roomsStatus;
}
public void setRoomsStatus(String roomsStatus) {
	this.roomsStatus = roomsStatus;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getMobileNumber() {
	return mobileNumber;
}
public void setMobileNumber(String mobileNumber) {
	this.mobileNumber = mobileNumber;
}
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