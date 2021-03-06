package com.aurospaces.neighbourhood.controller;


import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.HotelOccupationMasterBean;
import com.aurospaces.neighbourhood.bean.HotelRoomPriceBean;
import com.aurospaces.neighbourhood.bean.HotelRoomTypeBean;
import com.aurospaces.neighbourhood.db.dao.HotelOccupationMasterDao;
import com.aurospaces.neighbourhood.db.dao.HotelRoomMasterDao;
import com.aurospaces.neighbourhood.db.dao.HotelRoomPriceDao;
import com.aurospaces.neighbourhood.db.dao.HotelRoomTypeDao;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping(value="/admin")
public class RoomPriceController {
	
	@Autowired HotelRoomTypeDao hotelRoomTypeDao;
	@Autowired HotelRoomMasterDao hotelRoomMasterDao;
	@Autowired HotelOccupationMasterDao hotelCapacityMasterDao;
	@Autowired HotelRoomPriceDao roomPriceDao;
	
		private Logger logger = Logger.getLogger(RoomPriceController.class);
		
		@RequestMapping(value = "/roomPriceHome")
		public String storeHome(@ModelAttribute("roomPriceForm")HotelRoomPriceBean roomPriceBean,HttpServletRequest request,
				HttpSession session) {
			ObjectMapper objectMapper = null;
			String sJson = null;
			List<HotelRoomPriceBean> listOrderBeans=null;
			try {
				
				listOrderBeans = roomPriceDao.getAllRoomPriceList("1");
				if (listOrderBeans != null && listOrderBeans.size() > 0) {
					objectMapper = new ObjectMapper();
					sJson = objectMapper.writeValueAsString(listOrderBeans);
					request.setAttribute("allOrders1", sJson);
					// System.out.println(sJson);
				} else {
					objectMapper = new ObjectMapper();
					sJson = objectMapper.writeValueAsString(listOrderBeans);
					request.setAttribute("allOrders1", "''");
				}

			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);

			}
			return "roomPriceHome";
				
		}
		
		@RequestMapping(value = "/roomPriceSave")
		public  String storeSave(HotelRoomPriceBean roomPriceBean, HttpSession objSession,HttpServletRequest objRequest,RedirectAttributes redirect) {
			HotelRoomPriceBean hotelRoomPriceIdsList=null;
			 int id = 0;
			try {
				System.out.println("--------Room MasterSave----------");
				
				String roomTypeId=roomPriceBean.getRoomTypeId();
				String capacity_id = roomPriceBean.getCapacityId();
				hotelRoomPriceIdsList=roomPriceDao.getByRoomPriceIdAndCapacity(roomTypeId,capacity_id);
				int dummyId =0;
				if(hotelRoomPriceIdsList != null){
					dummyId = hotelRoomPriceIdsList.getId();
				}
				if(roomPriceBean.getId() != 0)
				{
					id = roomPriceBean.getId();
					if(id == dummyId || hotelRoomPriceIdsList == null )
					{
						roomPriceDao.save(roomPriceBean);
						redirect.addFlashAttribute("msg", "Record Updated Successfully");
						redirect.addFlashAttribute("cssMsg", "warning");
					}
					else
					{
						redirect.addFlashAttribute("msg", "Already Record Exist");
						redirect.addFlashAttribute("cssMsg", "danger");
					}
				}
				if(roomPriceBean.getId() == 0 && hotelRoomPriceIdsList == null)
				{
					roomPriceBean.setStatus("1");
					roomPriceDao.save(roomPriceBean);
					
					redirect.addFlashAttribute("msg", "Record Inserted Successfully");
					redirect.addFlashAttribute("cssMsg", "success");
				}
				if(roomPriceBean.getId() == 0 && hotelRoomPriceIdsList != null)
				{
					redirect.addFlashAttribute("msg", "Already Record Exist");
					redirect.addFlashAttribute("cssMsg", "danger");
				}
				
				
			} catch (Exception e) {
				System.out.println("Exception in Product Controller in productSave()");
				redirect.addFlashAttribute("msg", "Failed");
				redirect.addFlashAttribute("cssMsg", "danger");
			}
			return "redirect:roomPriceHome";
		}
		
		@RequestMapping(value = "/roomPriceDelete")
		public @ResponseBody String roomPriceDelete(HotelRoomPriceBean  roomPriceBean, HttpSession objSession,
				HttpServletRequest objRequest)  {
			boolean delete = false;
			JSONObject jsonObj = new JSONObject();
			List<HotelRoomPriceBean> listOrderBeans=null;
			try{
				
				if (roomPriceBean.getId() != 0 && roomPriceBean.getStatus() !="") {
					delete = roomPriceDao.delete(roomPriceBean.getId(),roomPriceBean.getStatus());
					if (delete) {
						jsonObj.put("message", "deleted");
					} else {
						jsonObj.put("message", "delete fail");
					}
				}

				listOrderBeans = roomPriceDao.getAllRoomPriceList("1");
				if (listOrderBeans != null && listOrderBeans.size() > 0) {

					jsonObj.put("allOrders1", listOrderBeans);
					// System.out.println(sJson);
				} else {
					jsonObj.put("allOrders1", listOrderBeans);
				}
			} catch (Exception e) {
				e.printStackTrace();
				logger.error(e);
				logger.fatal("error in RoomMasterController class itemDelete method  ");
				jsonObj.put("message", "excetption" + e);
				return String.valueOf(jsonObj);

			}
			return String.valueOf(jsonObj);
		}
		@RequestMapping(value = "/inActivePrice")
		public @ResponseBody String inActivePrice(@RequestParam("status") String status)  {
			JSONObject jsonObj = new JSONObject();
			List<HotelRoomPriceBean> listOrderBeans=null;
			try{
				listOrderBeans = roomPriceDao.getAllRoomPriceList(status);
				if (listOrderBeans != null && listOrderBeans.size() > 0) {

					jsonObj.put("allOrders1", listOrderBeans);
					// System.out.println(sJson);
				} else {
					jsonObj.put("allOrders1", listOrderBeans);
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}
					
			
			
			return  String.valueOf(jsonObj);
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
				String sSql = "SELECT id , name FROM `hotel_occupation_master` WHERE status='1'";
				List<HotelOccupationMasterBean> list = hotelCapacityMasterDao.populate(sSql);
				for (HotelOccupationMasterBean bean : list) {
					statesMap.put(bean.getId(), bean.getName());
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
			}
			return statesMap;
		}	
	
	}



