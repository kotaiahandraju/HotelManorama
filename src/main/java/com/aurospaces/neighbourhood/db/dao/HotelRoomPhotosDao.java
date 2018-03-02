
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.HotelRoomPhotosBean;
import com.aurospaces.neighbourhood.bean.HotelRoomTypeBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseHotelRoomPhotosDao;




@Repository(value = "hotelRoomPhotosDao")
public class HotelRoomPhotosDao extends BaseHotelRoomPhotosDao
{

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;
	
	public List<HotelRoomPhotosBean> getAllRoomPhotos(String status){  
		jdbcTemplate = custom.getJdbcTemplate();
		 
		 //String sql="SELECT *, DATE_FORMAT(expirydate,'%d/%m/%Y') AS expirtdate1  FROM cylindermaster";
		
		 String sql =  "SELECT hrph.* , CASE WHEN hrph.status IN ('0') THEN 'Deactive' WHEN hrph.status in ('1') THEN 'Active'  ELSE '-----' END as photoStatus FROM hotel_room_photos hrph where hrph.status='"+status+"' order by hrph.id desc";
		List<HotelRoomPhotosBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomPhotosBean.class));
		
		if (retlist.size() > 0)
			return retlist;
		return null;
		    
		}
	public HotelRoomPhotosBean getByRoomPhotoId(HotelRoomPhotosBean roomPhotoBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from hotel_room_photos where id = ?";
			List<HotelRoomPhotosBean> retlist = jdbcTemplate.query(sql,
			new Object[]{roomPhotoBean.getId()},
			ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomPhotosBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

}

