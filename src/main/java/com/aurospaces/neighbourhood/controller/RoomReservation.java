package com.aurospaces.neighbourhood.controller;


import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aurospaces.neighbourhood.bean.HotelOccupationMasterBean;
import com.aurospaces.neighbourhood.bean.HotelRoomPriceBean;
import com.aurospaces.neighbourhood.bean.HotelRoomTypeBean;
import com.aurospaces.neighbourhood.bean.HotelRoomUserDetailsBean;
import com.aurospaces.neighbourhood.bean.SpecialOfferPriceBean;
import com.aurospaces.neighbourhood.db.dao.HotelOccupationMasterDao;
import com.aurospaces.neighbourhood.db.dao.HotelRoomMasterDao;
import com.aurospaces.neighbourhood.db.dao.HotelRoomPriceDao;
import com.aurospaces.neighbourhood.db.dao.HotelRoomTypeDao;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import CommonUtils.CommonUtils;

@Controller
public class RoomReservation {
	
	@Autowired HotelRoomTypeDao hotelRoomTypeDao;
	@Autowired HotelRoomMasterDao hotelRoomMasterDao;
	@Autowired HotelOccupationMasterDao hotelCapacityMasterDao;
	@Autowired HotelRoomPriceDao roomPriceDao;
	@Autowired HotelOccupationMasterDao capacityMasterDao;
		private Logger logger = Logger.getLogger(RoomReservation.class);
		
