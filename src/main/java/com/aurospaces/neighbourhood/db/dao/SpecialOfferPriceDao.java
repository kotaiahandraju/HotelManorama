package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.SpecialOfferPriceBean;
import com.aurospaces.neighbourhood.bean.SpecialOfferPriceBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseSpecialOfferPriceDao;

@Repository(value = "specialOfferPriceDao")
public class SpecialOfferPriceDao extends BaseSpecialOfferPriceDao {

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

	public List<SpecialOfferPriceBean> getAllOfferPriceList(String status) {
		jdbcTemplate = custom.getJdbcTemplate();

		// String sql="SELECT *, DATE_FORMAT(expirydate,'%d/%m/%Y') AS expirtdate1 FROM
		// cylindermaster";

		String sql = "SELECT sop.*,hcm.name as capacityname,hrt.name as roomtypename, CASE WHEN sop.status IN ('0') THEN 'Deactive' WHEN sop.status in ('1') THEN 'Active'  ELSE '-----' END as specialPriceStatus FROM special_offer_price sop,hotel_occupation_master hcm,hotel_room_type hrt  WHERE sop.`room_type_id` =hrt.id AND sop.`capacity_id`=hcm.id and sop.status=? order by sop.id desc";
		List<SpecialOfferPriceBean> retlist = jdbcTemplate.query(sql, new Object[] { status },
				ParameterizedBeanPropertyRowMapper.newInstance(SpecialOfferPriceBean.class));

		if (retlist.size() > 0)
			return retlist;
		return null;

	}
	public SpecialOfferPriceBean getByRoomCapacityAndRoomTypeList(SpecialOfferPriceBean offerPriceBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from special_offer_price where room_type_id=? and capacity_id=?";
			List<SpecialOfferPriceBean> retlist = jdbcTemplate.query(sql,
			new Object[]{offerPriceBean.getRoomTypeId(),offerPriceBean.getCapacityId()},
			ParameterizedBeanPropertyRowMapper.newInstance(SpecialOfferPriceBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

		
}
