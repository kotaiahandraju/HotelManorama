
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

import com.aurospaces.neighbourhood.bean.HotelOccupationMasterBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseHotelOccupationMasterDao{

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;
 
	public final String INSERT_SQL = "INSERT INTO hotel_capacity_master( created_time, updated_time,  numberOfAdult,numberOfChaild, status,roomTypeId,roomOccupationId ) values (?,?, ?, ?, ?, ?,?)"; 

/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final HotelOccupationMasterBean hotelCapacityMaster) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(hotelCapacityMaster.getId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(hotelCapacityMaster.getCreatedTime() == null)
					{
					hotelCapacityMaster.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(hotelCapacityMaster.getCreatedTime().getTime()); 
							
					if(hotelCapacityMaster.getUpdatedTime() == null)
					{
					hotelCapacityMaster.setUpdatedTime( new Date());
					}
					java.sql.Timestamp updatedTime = 
						new java.sql.Timestamp(hotelCapacityMaster.getUpdatedTime().getTime()); 
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
ps.setTimestamp(2, updatedTime);
ps.setString(3, hotelCapacityMaster.getNumberOfAdult());
ps.setString(4, hotelCapacityMaster.getNumberOfChaild());
ps.setString(5, hotelCapacityMaster.getStatus());
ps.setString(6, hotelCapacityMaster.getRoomTypeId());
ps.setString(7, hotelCapacityMaster.getRoomOccupationId());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				hotelCapacityMaster.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE hotel_capacity_master  set roomTypeId = ? ,numberOfAdult = ?,numberOfChaild=?,roomOccupationId=?  where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{hotelCapacityMaster.getRoomTypeId(),hotelCapacityMaster.getNumberOfAdult(),hotelCapacityMaster.getNumberOfChaild(),hotelCapacityMaster.getRoomOccupationId(),hotelCapacityMaster.getId()});
		}
	}
		

	@Transactional
	public Boolean delete(int id,String status) {
		boolean result=false;
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "update hotel_capacity_master set status='"+status+"' where id = ?";
		jdbcTemplate.update(sql, new Object[]{id});
		 int results=jdbcTemplate.update(sql, new Object[]{id});
			if(results!=0){
				result= true;
			}
			return result;
	}
		

	 public HotelOccupationMasterBean getById(int id) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from hotel_capacity_master where id = ? ";
			List<HotelOccupationMasterBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(HotelOccupationMasterBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	

}