		@RequestMapping(value = "/userRoomReservation")
		 public String userRoomReservation(@ModelAttribute("reservationForm")HotelRoomPriceBean roomPriceBean,HttpServletRequest request) {
			try {
				
				System.out.println("user room Reservation");
				
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);

			}
			return "reservation";
				
		}
		
		
		@RequestMapping("/getAdults")
		@ResponseBody public String getAdults(@ModelAttribute HotelRoomPriceBean roomPriceBean) {
			JSONObject jsonObj=new JSONObject();
			HotelRoomPriceBean listOrderBeans = null;
			int price=0;
			int result=0;
			List<SpecialOfferPriceBean> specialOfferResult=null;
			SpecialOfferPriceBean specialOfferPriceBean=null;
			List<SpecialOfferPriceBean> sSpecialOfferDayName=null;
			ObjectMapper objectMapper=null;
			try {
				
				if(roomPriceBean.getRoomTypeId() !=null  || roomPriceBean.getRoomTypeId() !="" ||  roomPriceBean.getCapacityId() !=null ||  roomPriceBean.getCapacityId() !="") {
					
					specialOfferPriceBean.setStart_time1(CommonUtils.getIndainDate(roomPriceBean.getCheckIn()));
					specialOfferPriceBean.setEnd_time1(CommonUtils.getIndainDate(roomPriceBean.getCheckOut()));
					specialOfferResult=roomPriceDao.getCheckDateWiseAvailability(specialOfferPriceBean);
					
					if(specialOfferResult.size()>0 || specialOfferResult != null) {
						sSpecialOfferDayName=roomPriceDao.getDayName(specialOfferPriceBean.getStart_time1());
						objectMapper =new ObjectMapper();
						String listData= objectMapper.writeValueAsString(sSpecialOfferDayName);
						System.out.println(listData);
						
						
					}
					
					
				}
//				listOrderBeans=	hotelRoomMasterDao.getAdults(roomPriceBean);
				listOrderBeans=roomPriceDao.getAvailabilytyUsingRoomTypeIdAndCapacity(roomPriceBean);
				
				if(listOrderBeans != null){
					
					jsonObj.put("maxchaild", listOrderBeans.getMax_chaild());
					jsonObj.put("numberOfAdult", listOrderBeans.getNumberOfAdult());
					jsonObj.put("noOfRooms", listOrderBeans.getNoOfRooms());
				}else{
					jsonObj.put("maxchaild", "''");
					jsonObj.put("numberOfAdult", "''");
				}
				System.out.println(listOrderBeans);
				
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			return String.valueOf(jsonObj);
			
		}
		@SuppressWarnings("unused")
		@RequestMapping("/roomCheckAvail")
		@ResponseBody public String roomCheckAvail(@ModelAttribute HotelRoomPriceBean roomPriceBean) {
			HotelRoomPriceBean priceBean=null;
			JSONObject jsonObj=null;
			ObjectMapper objectMapper=null;
			int price=0;
			int result=0;
			List<SpecialOfferPriceBean> specialOfferResult=null;
			SpecialOfferPriceBean specialOfferPriceBean=null;
			List<SpecialOfferPriceBean> sSpecialOfferDayName=null;
			try {
				specialOfferPriceBean =new SpecialOfferPriceBean();
				
				if(roomPriceBean.getRoomTypeId() !=null  || roomPriceBean.getRoomTypeId() !="" ||  roomPriceBean.getCapacityId() !=null ||  roomPriceBean.getCapacityId() !="") {
					priceBean=roomPriceDao.getAvailabilytyUsingRoomTypeIdAndCapacity(roomPriceBean);
					jsonObj=new JSONObject(priceBean);

					specialOfferPriceBean.setStart_time1(CommonUtils.getIndainDate(roomPriceBean.getCheckIn()));
					specialOfferPriceBean.setEnd_time1(CommonUtils.getIndainDate(roomPriceBean.getCheckOut()));
					specialOfferResult=roomPriceDao.getCheckDateWiseAvailability(specialOfferPriceBean);
//					System.out.println("222222222222222222222222222::"+roomPriceBean.getNoOfRooms());
					if(specialOfferResult.size() >0) {
						sSpecialOfferDayName=roomPriceDao.getDayName(specialOfferPriceBean.getStart_time1());
						String name=null;
						for (SpecialOfferPriceBean specialOfferPriceBean2 : sSpecialOfferDayName) {
							 name=specialOfferPriceBean2.getGetDay().toLowerCase();
						}
						
						String currentPrice=roomPriceDao.getCostOfSpecialOffers(name);
						price=Integer.parseInt(currentPrice);
						int iNoOfRooms=Integer.parseInt(roomPriceBean.getNoOfRooms());
						result= iNoOfRooms * price;
						jsonObj.put("price", result);
						jsonObj.put("roomPrice", price);
						jsonObj.put("noOfRooms", roomPriceBean.getNoOfRooms());
						jsonObj.put("max_chaild", priceBean.getMax_chaild());
						
					}else {
						String resultData=roomPriceDao.getDayNameByDate(specialOfferPriceBean.getStart_time1());
						price=Integer.parseInt(resultData);
						int iNoOfRooms=Integer.parseInt(roomPriceBean.getNoOfRooms());
//						System.out.println("222222222222222222222222222:::"+roomPriceBean.getNoOfRooms());
						result= iNoOfRooms * price;
						jsonObj.put("price", result);
						jsonObj.put("roomPrice", price);
						jsonObj.put("noOfRooms", roomPriceBean.getNoOfRooms());
						jsonObj.put("max_chaild", priceBean.getMax_chaild());
					
					}
//					System.out.println(jsonObj);
				}
				
				
				
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
			return String.valueOf(jsonObj);
			
		}
		@RequestMapping("/roomUserDetails")
		public @ResponseBody  String roomUserDetails(HttpServletRequest request,@ModelAttribute HotelRoomUserDetailsBean userDetails) {
			HotelRoomPriceBean priceBean=null;
			JSONObject jsonObj=null;
			ObjectMapper objectMapper=null;
			boolean result=false;
			//HotelRoomUserDetailsBean userDetails =null;
			try {
				jsonObj =new JSONObject();
				System.out.println("----roomUserDetails List---");
				userDetails.setRoomNumber("dsfhds");
				userDetails.setUserDetailsId(CommonUtils.getAutoGenId());
				result=roomPriceDao.userDetails(userDetails);
				userDetails.setRoomsStatus("1");
				roomPriceDao.roomHistory(userDetails);
			
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
		@RequestMapping("/checkDateWise")
		public @ResponseBody  String checkDateWise(HttpServletRequest request,@ModelAttribute SpecialOfferPriceBean offerPriceBean) {
			HotelRoomPriceBean priceBean=null;
			JSONObject jsonObj=null;
			ObjectMapper objectMapper=null;
			List<SpecialOfferPriceBean> result=null;
			//HotelRoomUserDetailsBean userDetails =null;
			try {
				jsonObj =new JSONObject();
				System.out.println("----roomUserDetails List---");
				result=roomPriceDao.getCheckDateWiseAvailability(offerPriceBean);
			
			if(result !=null || result.size() >0) {
				
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
		 @RequestMapping(value = "/getRoomOcupation1")
			public @ResponseBody String getRoomOcupation(@RequestParam("roomTypeId") String roomTypeId) throws JsonGenerationException, JsonMappingException, IOException {
				List<Map<String,Object>> listOrderBeans = null;
				ObjectMapper objectMapper = null;
				String sJson="";
				listOrderBeans=capacityMasterDao.getRoomOcupation(roomTypeId);
					 /// System.out.println("inActiveItem data--"+sJson);
				objectMapper = new ObjectMapper();
				if (listOrderBeans != null && listOrderBeans.size() > 0) {

					objectMapper = new ObjectMapper();
					sJson = objectMapper.writeValueAsString(listOrderBeans);
					// System.out.println(sJson);
				}
				
				return sJson;
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
		/*@ModelAttribute("capacity")
		public Map<Integer, String> populateCapacity() {
			Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
			try {
				String sSql = "SELECT id ,name FROM `hotel_capacity_master` WHERE status='1'";
				List<HotelOccupationMasterBean> list = hotelCapacityMasterDao.populate(sSql);
				for (HotelOccupationMasterBean bean : list) {
					statesMap.put(bean.getId(), bean.getName());
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
			}
			return statesMap;
		}	*/
	}



