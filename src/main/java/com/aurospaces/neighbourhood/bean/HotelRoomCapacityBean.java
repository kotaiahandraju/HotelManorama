/**
 * 
 */
package com.aurospaces.neighbourhood.bean;

import java.util.Date;

/**
 * @author Kotaiah
 *
 */
public class HotelRoomCapacityBean {
	protected int id   = 0;
	protected Date createdTime ;
	protected Date updatedTime ;
	protected String name ;
	protected String status,roomcapacitystatus;
	
	public String getRoomcapacitystatus() {
		return roomcapacitystatus;
	}
	public void setRoomcapacitystatus(String roomcapacitystatus) {
		this.roomcapacitystatus = roomcapacitystatus;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
