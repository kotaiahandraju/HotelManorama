package com.aurospaces.neighbourhood.bean;

import java.sql.Timestamp;
import java.util.Date;

import org.joda.time.DateTime;

public class SpecialOfferPriceBean {
	protected int id   = 0;
	protected Date created_time ;
	protected Date updated_time ;
	protected String roomTypeId ;
	protected String capacityId ;
	protected String sun ;
	protected String mon ;
	protected String tue ;
	protected String wed ;
	protected String thu ;
	protected String fri ;
	protected String sat,status;
	protected String start_time;
	protected String end_time,roomtypename,capacityname,specialPriceStatus,checkOut,checkIn;
	protected Timestamp start_time1,end_time1;
	protected String getDay ;
	
	
	
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
	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}
	public String getRoomtypename() {
		return roomtypename;
	}
	public void setRoomtypename(String roomtypename) {
		this.roomtypename = roomtypename;
	}
	public String getCapacityname() {
		return capacityname;
	}
	public void setCapacityname(String capacityname) {
		this.capacityname = capacityname;
	}
	public String getSpecialPriceStatus() {
		return specialPriceStatus;
	}
	public void setSpecialPriceStatus(String specialPriceStatus) {
		this.specialPriceStatus = specialPriceStatus;
	}
	public Date getCreated_time() {
		return created_time;
	}
	public void setCreated_time(Date created_time) {
		this.created_time = created_time;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getCapacityId() {
		return capacityId;
	}
	public void setCapacityId(String capacityId) {
		this.capacityId = capacityId;
	}
	public String getRoomTypeId() {
		return roomTypeId;
	}
	public void setRoomTypeId(String roomTypeId) {
		this.roomTypeId = roomTypeId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public Date getUpdated_time() {
		return updated_time;
	}
	public void setUpdated_time(Date updated_time) {
		this.updated_time = updated_time;
	}
	public String getSun() {
		return sun;
	}
	public void setSun(String sun) {
		this.sun = sun;
	}
	public String getMon() {
		return mon;
	}
	public void setMon(String mon) {
		this.mon = mon;
	}
	public String getTue() {
		return tue;
	}
	public void setTue(String tue) {
		this.tue = tue;
	}
	public String getWed() {
		return wed;
	}
	public void setWed(String wed) {
		this.wed = wed;
	}
	public String getThu() {
		return thu;
	}
	public void setThu(String thu) {
		this.thu = thu;
	}
	public String getFri() {
		return fri;
	}
	public void setFri(String fri) {
		this.fri = fri;
	}
	public String getSat() {
		return sat;
	}
	public void setSat(String sat) {
		this.sat = sat;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
