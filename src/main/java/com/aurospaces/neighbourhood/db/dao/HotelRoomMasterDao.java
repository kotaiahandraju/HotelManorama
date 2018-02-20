
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.HotelRoomMasterBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseHotelRoomMasterDao;




@Repository(value = "hotelRoomMasterDao")
public class HotelRoomMasterDao extends BaseHotelRoomMasterDao
{

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

	public List<HotelRoomMasterBean> getAllRooms(String status){  
		jdbcTemplate = custom.getJdbcTemplate();
		 
		 //String sql="SELECT *, DATE_FORMAT(expirydate,'%d/%m/%Y') AS expirtdate1  FROM cylindermaster";
		
		 String sql =  "SELECT hrm.*,CASE WHEN hrm.status IN ('0') THEN 'Deactive' WHEN hrm.status in ('1') THEN 'Active'  ELSE '-----' END as roomStatus FROM `hotel_room_master` hrm WHERE status=?";
		List<HotelRoomMasterBean> retlist = jdbcTemplate.query(sql, new Object[] { status },
				ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomMasterBean.class));
		
		if (retlist.size() > 0)
			return retlist;
		return null;
		    
		}  
	 public HotelRoomMasterBean getByRoomType(String roomTypeId,String capacityId) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from hotel_room_master where room_type_id = ? and capacity_id=? ";
			List<HotelRoomMasterBean> retlist = jdbcTemplate.query(sql,
			new Object[]{roomTypeId,capacityId},
			ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomMasterBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	
}

