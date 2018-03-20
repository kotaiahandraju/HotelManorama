package com.aurospaces.neighbourhood.controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.HotelCapacityMasterBean;
import com.aurospaces.neighbourhood.bean.HotelRoomPriceBean;
import com.aurospaces.neighbourhood.bean.HotelRoomTypeBean;
import com.aurospaces.neighbourhood.bean.SpecialOfferPriceBean;
import com.aurospaces.neighbourhood.db.dao.HotelCapacityMasterDao;
import com.aurospaces.neighbourhood.db.dao.HotelRoomMasterDao;
import com.aurospaces.neighbourhood.db.dao.HotelRoomPriceDao;
import com.aurospaces.neighbourhood.db.dao.HotelRoomTypeDao;
import com.aurospaces.neighbourhood.db.dao.SpecialOfferPriceDao;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping(value="/admin")
public class SpecialOfferPriceController {
	
	@Autowired HotelRoomTypeDao hotelRoomTypeDao;
	@Autowired HotelRoomMasterDao hotelRoomMasterDao;
	@Autowired HotelCapacityMasterDao hotelCapacityMasterDao;
	@Autowired HotelRoomPriceDao roomPriceDao;
	@Autowired SpecialOfferPriceDao specialOfferPriceDao;
	
	@RequestMapping(value = "/offerPriceForm")
	public String specialOfferPrice(@ModelAttribute("specialOfferForm")SpecialOfferPriceBean specialOfferPriceBean, HttpSession objSession,HttpServletRequest objRequest,RedirectAttributes redirect) throws JsonGenerationException, JsonMappingException, IOException {
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<SpecialOfferPriceBean> listOrderBeans=null;
		listOrderBeans = specialOfferPriceDao.getAllOfferPriceList("1");
		if (listOrderBeans != null && listOrderBeans.size() > 0) {
			objectMapper = new ObjectMapper();
			sJson = objectMapper.writeValueAsString(listOrderBeans);
			objRequest.setAttribute("allOrders1", sJson);
			// System.out.println(sJson);
		} else {
			objectMapper = new ObjectMapper();
			sJson = objectMapper.writeValueAsString(listOrderBeans);
			objRequest.setAttribute("allOrders1", "''");
		}
		return "specialOfferPrice";
	}
	
	
	
	@RequestMapping(value = "/saveSpecialOfferForm")
	public String saveOfferPrice(SpecialOfferPriceBean specialOfferPriceBean, HttpSession objSession,HttpServletRequest objRequest,RedirectAttributes redirect) {
		specialOfferPriceBean.setStatus("1");
		try {
				if(specialOfferPriceBean.getId() == 0) {
					redirect.addFlashAttribute("msg", "Record Inserted Successfully");
					redirect.addFlashAttribute("cssMsg", "success");
				}else {
					specialOfferPriceDao.save(specialOfferPriceBean);
					redirect.addFlashAttribute("msg", "Record Updated Successfully");
					redirect.addFlashAttribute("cssMsg", "warning");
				}
			
		} catch (Exception e) {
			System.out.println("Exception in SpecialOfferPriceController Controller in saveSpecialOfferForm()");
			redirect.addFlashAttribute("msg", "Failed");
			redirect.addFlashAttribute("cssMsg", "danger");
		}
		return "redirect:offerPriceForm";
	
	}
	@RequestMapping(value = "/deleteSpecialPrice")
	public @ResponseBody String deleteSpecialPrice(HotelRoomPriceBean  roomPriceBean, HttpSession objSession,
			HttpServletRequest objRequest)  {
		boolean delete = false;
		JSONObject jsonObj = new JSONObject();
		List<SpecialOfferPriceBean> listOrderBeans=null;
		try{
			
			if (roomPriceBean.getId() != 0 && roomPriceBean.getStatus() !="") {
				delete = specialOfferPriceDao.delete(roomPriceBean.getId(),roomPriceBean.getStatus());
				if (delete) {
					jsonObj.put("message", "deleted");
				} else {
					jsonObj.put("message", "delete fail");
				}
			}

			listOrderBeans = specialOfferPriceDao.getAllOfferPriceList("1");
			if (listOrderBeans != null && listOrderBeans.size() > 0) {

				jsonObj.put("allOrders1", listOrderBeans);
				// System.out.println(sJson);
			} else {
				jsonObj.put("allOrders1", listOrderBeans);
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonObj.put("message", "excetption" + e);
			return String.valueOf(jsonObj);

		}
		return String.valueOf(jsonObj);
	}
	@RequestMapping(value = "/inActiveSpecialPrice")
	public @ResponseBody String inActiveSpecialPrice(@RequestParam("status") String status)  {
		JSONObject jsonObj = new JSONObject();
		List<SpecialOfferPriceBean> listOrderBeans=null;
		try{
			listOrderBeans = specialOfferPriceDao.getAllOfferPriceList(status);
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
			String sSql = "SELECT id ,CONCAT(name,'(',numberOfAdult,')') AS name FROM `hotel_capacity_master` WHERE status='1'";
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
	

}
