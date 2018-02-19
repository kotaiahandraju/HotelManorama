package com.aurospaces.neighbourhood.bean;


import java.util.Date;





public class HotelRoomBean 
{
protected int id   = 0;
protected Date createdTime ;
protected Date updatedTime ;
protected String name ;
protected String status,roomstatus,roomnumber ;




public String getRoomnumber() {
	return roomnumber;
}
public void setRoomnumber(String roomnumber) {
	this.roomnumber = roomnumber;
}
public String getRoomstatus() {
	return roomstatus;
}
public void setRoomstatus(String roomstatus) {
	this.roomstatus = roomstatus;
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
public String getName()
{
  return name;
}
public void setName(final String name)
{
  this.name = name;
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