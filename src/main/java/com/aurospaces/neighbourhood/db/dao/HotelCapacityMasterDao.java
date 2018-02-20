
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.HotelCapacityMasterBean;
import com.aurospaces.neighbourhood.bean.HotelRoomTypeBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseHotelCapacityMasterDao;




@Repository(value = "hotelCapacityMasterDao")
public class HotelCapacityMasterDao extends BaseHotelCapacityMasterDao
{

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

	public List<HotelCapacityMasterBean> getAllCapacity(String status){  
		jdbcTemplate = custom.getJdbcTemplate();
		 String sql =  "SELECT hcm.* , CASE WHEN hcm.status IN ('0') THEN 'Deactive' WHEN hcm.status in ('1') THEN 'Active'  ELSE '-----' END as capacitystatus FROM hotel_capacity_master hcm where hcm.status='"+status+"' order by hcm.id desc";
		List<HotelCapacityMasterBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(HotelCapacityMasterBean.class));
		
		if (retlist.size() > 0)
			return retlist;
		return null;
		    
		}
	public HotelRoomTypeBean getByCapacityName(HotelCapacityMasterBean capacityMasterBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from hotel_capacity_master where name = ?";
			List<HotelRoomTypeBean> retlist = jdbcTemplate.query(sql,
			new Object[]{capacityMasterBean.getName()},
			ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomTypeBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
}

