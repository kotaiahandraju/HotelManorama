
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.HotelRoomBean;
import com.aurospaces.neighbourhood.bean.HotelRoomTypeBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseHotelRoomDao;




@Repository(value = "hotelRoomDao")
public class HotelRoomDao extends BaseHotelRoomDao
{

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;
	
	public List<HotelRoomBean> getAllRoom(String status){  
		jdbcTemplate = custom.getJdbcTemplate();
		 
		 String sql =  "SELECT hr.*, CASE WHEN hr.status IN ('0') THEN 'Deactive' WHEN hr.status in ('1') THEN 'Active'  ELSE '-----' END as roomstatus   FROM hotel_room hr where status='"+status+"' order by hr.id desc";
		List<HotelRoomBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomBean.class));
		
		if (retlist.size() > 0)
			return retlist;
		return null;
		    
		}  
	
	
	 public HotelRoomTypeBean getByRoomTypeName(HotelRoomBean roomBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from hotel_room where name = ? ";
			System.out.println("---sql"+sql);
			List<HotelRoomTypeBean> retlist = jdbcTemplate.query(sql,
			new Object[]{roomBean.getName()},
			ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomTypeBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}


}

