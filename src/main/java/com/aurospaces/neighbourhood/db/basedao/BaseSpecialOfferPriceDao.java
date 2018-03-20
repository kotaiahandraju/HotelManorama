package com.aurospaces.neighbourhood.db.basedao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.transaction.annotation.Transactional;

import com.aurospaces.neighbourhood.bean.SpecialOfferPriceBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;

public class BaseSpecialOfferPriceDao {

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

	public final String INSERT_SQL = "INSERT INTO special_offer_price(created_time, updated_time, room_type_id, capacity_id, sun, mon, tue, wed, thu, fri, sat, status, start_time, end_time) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";

	@Transactional
	public void save(final SpecialOfferPriceBean specialOfferPriceBean) {
		jdbcTemplate = custom.getJdbcTemplate();
		if (specialOfferPriceBean.getId() == 0) {
			KeyHolder keyHolder = new GeneratedKeyHolder();
			int update = jdbcTemplate.update(new PreparedStatementCreator() {
				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {

					if (specialOfferPriceBean.getCreated_time() == null) {
						specialOfferPriceBean.setCreated_time(new Date());
					}
					java.sql.Timestamp createdTime = new java.sql.Timestamp(
							specialOfferPriceBean.getCreated_time().getTime());

					if (specialOfferPriceBean.getUpdated_time() == null) {
						specialOfferPriceBean.setUpdated_time(new Date());
					}
					java.sql.Timestamp updatedTime = new java.sql.Timestamp(
							specialOfferPriceBean.getUpdated_time().getTime());

					/*if (specialOfferPriceBean.getStart_time() == null) {
						specialOfferPriceBean.setStart_time(new Date());
					}
					java.sql.Timestamp startTime = new java.sql.Timestamp(
							specialOfferPriceBean.getStart_time().getTime());
					if (specialOfferPriceBean.getEnd_time() == null) {
						specialOfferPriceBean.setEnd_time(new Date());
					}
					java.sql.Timestamp endTime = new java.sql.Timestamp(specialOfferPriceBean.getEnd_time().getTime());*/

					PreparedStatement ps = connection.prepareStatement(INSERT_SQL, new String[] { "id" });
					ps.setTimestamp(1, createdTime);
					ps.setTimestamp(2, updatedTime);
					ps.setString(3, specialOfferPriceBean.getRoomTypeId());
					ps.setString(4, specialOfferPriceBean.getCapacityId());
					ps.setString(5, specialOfferPriceBean.getSun());
					ps.setString(6, specialOfferPriceBean.getMon());
					ps.setString(7, specialOfferPriceBean.getTue());
					ps.setString(8, specialOfferPriceBean.getWed());
					ps.setString(9, specialOfferPriceBean.getThu());
					ps.setString(10, specialOfferPriceBean.getFri());
					ps.setString(11, specialOfferPriceBean.getSat());
					ps.setString(12, specialOfferPriceBean.getStatus());
					/*ps.setString(13, specialOfferPriceBean.getStart_time());
					ps.setString(14, specialOfferPriceBean.getEnd_time());
*/
					return ps;
				}
			}, keyHolder);

			Number unId = keyHolder.getKey();
			specialOfferPriceBean.setId(unId.intValue());

		} else {
			String sql = "UPDATE special_offer_price  set room_type_id = ? ,capacity_id = ? ,sun = ? ,mon = ? ,tue = ? ,wed = ? ,thu = ? ,fri = ? ,sat = ? ,status=? where id = ? ";

			jdbcTemplate.update(sql,
					new Object[] { specialOfferPriceBean.getRoomTypeId(), specialOfferPriceBean.getCapacityId(),
							specialOfferPriceBean.getSun(), specialOfferPriceBean.getMon(), specialOfferPriceBean.getTue(),
							specialOfferPriceBean.getWed(), specialOfferPriceBean.getThu(), specialOfferPriceBean.getFri(),
							specialOfferPriceBean.getSat(),specialOfferPriceBean.getStatus(),specialOfferPriceBean.getId()});
		}
	}

	@Transactional
	public Boolean delete(int id, String status) {
		boolean result = false;
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "update special_offer_price set status='" + status + "' where id = ?";
		jdbcTemplate.update(sql, new Object[] { id });
		int results = jdbcTemplate.update(sql, new Object[] { id });
		if (results != 0) {
			result = true;
		}
		return result;
	}

	public SpecialOfferPriceBean getById(int id) {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "SELECT * from special_offer_price where id = ? ";
		List<SpecialOfferPriceBean> retlist = jdbcTemplate.query(sql, new Object[] { id },
				ParameterizedBeanPropertyRowMapper.newInstance(SpecialOfferPriceBean.class));
		if (retlist.size() > 0)
			return retlist.get(0);
		return null;
	}
/*
	public Boolean getCuurentDay() {
		Date d=new Date();
		
	
		
		return null;	
	}*/
}
