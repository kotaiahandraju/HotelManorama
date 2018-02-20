package com.aurospaces.neighbourhood.bean;


import java.util.Date;

public class HotelRoomMasterBean 
{
protected int id   = 0;
protected Date createdTime ;
protected Date updatedTime ;
protected String roomNumber ;
protected String roomTypeId ;
protected String capacityId ;
protected String maxChaild ;
protected String status,roomStatus,roomcapacity,roomtype ;



public String getRoomcapacity() {
	return roomcapacity;
}
public void setRoomcapacity(String roomcapacity) {
	this.roomcapacity = roomcapacity;
}
public String getRoomtype() {
	return roomtype;
}
public void setRoomtype(String roomtype) {
	this.roomtype = roomtype;
}
public String getRoomStatus() {
	return roomStatus;
}
public void setRoomStatus(String roomStatus) {
	this.roomStatus = roomStatus;
}
public int getId()
{
  return id;
}
public void setId(final int id)
{
  this.id = id;
}
public Date getCreatedTime()
{
  return createdTime;
}
public void setCreatedTime(final Date createdTime)
{
  this.createdTime = createdTime;
}
public Date getUpdatedTime()
{
  return updatedTime;
}
public void setUpdatedTime(final Date updatedTime)
{
  this.updatedTime = updatedTime;
}
public String getRoomNumber()
{
  return roomNumber;
}
public void setRoomNumber(final String roomNumber)
{
  this.roomNumber = roomNumber;
}
public String getRoomTypeId()
{
  return roomTypeId;
}
public void setRoomTypeId(final String roomTypeId)
{
  this.roomTypeId = roomTypeId;
}
public String getCapacityId()
{
  return capacityId;
}
public void setCapacityId(final String capacityId)
{
  this.capacityId = capacityId;
}
public String getMaxChaild()
{
  return maxChaild;
}
public void setMaxChaild(final String maxChaild)
{
  this.maxChaild = maxChaild;
}
public String getStatus()
{
  return status;
}
public void setStatus(final String status)
{
  this.status = status;
}

}