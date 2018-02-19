
package com.aurospaces.neighbourhood.db.basedao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.transaction.annotation.Transactional;

import com.aurospaces.neighbourhood.bean.HotelRoomBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseHotelRoomDao{

@Autowired
CustomConnection custom;
JdbcTemplate jdbcTemplate;
 
	public final String INSERT_SQL = "INSERT INTO hotel_room( created_time, updated_time, name,roomnumber, status) values (?, ?, ?, ?,?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final HotelRoomBean hotelRoom) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(hotelRoom.getId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(hotelRoom.getCreatedTime() == null)
					{
					hotelRoom.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(hotelRoom.getCreatedTime().getTime()); 
							
					if(hotelRoom.getUpdatedTime() == null)
					{
					hotelRoom.setUpdatedTime( new Date());
					}
					java.sql.Timestamp updatedTime = 
						new java.sql.Timestamp(hotelRoom.getUpdatedTime().getTime()); 
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
ps.setTimestamp(2, updatedTime);
ps.setString(3, hotelRoom.getName());
ps.setString(4, hotelRoom.getRoomnumber());
ps.setString(5, hotelRoom.getStatus());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				hotelRoom.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE hotel_room  set name = ?,roomnumber=?   where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{hotelRoom.getName(),hotelRoom.getRoomnumber(),hotelRoom.getId()});
		}
	}
		

	@Transactional
	public boolean delete(int id,String status) {
		jdbcTemplate = custom.getJdbcTemplate();
		boolean delete = false;
		try{
		String sql = "update hotel_room set status='"+status+"'  WHERE id=?";
		int intDelete = jdbcTemplate.update(sql, new Object[]{id});
		jdbcTemplate.update(sql, new Object[]{id});
		if(intDelete != 0){
			delete = true;
		}
	}catch(Exception e){
		e.printStackTrace();
	}
		
		return delete;
	}
		

	 public HotelRoomBean getById(int id) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from hotel_room where id = ? ";
			List<HotelRoomBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	

}
