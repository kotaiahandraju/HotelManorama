package com.aurospaces.neighbourhood.controller;


import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aurospaces.neighbourhood.bean.HotelCapacityMasterBean;
import com.aurospaces.neighbourhood.bean.HotelRoomMasterBean;
import com.aurospaces.neighbourhood.bean.HotelRoomPriceBean;
import com.aurospaces.neighbourhood.bean.HotelRoomTypeBean;
import com.aurospaces.neighbourhood.bean.HotelRoomUserDetails;
import com.aurospaces.neighbourhood.db.dao.HotelCapacityMasterDao;
import com.aurospaces.neighbourhood.db.dao.HotelRoomMasterDao;
import com.aurospaces.neighbourhood.db.dao.HotelRoomPriceDao;
import com.aurospaces.neighbourhood.db.dao.HotelRoomTypeDao;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class RoomReservation {
	
	@Autowired HotelRoomTypeDao hotelRoomTypeDao;
	@Autowired HotelRoomMasterDao hotelRoomMasterDao;
	@Autowired HotelCapacityMasterDao hotelCapacityMasterDao;
	@Autowired HotelRoomPriceDao roomPriceDao;
	
		private Logger logger = Logger.getLogger(RoomReservation.class);
		
		@RequestMapping(value = "/userRoomReservation")
		 public String userRoomReservation(@ModelAttribute("reservationForm")HotelRoomPriceBean roomPriceBean) {
			ObjectMapper objectMapper = null;
			String sJson = null;
			List<HotelRoomMasterBean> listOrderBeans=null;
			ModelAndView modelAndview;
			try {
				
				System.out.println("user room Reservation");
				
				/*listOrderBeans = hotelRoomMasterDao.getAllRooms("1");
				if (listOrderBeans != null && listOrderBeans.size() > 0) {
					objectMapper = new ObjectMapper();
					sJson = objectMapper.writeValueAsString(listOrderBeans);
					request.setAttribute("allOrders1", sJson);
					// System.out.println(sJson);
				} else {
					objectMapper = new ObjectMapper();
					sJson = objectMapper.writeValueAsString(listOrderBeans);
					request.setAttribute("allOrders1", "''");
				}*/

			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);

			}
			return "reservation";
				
		}
		
		@ModelAttribute("roomtype")
		public Map<Integer, String> populateRoomtype() {
			Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
			try {
				String sSql = "select id ,name from hotel_room_type where status='1'";
				List<HotelRoomTypeBean> list = hotelRoomTypeDao.populate(sSql);
				for (HotelRoomTypeBean bean : list) {
					statesMap.put(bean.getId(), bean.getName());
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
			}
			return statesMap;
		}
		@ModelAttribute("capacity")
		public Map<Integer, String> populateCapacity() {
			Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
			try {
				String sSql = "SELECT id ,name FROM `hotel_capacity_master` WHERE status='1'";
				List<HotelCapacityMasterBean> list = hotelCapacityMasterDao.populate(sSql);
				for (HotelCapacityMasterBean bean : list) {
					statesMap.put(bean.getId(), bean.getName());
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
			}
			return statesMap;
		}
		
		@RequestMapping("/roomCheckAvail")
		@ResponseBody public String roomCheckAvail(@ModelAttribute HotelRoomPriceBean roomPriceBean) {
			HotelRoomPriceBean priceBean=null;
			JSONObject jsonObj=null;
			ObjectMapper objectMapper=null;
			int price=0;
			int result=0;
			try {
				if(roomPriceBean.getRoomTypeId() !=null  || roomPriceBean.getRoomTypeId() !="" || roomPriceBean.getNoOfRooms()  !="" || roomPriceBean.getNoOfRooms()  !=null ||  roomPriceBean.getCapacityId() !=null || roomPriceBean.getCapacityId() !=null) {
					priceBean=roomPriceDao.getAvailabilytyUsingRoomTypeIdAndCapacity(roomPriceBean.getRoomTypeId(), roomPriceBean.getCapacityId());
//					System.out.println("----Price List---"+priceBean.toString());
					String currentPrice= priceBean.getSun();
					price=Integer.parseInt(priceBean.getSun());
					int iNoOfRooms=Integer.parseInt(roomPriceBean.getNoOfRooms());
					result= iNoOfRooms * price;
				}
				
				
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			return String.valueOf(result);
			
		}
		@RequestMapping("/roomUserDetails")
		@ResponseBody public String roomUserDetails(@RequestBody HotelRoomUserDetails userDetails) {
			HotelRoomPriceBean priceBean=null;
			JSONObject jsonObj=null;
			ObjectMapper objectMapper=null;
			boolean result=false;
			try {
				System.out.println("----roomUserDetails List---");
				result=roomPriceDao.userDetails(userDetails);
			
			if(result) {
				jsonObj.put("msg", "success...");
			}else {
				jsonObj.put("msg", "User details are not saved...");
			}
				
				
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return String.valueOf(jsonObj);
			
		}
		
				
	}



