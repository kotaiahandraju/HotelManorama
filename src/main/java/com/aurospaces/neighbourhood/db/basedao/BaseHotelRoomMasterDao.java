
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

import com.aurospaces.neighbourhood.bean.HotelRoomMasterBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseHotelRoomMasterDao{

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;
 
	public final String INSERT_SQL = "INSERT INTO hotel_room_master( created_time, updated_time, room_number, room_type_id, capacity_id, status) values (?, ?, ?, ?, ?, ?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final HotelRoomMasterBean hotelRoomMaster) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(hotelRoomMaster.getId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(hotelRoomMaster.getCreatedTime() == null)
					{
					hotelRoomMaster.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(hotelRoomMaster.getCreatedTime().getTime()); 
							
					if(hotelRoomMaster.getUpdatedTime() == null)
					{
					hotelRoomMaster.setUpdatedTime( new Date());
					}
					java.sql.Timestamp updatedTime = 
						new java.sql.Timestamp(hotelRoomMaster.getUpdatedTime().getTime()); 
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
ps.setTimestamp(2, updatedTime);
ps.setString(3, hotelRoomMaster.getRoomNumber());
ps.setString(4, hotelRoomMaster.getRoomTypeId());
ps.setString(5, hotelRoomMaster.getCapacityId());
ps.setString(6, hotelRoomMaster.getStatus());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				hotelRoomMaster.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE hotel_room_master  set room_number = ? ,room_type_id = ? ,capacity_id = ?  where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{hotelRoomMaster.getRoomNumber(),hotelRoomMaster.getRoomTypeId(),hotelRoomMaster.getCapacityId(),hotelRoomMaster.getId()});
		}
	}
		
	@Transactional
	public boolean delete(int id,String status) {
		boolean result=false;
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "update hotel_room_master set status='"+status+"' where id = ?";
		jdbcTemplate.update(sql, new Object[]{id});
		 int results=jdbcTemplate.update(sql, new Object[]{id});
			if(results!=0){
				result= true;
			}
			return result;
	}

	 public HotelRoomMasterBean getById(int id) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from hotel_room_master where id = ? ";
			List<HotelRoomMasterBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomMasterBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	

}
