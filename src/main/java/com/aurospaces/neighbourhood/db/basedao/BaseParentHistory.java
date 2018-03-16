package com.aurospaces.neighbourhood.db.basedao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.aurospaces.neighbourhood.bean.ParentHistroryBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;

public class BaseParentHistory {
	

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;
	public Boolean userDetails(ParentHistroryBean  parentHistroryBean) {
		boolean isSave = false;
		try {
			/*if (priceHistory.getCreatedTime() == null) {
				priceHistory.setCreatedTime(new Date());
			}
			java.sql.Timestamp createdTime = new java.sql.Timestamp(priceHistory.getCreatedTime().getTime());

			if (priceHistory.getUpdatedTime() == null) {
				priceHistory.setUpdatedTime(new Date());
			}
			java.sql.Timestamp updatedTime = new java.sql.Timestamp(priceHistory.getUpdatedTime().getTime());*/

			final String INSERT_SQL1 = "INSERT INTO parenthistory(userId,transactionId,roomTypeId,roomCapacityId,paymentStatus,amount,discount,totalAmount) values (?,?,?,?,?,?,?,?)";
			System.out.println("INSERT_SQL1===" + INSERT_SQL1);
			int insert = jdbcTemplate.update(INSERT_SQL1, new Object[] {parentHistroryBean.getUserId(),parentHistroryBean.getTransactionId(),parentHistroryBean.getRoomTypeId(),parentHistroryBean.getRoomCapacityId(),parentHistroryBean.getPaymentStatus(),
					parentHistroryBean.getAmount(),parentHistroryBean.getDiscount(),parentHistroryBean.getTotalAmount()});
			System.out.println("222insert===" + insert);
			if (insert > 0) {
				isSave = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSave;
	}}