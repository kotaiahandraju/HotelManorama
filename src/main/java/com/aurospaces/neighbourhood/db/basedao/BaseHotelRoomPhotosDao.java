
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
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseHotelRoomPhotosDao{

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;
 
	public final String INSERT_SQL = "INSERT INTO hotel_room_photos( created_time, updated_time, room_type_id, image1, image2, image3, image4, image5) values (?, ?, ?, ?, ?, ?, ?, ?)"; 





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
ps.setString(3, hotelRoomPhotos.getRoomTypeId());
ps.setString(4, hotelRoomPhotos.getImage1());
ps.setString(5, hotelRoomPhotos.getImage2());
ps.setString(6, hotelRoomPhotos.getImage3());
ps.setString(7, hotelRoomPhotos.getImage4());
ps.setString(8, hotelRoomPhotos.getImage5());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				hotelRoomPhotos.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE hotel_room_photos  set room_type_id = ? ,image1 = ? ,image2 = ? ,image3 = ? ,image4 = ? ,image5 = ?  where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{hotelRoomPhotos.getRoomTypeId(),hotelRoomPhotos.getImage1(),hotelRoomPhotos.getImage2(),hotelRoomPhotos.getImage3(),hotelRoomPhotos.getImage4(),hotelRoomPhotos.getImage5(),hotelRoomPhotos.getId()});
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
