package com.aurospaces.neighbourhood.bean;


import java.util.Date;

public class HotelCapacityMasterBean 
{
protected int id   = 0;
protected Date createdTime ;
protected Date updatedTime ;
protected String name ;
protected String numberOfAdult ;
protected String status,capacitystatus ;

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
public String getName()
{
  return name;
}
public void setName(final String name)
{
  this.name = name;
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