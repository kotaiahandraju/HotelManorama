package com.aurospaces.neighbourhood.bean;


import java.util.Date;




public class ManoramaUsersBean 
{
protected int id   = 0;
protected Date createdTime ;
protected Date updatedTime ;
protected String userName ;
protected String password ;
protected String roleId ;
protected String status ;

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
public String getUserName()
{
  return userName;
}
public void setUserName(final String userName)
{
  this.userName = userName;
}
public String getPassword()
{
  return password;
}
public void setPassword(final String password)
{
  this.password = password;
}
public String getRoleId()
{
  return roleId;
}
public void setRoleId(final String roleId)
{
  this.roleId = roleId;
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