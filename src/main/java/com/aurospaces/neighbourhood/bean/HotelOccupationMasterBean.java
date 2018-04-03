package com.aurospaces.neighbourhood.bean;


import java.util.Date;

public class HotelOccupationMasterBean 
{
protected int id   = 0;
protected Date createdTime ;
protected Date updatedTime ;
protected String numberOfAdult,numberOfChaild,roomTypeId,roomOccupationId,name,roomTypeName,occupationName ;
protected String status,capacitystatus ;

public String getRoomTypeName() {
	return roomTypeName;
}
public void setRoomTypeName(String roomTypeName) {
	this.roomTypeName = roomTypeName;
}
public String getOccupationName() {
	return occupationName;
}
public void setOccupationName(String occupationName) {
	this.occupationName = occupationName;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getRoomTypeId() {
	return roomTypeId;
}
public void setRoomTypeId(String roomTypeId) {
	this.roomTypeId = roomTypeId;
}
public String getRoomOccupationId() {
	return roomOccupationId;
}
public void setRoomOccupationId(String roomOccupationId) {
	this.roomOccupationId = roomOccupationId;
}
public String getNumberOfChaild() {
	return numberOfChaild;
}
public void setNumberOfChaild(String numberOfChaild) {
	this.numberOfChaild = numberOfChaild;
}
public String getCapacitystatus() {
	return capacitystatus;
}
public void setCapacitystatus(String capacitystatus) {
	this.capacitystatus = capacitystatus;
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

public String getNumberOfAdult()
{
  return numberOfAdult;
}
public void setNumberOfAdult(final String numberOfAdult)
{
  this.numberOfAdult = numberOfAdult;
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