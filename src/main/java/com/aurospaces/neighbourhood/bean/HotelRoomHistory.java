package com.aurospaces.neighbourhood.bean;


import java.util.Date;

public class HotelRoomHistory 
{
protected int id   = 0;
protected Date createdTime ;
protected Date updatedTime ;
protected String userId ;
protected String checkIn ;
protected String checkOut ;
protected String roomTypeId ;
protected String capacityId,noOfRooms,roomPrice,GST,totalPrice,roomsStatus ;



@Override
public String toString() {
	return "HotelRoomHistory [id=" + id + ", createdTime=" + createdTime + ", updatedTime=" + updatedTime + ", userId="
			+ userId + ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", roomTypeId=" + roomTypeId
			+ ", capacityId=" + capacityId + ", noOfRooms=" + noOfRooms + ", roomPrice=" + roomPrice + ", GST=" + GST
			+ ", totalPrice=" + totalPrice + ", roomsStatus=" + roomsStatus + "]";
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
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
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
public String getUserId() {
	return userId;
}
public void setUserId(String userId) {
	this.userId = userId;
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


}