
package com.aurospaces.neighbourhood.db.dao;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.HotelRoomPriceBean;
import com.aurospaces.neighbourhood.bean.HotelRoomUserDetails;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseHotelRoomPriceDao;

@Repository(value = "hotelRoomPriceDao")
public class HotelRoomPriceDao extends BaseHotelRoomPriceDao {
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

	public List<HotelRoomPriceBean> getAllRoomPriceList(String status) {
		jdbcTemplate = custom.getJdbcTemplate();

		// String sql="SELECT *, DATE_FORMAT(expirydate,'%d/%m/%Y') AS expirtdate1 FROM
		// cylindermaster";

		String sql = "SELECT hrp.*,hcm.name as capacityname,hrt.name as roomtypename, CASE WHEN hrp.status IN ('0') THEN 'Deactive' WHEN hrp.status in ('1') THEN 'Active'  ELSE '-----' END as roomPriceStatus FROM hotel_room_price hrp,hotel_capacity_master hcm,hotel_room_type hrt  WHERE hrp.`room_type_id` =hrt.id AND hrp.`capacity_id`=hcm.id and hrp.status=? order by hrp.id desc";
		List<HotelRoomPriceBean> retlist = jdbcTemplate.query(sql, new Object[] { status },
				ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomPriceBean.class));

		if (retlist.size() > 0)
			return retlist;
		return null;

	}

	public HotelRoomPriceBean getByRoomPriceIdAndCapacity(String roomTypeId, String capacityId) {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "SELECT * from hotel_room_price where room_type_id = ? and capacity_id=? ";
		List<HotelRoomPriceBean> retlist = jdbcTemplate.query(sql, new Object[] { roomTypeId, capacityId },
				ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomPriceBean.class));
		if (retlist.size() > 0)
			return retlist.get(0);
		return null;
	}

	public HotelRoomPriceBean getAvailabilytyUsingRoomTypeIdAndCapacity(String roomTypeId, String capacityId) {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "SELECT *,DATE_FORMAT(created_time, '%d-%M-%Y') as created_time1,DATE_FORMAT(updated_time, '%d-%M-%Y') as updated_time1 from hotel_room_price where room_type_id = ? and capacity_id=? ";
		List<HotelRoomPriceBean> retlist = jdbcTemplate.query(sql, new Object[] { roomTypeId, capacityId },
				ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomPriceBean.class));
		if (retlist.size() > 0)
			return retlist.get(0);
		return null;
	}

	public Boolean userDetails(HotelRoomUserDetails userDetails) {
		boolean isSave = false;
		try {
			if (userDetails.getCreatedTime() == null) {
				userDetails.setCreatedTime(new Date());
			}
			java.sql.Timestamp createdTime = new java.sql.Timestamp(userDetails.getCreatedTime().getTime());

			if (userDetails.getUpdatedTime() == null) {
				userDetails.setUpdatedTime(new Date());
			}
			java.sql.Timestamp updatedTime = new java.sql.Timestamp(userDetails.getUpdatedTime().getTime());

			final String INSERT_SQL1 = "INSERT INTO userdetails(created_time,updated_time,name,mobileNumber,alternateMobileNumber,email,city,address,country) values (?,?,?,?,?,?,?,?,?)";
			System.out.println("INSERT_SQL1===" + INSERT_SQL1);
			int insert = jdbcTemplate.update(INSERT_SQL1, new Object[] {});
			System.out.println("222insert===" + insert);
			if (insert > 0) {
				isSave = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSave;
	}

}
