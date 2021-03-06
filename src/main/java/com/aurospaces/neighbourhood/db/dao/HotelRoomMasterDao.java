
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.HotelRoomMasterBean;
import com.aurospaces.neighbourhood.bean.HotelRoomPriceBean;
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
		
		 String sql =  " SELECT hrm.*,hrt.name AS roomtype,hom.name AS roomcapacity,CASE WHEN hrm.status IN ('0') THEN 'Deactive'  WHEN hrm.status IN ('1') THEN 'Active'  ELSE '-----' END AS roomStatus  FROM `hotel_room_master` hrm,hotel_occupation_master hom,hotel_room_type hrt " 
				 		+" WHERE hrm.`room_type_id` =hrt.id AND hrm.`capacity_id`=hom.id  AND hrm.status=? ORDER BY hrm.created_time DESC";
		List<HotelRoomMasterBean> retlist = jdbcTemplate.query(sql, new Object[] { status },
				ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomMasterBean.class));
		
		if (retlist.size() > 0)
			return retlist;
		return null;
		    
		}  
	 public HotelRoomMasterBean getByRoomType(HotelRoomMasterBean hotelRoomMasterBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from hotel_room_master where room_type_id = ? and capacity_id=? and room_number=? ";
			List<HotelRoomMasterBean> retlist = jdbcTemplate.query(sql,
			new Object[]{hotelRoomMasterBean.getRoomTypeId(),hotelRoomMasterBean.getCapacityId(),hotelRoomMasterBean.getRoomNumber()},
			ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomMasterBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	 public HotelRoomPriceBean getAdults(HotelRoomPriceBean objHotelRoomPriceBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = " SELECT `numberOfAdult`,`numberOfAdult` FROM `hotel_capacity_master` WHERE id=1 ";
			List<HotelRoomPriceBean> retlist = jdbcTemplate.query(sql,
			new Object[]{objHotelRoomPriceBean.getCapacityId()},
			ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomPriceBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
}

