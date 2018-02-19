package com.aurospaces.neighbourhood.bean;

import java.util.Date;

public class HotelRoomTariffBean {

	protected int id = 0;
	protected Date createdTime;
	protected Date updatedTime;
	protected String roomTypeId;
	protected String roomId;
	protected String price;
	protected String discount;
	protected String status;

	public int getId() {
		return id;
	}

	public void setId(final int id) {
		this.id = id;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(final Date createdTime) {
		this.createdTime = createdTime;
	}

	public Date getUpdatedTime() {
		return updatedTime;
	}

	public void setUpdatedTime(final Date updatedTime) {
		this.updatedTime = updatedTime;
	}

	public String getRoomTypeId() {
		return roomTypeId;
	}

	public void setRoomTypeId(final String roomTypeId) {
		this.roomTypeId = roomTypeId;
	}

	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(final String roomId) {
		this.roomId = roomId;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(final String price) {
		this.price = price;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(final String discount) {
		this.discount = discount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(final String status) {
		this.status = status;
	}

}