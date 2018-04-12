
package com.aurospaces.neighbourhood.db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.aurospaces.neighbourhood.bean.HotelRoomHistory;
import com.aurospaces.neighbourhood.bean.HotelRoomMasterBean;
import com.aurospaces.neighbourhood.bean.HotelRoomPriceBean;
import com.aurospaces.neighbourhood.bean.HotelRoomPriceHistory;
import com.aurospaces.neighbourhood.bean.HotelRoomUserDetailsBean;
import com.aurospaces.neighbourhood.bean.SpecialOfferPriceBean;
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

		String sql = "SELECT hrp.*,hcm.name as capacityname,hrt.name as roomtypename, CASE WHEN hrp.status IN ('0') THEN 'Deactive' WHEN hrp.status in ('1') THEN 'Active'  ELSE '-----' END as roomPriceStatus FROM hotel_room_price hrp,hotel_occupation_master hcm,hotel_room_type hrt  WHERE hrp.`room_type_id` =hrt.id AND hrp.`capacity_id`=hcm.id and hrp.status=? order by hrp.id desc";
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

	public HotelRoomPriceBean getAvailabilytyUsingRoomTypeIdAndCapacity(HotelRoomPriceBean roomPriceBean) {
		jdbcTemplate = custom.getJdbcTemplate();
		//String sql = "SELECT hrp.*,DATE_FORMAT(hrp.created_time, '%d-%M-%Y') as created_time1,DATE_FORMAT(hrp.updated_time, '%d-%M-%Y') as updated_time1,hrm.max_chaild,hcm.numberOfAdult from hotel_room_price hrp,hotel_room_master hrm,hotel_capacity_master hcm where hrm.room_type_id=hrp.room_type_id and hcm.numberOfAdult=hrp.capacity_id and hrp.room_type_id = ? and hrp.capacity_id=?";
		String sql = "select * from vhotel_capm_type_price where room_type_id =? and capacity_id=?";
		System.out.println("--sql---"+sql);
		List<HotelRoomPriceBean> retlist = jdbcTemplate.query(sql, new Object[] { roomPriceBean.getRoomTypeId(), roomPriceBean.getCapacityId() },
				ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomPriceBean.class));
		if (retlist.size() > 0)
			return retlist.get(0);
		return null;
	}

	public Boolean userDetails(HotelRoomUserDetailsBean userDetails) {
		jdbcTemplate = custom.getJdbcTemplate();
		boolean isSave = false;
		System.out.println("----userbean"+userDetails);
		try {
			if (userDetails.getCreatedTime() == null) {
				userDetails.setCreatedTime(new Date());
			}
			java.sql.Timestamp createdTime = new java.sql.Timestamp(userDetails.getCreatedTime().getTime());

			if (userDetails.getUpdatedTime() == null) {
				userDetails.setUpdatedTime(new Date());
			}
			java.sql.Timestamp updatedTime = new java.sql.Timestamp(userDetails.getUpdatedTime().getTime());

			final String INSERT_SQL1 = "INSERT INTO userdetails(created_time,updated_time,name,mobileNumber,alternateMobileNumber,email,city,address,country,userDetailsId) values (?,?,?,?,?,?,?,?,?,?)";
//			System.out.println("INSERT_SQL1===" + INSERT_SQL1);
			int insert = jdbcTemplate.update(INSERT_SQL1, new Object[] {userDetails.getCreatedTime(),userDetails.getUpdatedTime(),userDetails.getName(),userDetails.getMobileNumber(),userDetails.getAlternateMobileNumber(),userDetails.getEmail(),userDetails.getCity(),userDetails.getAddress(),userDetails.getCountry(),userDetails.getUserDetailsId()});
//			System.out.println("222insert===" + insert);
			if (insert > 0) {
				isSave = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSave;
	}
	
	/*public Boolean roomHistory(HotelRoomUserDetailsBean userDetails) {
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

			final String INSERT_SQL1 = "INSERT INTO roomhistory(created_time,updated_time,userDetailsId,checkIn,checkOut,"
					+ "roomTypeId,capacityId,noOfRooms,roomPrice,GST,totalPrice,roomsStatus,numberOfAdult,numberOfChaild) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			System.out.println("INSERT_SQL1===" + INSERT_SQL1);
			int insert = jdbcTemplate.update(INSERT_SQL1, new Object[] {userDetails.getCreatedTime(),
					userDetails.getUpdatedTime(),userDetails.getUserDetailsId(),userDetails.getCheckIn(),
					userDetails.getCheckOut(),userDetails.getRoomTypeId(),userDetails.getCapacityId(),
					userDetails.getNoOfRooms(),userDetails.getRoomPrice(),userDetails.getGST(),userDetails.getTotalPrice(),
					userDetails.getRoomsStatus(),userDetails.getNumberOfAdult(),userDetails.getNumberOfChaild()});
			System.out.println("222insert===" + insert);
			if (insert > 0) {
				isSave = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSave;
	}*/
	


		/* this should be conditional based on whether the id is present or not */
		@Transactional
		public void roomHistory(final HotelRoomUserDetailsBean userDetails) 
		{
			  final String INSERT_SQL = "INSERT INTO roomhistory(created_time,updated_time,userDetailsId,checkIn,checkOut,roomTypeId,capacityId,noOfRooms,roomPrice,GST,totalPrice,roomsStatus,numberOfAdult,numberOfChaild) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			jdbcTemplate = custom.getJdbcTemplate();
		if(userDetails.getId() == 0)	{

		KeyHolder keyHolder = new GeneratedKeyHolder();
		int update = jdbcTemplate.update(
				new PreparedStatementCreator() {
						public PreparedStatement 
						createPreparedStatement(Connection connection) throws SQLException {
		
						if(userDetails.getCreatedTime() == null)
						{
						userDetails.setCreatedTime( new Date());
						}
						java.sql.Timestamp createdTime = 
							new java.sql.Timestamp(userDetails.getCreatedTime().getTime()); 
								
						if(userDetails.getUpdatedTime() == null)
						{
						userDetails.setUpdatedTime( new Date());
						}
						java.sql.Timestamp updatedTime = 
							new java.sql.Timestamp(userDetails.getUpdatedTime().getTime()); 
								
						PreparedStatement ps =
										connection.prepareStatement(INSERT_SQL,new String[]{"id"});
		ps.setTimestamp(1, createdTime);
	ps.setTimestamp(2, updatedTime);
	ps.setString(3, userDetails.getUserDetailsId());
	ps.setString(4, userDetails.getCheckIn());
	ps.setString(5, userDetails.getCheckOut());
	ps.setString(6, userDetails.getRoomTypeId());
	ps.setString(7, userDetails.getCapacityId());
	ps.setString(8, userDetails.getNoOfRooms());
	ps.setString(9, userDetails.getRoomPrice());
	ps.setString(10, userDetails.getGST());
	ps.setString(11, userDetails.getTotalPrice());
	ps.setString(12, userDetails.getRoomsStatus());
	ps.setString(13, userDetails.getNumberOfAdult());
	ps.setString(14, userDetails.getNumberOfChaild());

								return ps;
							}
					},
					keyHolder);
					
					Number unId = keyHolder.getKey();
					userDetails.setId(unId.intValue());
//					System.out.println("update----"+update);

			}
			/*else
			{

				String sql = "UPDATE hotel_room_price  set room_type_id = ? ,capacity_id = ? ,sun = ? ,mon = ? ,tue = ? ,wed = ? ,thu = ? ,fri = ? ,sat = ?  where id = ? ";
		
				jdbcTemplate.update(sql, new Object[]{userDetails.getRoomTypeId(),userDetails.getCapacityId(),userDetails.getSun(),userDetails.getMon(),userDetails.getTue(),userDetails.getWed(),userDetails.getThu(),userDetails.getFri(),userDetails.getSat(),userDetails.getId()});
			}*/
		}
	
	public Boolean userDetails(HotelRoomPriceHistory  priceHistory) {
		boolean isSave = false;
		try {
			if (priceHistory.getCreatedTime() == null) {
				priceHistory.setCreatedTime(new Date());
			}
			java.sql.Timestamp createdTime = new java.sql.Timestamp(priceHistory.getCreatedTime().getTime());

			if (priceHistory.getUpdatedTime() == null) {
				priceHistory.setUpdatedTime(new Date());
			}
			java.sql.Timestamp updatedTime = new java.sql.Timestamp(priceHistory.getUpdatedTime().getTime());

			final String INSERT_SQL1 = "INSERT INTO userdetails(created_time,updated_time,roomId,roomPrice,GST,discount,totalPrice) values (?,?,?,?,?,?,?)";
//			System.out.println("INSERT_SQL1===" + INSERT_SQL1);
			int insert = jdbcTemplate.update(INSERT_SQL1, new Object[] {priceHistory.getCreatedTime(),priceHistory.getUpdatedTime(),priceHistory.getRoomId(),priceHistory.getRoomPrice(),priceHistory.getGST(),priceHistory.getDiscount(),priceHistory.getTotalPrice()});
//			System.out.println("222insert===" + insert);
			if (insert > 0) {
				isSave = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSave;
	}
	public List<HotelRoomUserDetailsBean> getBookigHistory(){  
		jdbcTemplate = custom.getJdbcTemplate();
		 
		 //String sql="SELECT *, DATE_FORMAT(expirydate,'%d/%m/%Y') AS expirtdate1  FROM cylindermaster";
		
		 String sql =  "select *from vroomhistory_vuserdetails ORDER BY checkIn DESC";
		List<HotelRoomUserDetailsBean> retlist = jdbcTemplate.query(sql, new Object[] { },
				ParameterizedBeanPropertyRowMapper.newInstance(HotelRoomUserDetailsBean.class));
		
		if (retlist.size() > 0)
			return retlist;
		return null;
		    
		}
	public List<SpecialOfferPriceBean> getCheckDateWiseAvailability(SpecialOfferPriceBean offerPriceBean){  
		jdbcTemplate = custom.getJdbcTemplate();
		 
		 //String sql="SELECT *, DATE_FORMAT(expirydate,'%d/%m/%Y') AS expirtdate1  FROM cylindermaster";
		 String sql =  "select *from special_offer_price where start_time >='"+offerPriceBean.getStart_time1()+"' and end_time <='"+offerPriceBean.getEnd_time1()+"'";
//		 System.out.println(sql+"sssssssss");
		List<SpecialOfferPriceBean> retlist = jdbcTemplate.query(sql, new Object[] {},
				ParameterizedBeanPropertyRowMapper.newInstance(SpecialOfferPriceBean.class));
//				System.out.println(retlist.size());
		return retlist;
		    
		}
	
	public List<SpecialOfferPriceBean> getDayName(Timestamp getDayName){  
		jdbcTemplate = custom.getJdbcTemplate();
		 
		
		 String sql =  "SELECT sop.*, DATE_FORMAT(sop.start_time,'%a') as getDay from special_offer_price sop where start_time=?";
//		 System.out.println(sql);
		 List<SpecialOfferPriceBean> retlist = jdbcTemplate.query(sql, new Object[] {getDayName},
					ParameterizedBeanPropertyRowMapper.newInstance(SpecialOfferPriceBean.class));
		return retlist;
		    
		}
	public String getDayNameByDate(Timestamp getDayName,String roomTypeId,String capacityId){  
		jdbcTemplate = custom.getJdbcTemplate();
		String result=null;
		String result1=null;
		try {
//			System.out.println("week"+getDayName);
			 String sql =  "SELECT DATE_FORMAT('"+getDayName+"','%a') as getDay ";
			 result = (String) jdbcTemplate.queryForObject(sql,String.class);
//			 System.out.println("week"+result);
			 if(result !=null) {
				 String sql1 = "select "+result.toLowerCase()+" from hotel_room_price where room_type_id="+roomTypeId+" and capacity_id="+capacityId+"";
//				 System.out.println("sql1"+sql1);
			        result1 = (String) jdbcTemplate.queryForObject(sql1,String.class); 
			 }
		} catch (EmptyResultDataAccessException e) {
			return null;
		}

		 
		return result1;
		    
		}
	
	public String getCostOfSpecialOffers(String week,String roomTypeId,String capacityId) {
        String result=null;
        try {
//          System.out.println("week"+week);
            String sql = "select "+week+" from special_offer_price where room_type_id="+roomTypeId+" and capacity_id="+capacityId+"";
            result = (String) jdbcTemplate.queryForObject(sql,String.class); 
            	
			
		} catch (EmptyResultDataAccessException e) {
			// TODO: handle exception
			return null;
		}

        return result;
    }
	
}
