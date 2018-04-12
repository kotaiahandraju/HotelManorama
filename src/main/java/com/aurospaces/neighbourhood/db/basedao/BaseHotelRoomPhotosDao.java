
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

import com.aurospaces.neighbourhood.bean.HotelRoomPhotosBean;
import com.aurospaces.neighbourhood.bean.OTP;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseHotelRoomPhotosDao{

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;
 
	public final String INSERT_SQL = "INSERT INTO hotel_room_photos( created_time, updated_time,capacityId, room_type_id, images,status) values (?, ?, ?, ?,?,?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final HotelRoomPhotosBean hotelRoomPhotos) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(hotelRoomPhotos.getId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(hotelRoomPhotos.getCreatedTime() == null)
					{
					hotelRoomPhotos.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(hotelRoomPhotos.getCreatedTime().getTime()); 
							
					if(hotelRoomPhotos.getUpdatedTime() == null)
					{
					hotelRoomPhotos.setUpdatedTime( new Date());
					}
					java.sql.Timestamp updatedTime = 
						new java.sql.Timestamp(hotelRoomPhotos.getUpdatedTime().getTime()); 
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
ps.setTimestamp(2, updatedTime);
ps.setString(3, hotelRoomPhotos.getCapacityId());
ps.setString(4, hotelRoomPhotos.getRoomTypeId());
ps.setString(5, hotelRoomPhotos.getImages());
ps.setString(6, hotelRoomPhotos.getStatus());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				hotelRoomPhotos.setId(unId.intValue());
				System.out.println("-----save---");

		}
		else
		{
			System.out.println("--id----"+hotelRoomPhotos.getId());
			String sql = "UPDATE hotel_room_photos  set capacityId=?,room_type_id = ? ,images = ?  where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{hotelRoomPhotos.getCapacityId(),hotelRoomPhotos.getRoomTypeId(),hotelRoomPhotos.getImages(),hotelRoomPhotos.getId()});
		}
	}
		
	@Transactional
	public Boolean delete(int id,String status) {
		boolean result=false;
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "update hotel_room_photos set status='"+status+"' where id = ?";
		jdbcTemplate.update(sql, new Object[]{id});
		 int results=jdbcTemplate.update(sql, new Object[]{id});
			if(results!=0){
				result= true;
			}
			return result;
	}
		

	 public HotelRoomPhotosBean getById(int id) {
			String sql = "SELECT * from hotel_room_photos where id = ? ";
			List<HotelRoomPhotosBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomPhotosBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

}
