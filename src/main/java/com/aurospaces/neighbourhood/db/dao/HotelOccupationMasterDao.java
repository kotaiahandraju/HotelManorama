
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.HotelOccupationMasterBean;
import com.aurospaces.neighbourhood.bean.HotelRoomTypeBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseHotelOccupationMasterDao;




@Repository(value = "hotelCapacityMasterDao")
public class HotelOccupationMasterDao extends BaseHotelOccupationMasterDao
{

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

	public List<HotelOccupationMasterBean> getAllCapacity(String status){  
		jdbcTemplate = custom.getJdbcTemplate();
		 String sql =  "SELECT hcm.* ,hrt.name AS roomTypeName,hom.name AS occupationName, CASE WHEN hcm.status IN ('0') THEN 'Deactive' WHEN hcm.status IN ('1') THEN 'Active'  ELSE '-----' END AS capacitystatus "
				 		+" FROM hotel_capacity_master hcm,`hotel_occupation_master` hom,`hotel_room_type` hrt WHERE hcm.`roomTypeId` =hrt.id AND hcm.`roomOccupationId`=hom.id and hcm.status='"+status+"' order by hcm.id desc";
		List<HotelOccupationMasterBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(HotelOccupationMasterBean.class));
		
		if (retlist.size() > 0)
			return retlist;
		return null;
		    
		}
	public HotelRoomTypeBean getByCapacityName(HotelOccupationMasterBean capacityMasterBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from hotel_capacity_master where `roomTypeId`=? and `roomOccupationId` = ?";
			List<HotelRoomTypeBean> retlist = jdbcTemplate.query(sql,
			new Object[]{capacityMasterBean.getRoomTypeId(),capacityMasterBean.getRoomOccupationId()},
			ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomTypeBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	public List<HotelOccupationMasterBean> populate(String sql ){
		 jdbcTemplate = custom.getJdbcTemplate();
				List<HotelOccupationMasterBean> retlist = jdbcTemplate.query(sql,ParameterizedBeanPropertyRowMapper.newInstance(HotelOccupationMasterBean.class));
					return retlist;
		 }
	public List<Map<String,Object>> getRoomOcupation(String roomTypeId){  
		jdbcTemplate = custom.getJdbcTemplate();
		 String sql =  "  SELECT hom.`id`,hom.name FROM `hotel_room_master` hcm , `hotel_occupation_master` hom   WHERE hom.id=hcm.`capacity_id` AND  `room_type_id` =? group by hcm.capacity_id ";
		 List<Map<String,Object>> retlist = jdbcTemplate.queryForList(sql, new Object[] { roomTypeId });
		
		if (retlist.size() > 0)
			return retlist;
		return null;
		    
		}
	
}

