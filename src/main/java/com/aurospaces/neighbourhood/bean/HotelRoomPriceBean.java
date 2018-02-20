package com.aurospaces.neighbourhood.bean;


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
protected String sat ;

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

}