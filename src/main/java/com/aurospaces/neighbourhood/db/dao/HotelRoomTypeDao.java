
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.CylindermasterBean;
import com.aurospaces.neighbourhood.bean.HotelRoomTypeBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseHotelRoomTypeDao;




@Repository(value = "hotelRoomTypeDao")
public class HotelRoomTypeDao extends BaseHotelRoomTypeDao
{

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;
	
	public List<HotelRoomTypeBean> getAllRoomType(String status){  
		jdbcTemplate = custom.getJdbcTemplate();
		 
		 String sql =  "SELECT hrt.*, CASE WHEN hrt.status IN ('0') THEN 'Deactive' WHEN hrt.status in ('1') THEN 'Active'  ELSE '-----' END as roomTypestatus   FROM hotel_room_type hrt where status='"+status+"' order by hrt.id desc";
		List<HotelRoomTypeBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomTypeBean.class));
		
		if (retlist.size() > 0)
			return retlist;
		return null;
		    
		}  
	
	
	 public HotelRoomTypeBean getByRoomTypeName(HotelRoomTypeBean roomTypeBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from hotel_room_type where name = ? ";
			System.out.println("---sql"+sql);
			List<HotelRoomTypeBean> retlist = jdbcTemplate.query(sql,
			new Object[]{roomTypeBean.getName()},
			ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomTypeBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	 
	 

}

