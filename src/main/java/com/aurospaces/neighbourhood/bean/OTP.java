package com.aurospaces.neighbourhood.bean;


import java.util.Date;

public class OTP 
{
protected int id = 0;
protected Date createdTime ;
protected Date updatedTime ;
protected String mobileNumber ;
protected String name ;
protected String otp ;
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
public String getMobileNumber() {
	return mobileNumber;
}
public void setMobileNumber(String mobileNumber) {
	this.mobileNumber = mobileNumber;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getOtp() {
	return otp;
}
public void setOtp(String otp) {
	this.otp = otp;
}
@Override
public String toString() {
	return "OTP [id=" + id + ", createdTime=" + createdTime + ", updatedTime=" + updatedTime + ", mobileNumber="
			+ mobileNumber + ", name=" + name + ", otp=" + otp + "]";
}


}