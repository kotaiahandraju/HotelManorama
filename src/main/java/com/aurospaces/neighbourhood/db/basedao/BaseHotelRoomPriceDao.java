
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

import com.aurospaces.neighbourhood.bean.HotelRoomPriceBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseHotelRoomPriceDao{

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;
 
	public final String INSERT_SQL = "INSERT INTO hotel_room_price( created_time, updated_time, room_type_id, capacity_id, sun, mon, tue, wed, thu, fri, sat,status) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final HotelRoomPriceBean hotelRoomPrice) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(hotelRoomPrice.getId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(hotelRoomPrice.getCreatedTime() == null)
					{
					hotelRoomPrice.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(hotelRoomPrice.getCreatedTime().getTime()); 
							
					if(hotelRoomPrice.getUpdatedTime() == null)
					{
					hotelRoomPrice.setUpdatedTime( new Date());
					}
					java.sql.Timestamp updatedTime = 
						new java.sql.Timestamp(hotelRoomPrice.getUpdatedTime().getTime()); 
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
ps.setTimestamp(2, updatedTime);
ps.setString(3, hotelRoomPrice.getRoomTypeId());
ps.setString(4, hotelRoomPrice.getCapacityId());
ps.setString(5, hotelRoomPrice.getSun());
ps.setString(6, hotelRoomPrice.getMon());
ps.setString(7, hotelRoomPrice.getTue());
ps.setString(8, hotelRoomPrice.getWed());
ps.setString(9, hotelRoomPrice.getThu());
ps.setString(10, hotelRoomPrice.getFri());
ps.setString(11, hotelRoomPrice.getSat());
ps.setString(12, hotelRoomPrice.getStatus());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				hotelRoomPrice.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE hotel_room_price  set room_type_id = ? ,capacity_id = ? ,sun = ? ,mon = ? ,tue = ? ,wed = ? ,thu = ? ,fri = ? ,sat = ?  where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{hotelRoomPrice.getRoomTypeId(),hotelRoomPrice.getCapacityId(),hotelRoomPrice.getSun(),hotelRoomPrice.getMon(),hotelRoomPrice.getTue(),hotelRoomPrice.getWed(),hotelRoomPrice.getThu(),hotelRoomPrice.getFri(),hotelRoomPrice.getSat(),hotelRoomPrice.getId()});
		}
	}
		
	@Transactional
	public Boolean delete(int id,String status) {
		boolean result=false;
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "update hotel_room_price set status='"+status+"' where id = ?";
		jdbcTemplate.update(sql, new Object[]{id});
		 int results=jdbcTemplate.update(sql, new Object[]{id});
			if(results!=0){
				result= true;
			}
			return result;
	}
		

	 public HotelRoomPriceBean getById(int id) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from hotel_room_price where id = ? ";
			List<HotelRoomPriceBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomPriceBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	

}
