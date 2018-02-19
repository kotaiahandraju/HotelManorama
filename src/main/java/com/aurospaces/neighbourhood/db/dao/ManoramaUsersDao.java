
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.ManoramaUsersBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseManoramaUsersDao;




@Repository(value = "khaibarUsersDao")
public class ManoramaUsersDao extends BaseManoramaUsersDao
{
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;
	 public ManoramaUsersBean loginChecking(ManoramaUsersBean khaibarUsersBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from hotel_users where userName = ? and password =? and status='1'  ";
			List<ManoramaUsersBean> retlist = jdbcTemplate.query(sql,
			new Object[]{khaibarUsersBean.getUserName(),khaibarUsersBean.getPassword()},
			ParameterizedBeanPropertyRowMapper.newInstance(ManoramaUsersBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}


}

