package com.aurospaces.neighbourhood.bean;


import java.util.Date;

public class HotelRoomPhotosBean 
{
protected int id   = 0;
protected Date createdTime ;
protected Date updatedTime ;
protected String roomTypeId ;
protected String image1 ;
protected String image2 ;
protected String image3 ;
protected String image4 ;
protected String image5 ;

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
public String getImage1()
{
  return image1;
}
public void setImage1(final String image1)
{
  this.image1 = image1;
}
public String getImage2()
{
  return image2;
}
public void setImage2(final String image2)
{
  this.image2 = image2;
}
public String getImage3()
{
  return image3;
}
public void setImage3(final String image3)
{
  this.image3 = image3;
}
public String getImage4()
{
  return image4;
}
public void setImage4(final String image4)
{
  this.image4 = image4;
}
public String getImage5()
{
  return image5;
}
public void setImage5(final String image5)
{
  this.image5 = image5;
}

}