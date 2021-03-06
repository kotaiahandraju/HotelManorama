package com.aurospaces.neighbourhood.bean;


import java.sql.Timestamp;
import java.util.Date;

public class HotelRoomPriceBean 
{
protected int id   = 0;
protected Date createdTime ;
protected Date updatedTime ;
protected String roomTypeId ;
protected String capacityId ;
protected String sun ;
protected String mon ;
protected String tue ;
protected String wed ;
protected String thu ;
protected String fri ;
protected String sat,status,roomPriceStatus,capacityname,roomtypename,noOfRooms,created_time1,updated_time1,numberOfAdult,numberOfChaild,max_chaild,checkOut,checkIn;
protected String end_time,start_time,getDay;
protected Timestamp start_time1,end_time1;




public String getNumberOfChaild() {
	return numberOfChaild;
}
public void setNumberOfChaild(String numberOfChaild) {
	this.numberOfChaild = numberOfChaild;
}
public String getGetDay() {
	return getDay;
}
public void setGetDay(String getDay) {
	this.getDay = getDay;
}
public Timestamp getStart_time1() {
	return start_time1;
}
public void setStart_time1(Timestamp start_time1) {
	this.start_time1 = start_time1;
}
public Timestamp getEnd_time1() {
	return end_time1;
}
public void setEnd_time1(Timestamp end_time1) {
	this.end_time1 = end_time1;
}
public String getCheckOut() {
	return checkOut;
}
public void setCheckOut(String checkOut) {
	this.checkOut = checkOut;
}
public String getEnd_time() {
	return end_time;
}
public void setEnd_time(String end_time) {
	this.end_time = end_time;
}
public String getStart_time() {
	return start_time;
}
public void setStart_time(String start_time) {
	this.start_time = start_time;
}
public String getCheckIn() {
	return checkIn;
}
public void setCheckIn(String checkIn) {
	this.checkIn = checkIn;
}
public String getNumberOfAdult() {
	return numberOfAdult;
}
public void setNumberOfAdult(String numberOfAdult) {
	this.numberOfAdult = numberOfAdult;
}
public String getMax_chaild() {
	return max_chaild;
}
public void setMax_chaild(String max_chaild) {
	this.max_chaild = max_chaild;
}
public String getUpdated_time1() {
	return updated_time1;
}
public void setUpdated_time1(String updated_time1) {
	this.updated_time1 = updated_time1;
}
public String getCreated_time1() {
	return created_time1;
}
public void setCreated_time1(String created_time1) {
	this.created_time1 = created_time1;
}
public String getNoOfRooms() {
	return noOfRooms;
}
public void setNoOfRooms(String noOfRooms) {
	this.noOfRooms = noOfRooms;
}
public String getCapacityname() {
	return capacityname;
}
public void setCapacityname(String capacityname) {
	this.capacityname = capacityname;
}
public String getRoomtypename() {
	return roomtypename;
}
public void setRoomtypename(String roomtypename) {
	this.roomtypename = roomtypename;
}
public String getRoomPriceStatus() {
	return roomPriceStatus;
}
public void setRoomPriceStatus(String roomPriceStatus) {
	this.roomPriceStatus = roomPriceStatus;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
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
public String getSun()
{
  return sun;
}
public void setSun(final String sun)
{
  this.sun = sun;
}
public String getMon()
{
  return mon;
}
public void setMon(final String mon)
{
  this.mon = mon;
}
public String getTue()
{
  return tue;
}
public void setTue(final String tue)
{
  this.tue = tue;
}
public String getWed()
{
  return wed;
}
public void setWed(final String wed)
{
  this.wed = wed;
}
public String getThu()
{
  return thu;
}
public void setThu(final String thu)
{
  this.thu = thu;
}
public String getFri()
{
  return fri;
}
public void setFri(final String fri)
{
  this.fri = fri;
}
public String getSat()
{
  return sat;
}
public void setSat(final String sat)
{
  this.sat = sat;
}
@Override
public String toString() {
	return "HotelRoomPriceBean [id=" + id + ", createdTime=" + createdTime + ", updatedTime=" + updatedTime
			+ ", roomTypeId=" + roomTypeId + ", capacityId=" + capacityId + ", sun=" + sun + ", mon=" + mon + ", tue="
			+ tue + ", wed=" + wed + ", thu=" + thu + ", fri=" + fri + ", sat=" + sat + ", status=" + status
			+ ", roomPriceStatus=" + roomPriceStatus + ", capacityname=" + capacityname + ", roomtypename="
			+ roomtypename + ", noOfRooms=" + noOfRooms + "]";
}


}