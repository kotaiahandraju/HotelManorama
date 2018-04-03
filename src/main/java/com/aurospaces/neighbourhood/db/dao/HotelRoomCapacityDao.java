
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.HotelRoomCapacityBean;
import com.aurospaces.neighbourhood.bean.HotelRoomTypeBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseHotelRoomCapacityDao;




@Repository(value = "HotelRoomCapacityDao")
public class HotelRoomCapacityDao extends BaseHotelRoomCapacityDao
{
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;
	
	public List<HotelRoomCapacityBean> getAllRoomCapacity(String status){  
		jdbcTemplate = custom.getJdbcTemplate();
		 
		 //String sql="SELECT *, DATE_FORMAT(expirydate,'%d/%m/%Y') AS expirtdate1  FROM cylindermaster";
		
		 String sql =  "SELECT hrt.* , CASE WHEN hrt.status IN ('0') THEN 'Deactive' WHEN hrt.status in ('1') THEN 'Active'  ELSE '-----' END as roomcapacitystatus FROM hotel_occupation_master hrt where hrt.status='"+status+"' order by hrt.id desc";
		List<HotelRoomCapacityBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomCapacityBean.class));
		
		if (retlist.size() > 0)
			return retlist;
		return null;
		    
		}
	public HotelRoomCapacityBean getByRoomCapacityName(HotelRoomCapacityBean hotelRoomTypeBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from hotel_occupation_master where name = ?";
			List<HotelRoomCapacityBean> retlist = jdbcTemplate.query(sql,
			new Object[]{hotelRoomTypeBean.getName()},
			ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomCapacityBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	public List<HotelRoomCapacityBean> populate(String sql ){
		 jdbcTemplate = custom.getJdbcTemplate();
				List<HotelRoomCapacityBean> retlist = jdbcTemplate.query(sql,ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomCapacityBean.class));
					return retlist;
		 }
}

