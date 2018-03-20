
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

import com.aurospaces.neighbourhood.bean.HotelRoomTypeBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;

public class BaseHotelRoomTypeDao {

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

	public final String INSERT_SQL = "INSERT INTO hotel_room_type( created_time, updated_time, name, status) values (?, ?, ?, ?)";

	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final HotelRoomTypeBean hotelRoomType) {
		jdbcTemplate = custom.getJdbcTemplate();
		if (hotelRoomType.getId() == 0) {

			KeyHolder keyHolder = new GeneratedKeyHolder();
			int update = jdbcTemplate.update(new PreparedStatementCreator() {
				public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {

					if (hotelRoomType.getCreatedTime() == null) {
						hotelRoomType.setCreatedTime(new Date());
					}
					java.sql.Timestamp createdTime = new java.sql.Timestamp(hotelRoomType.getCreatedTime().getTime());

					if (hotelRoomType.getUpdatedTime() == null) {
						hotelRoomType.setUpdatedTime(new Date());
					}
					java.sql.Timestamp updatedTime = new java.sql.Timestamp(hotelRoomType.getUpdatedTime().getTime());

					PreparedStatement ps = connection.prepareStatement(INSERT_SQL, new String[] { "id" });
					ps.setTimestamp(1, createdTime);
					ps.setTimestamp(2, updatedTime);
					ps.setString(3, hotelRoomType.getName());
					ps.setString(4, hotelRoomType.getStatus());

					return ps;
				}
			}, keyHolder);

			Number unId = keyHolder.getKey();
			hotelRoomType.setId(unId.intValue());

		} else {

			String sql = "UPDATE hotel_room_type  set name = ?  where id = ? ";

			jdbcTemplate.update(sql, new Object[] { hotelRoomType.getName(), hotelRoomType.getId() });
		}
	}

	@Transactional
	public Boolean delete(int id, String status) {
		boolean result = false;
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "update hotel_room_type set status='" + status + "' where id = ?";
		jdbcTemplate.update(sql, new Object[] { id });
		int results = jdbcTemplate.update(sql, new Object[] { id });
		if (results != 0) {
			result = true;
		}
		return result;
	}

	public HotelRoomTypeBean getById(int id) {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "SELECT * from hotel_room_type where id = ? ";
		List<HotelRoomTypeBean> retlist = jdbcTemplate.query(sql, new Object[] { id },
				ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomTypeBean.class));
		if (retlist.size() > 0)
			return retlist.get(0);
		return null;
	}

}
