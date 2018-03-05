package com.aurospaces.neighbourhood.bean;


import java.util.Date;

public class HotelRoomPriceHistory 
{
protected int id   = 0;
protected Date createdTime ;
protected Date updatedTime ;
protected String roomId ;
protected String roomPrice ;
protected String GST ;
protected String discount ;
protected String totalPrice ;
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
public String getRoomId() {
	return roomId;
}
public void setRoomId(String roomId) {
	this.roomId = roomId;
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
public String getDiscount() {
	return discount;
}
public void setDiscount(String discount) {
	this.discount = discount;
}
public String getTotalPrice() {
	return totalPrice;
}
public void setTotalPrice(String totalPrice) {
	this.totalPrice = totalPrice;
}
@Override
public String toString() {
	return "HotelRoomPriceHistory [id=" + id + ", createdTime=" + createdTime + ", updatedTime=" + updatedTime
			+ ", roomId=" + roomId + ", roomPrice=" + roomPrice + ", GST=" + GST + ", discount=" + discount
			+ ", totalPrice=" + totalPrice + "]";
}


}