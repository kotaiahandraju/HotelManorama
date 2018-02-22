
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.HotelRoomMasterBean;
import com.aurospaces.neighbourhood.bean.HotelRoomPriceBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseHotelRoomPriceDao;




@Repository(value = "hotelRoomPriceDao")
public class HotelRoomPriceDao extends BaseHotelRoomPriceDao
{
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;


	public List<HotelRoomPriceBean> getAllRoomPriceList(String status){  
		jdbcTemplate = custom.getJdbcTemplate();
		 
		 //String sql="SELECT *, DATE_FORMAT(expirydate,'%d/%m/%Y') AS expirtdate1  FROM cylindermaster";
		
		 String sql =  "SELECT hrp.* , CASE WHEN hrp.status IN ('0') THEN 'Deactive' WHEN hrp.status in ('1') THEN 'Active'  ELSE '-----' END as roomPriceStatus FROM hotel_room_price hrp where hrp.status=? order by hrp.id desc";
		List<HotelRoomPriceBean> retlist = jdbcTemplate.query(sql, new Object[] { status },
				ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomPriceBean.class));
		
		if (retlist.size() > 0)
			return retlist;
		return null;
		    
		}  
	 public HotelRoomPriceBean getByRoomPriceIdAndCapacity(String roomTypeId,String capacityId) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from hotel_room_price where room_type_id = ? and capacity_id=? ";
			List<HotelRoomPriceBean> retlist = jdbcTemplate.query(sql,
			new Object[]{roomTypeId,capacityId},
			ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomPriceBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
	
}

