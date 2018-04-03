package com.aurospaces.neighbourhood.controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.HotelOccupationMasterBean;
import com.aurospaces.neighbourhood.bean.HotelRoomCapacityBean;
import com.aurospaces.neighbourhood.bean.HotelRoomTypeBean;
import com.aurospaces.neighbourhood.db.dao.HotelOccupationMasterDao;
import com.aurospaces.neighbourhood.db.dao.HotelRoomCapacityDao;
import com.aurospaces.neighbourhood.db.dao.HotelRoomTypeDao;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping(value = "/admin")
public class RoomOccupationController {

	private Logger logger = Logger.getLogger(RoomOccupationController.class);
	@Autowired
	HotelOccupationMasterDao capacityMasterDao;
	@Autowired HotelRoomCapacityDao hotelRoomCapacityDao;
	@Autowired HotelRoomTypeDao hotelRoomTypeDao;
	@RequestMapping(value = "/occupation")
	public String capacityHome(@Valid @ModelAttribute("occupationForm") HotelOccupationMasterBean hotelCapacityMasterBean,
			ModelMap model, HttpServletRequest request, HttpSession session) {

		ObjectMapper objectMapper = null;
		String sJson = null;
		List<HotelOccupationMasterBean> listOrderBeans = null;
		try {
			listOrderBeans = capacityMasterDao.getAllCapacity("1");
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
		return "occupationHome";
	}

	@RequestMapping(value = "/addCapacity", method = RequestMethod.POST)
	public String addRoomType(HotelOccupationMasterBean hotelCapacityMasterBean,
			BindingResult bindingresults, Model model, RedirectAttributes redir) {

		// List<CylindermasterBean> cylinderMaster=null;

		int id = 0;
		String size = null;

		try {
			
			hotelCapacityMasterBean.setStatus("1");
			HotelRoomTypeBean listBean = capacityMasterDao.getByCapacityName(hotelCapacityMasterBean);
			int dummyId = 0;
			if (listBean != null) {
				dummyId = listBean.getId();
			}
			if (hotelCapacityMasterBean.getId() != 0) {
				id = hotelCapacityMasterBean.getId();
				if (id == dummyId || listBean == null) {

					capacityMasterDao.save(hotelCapacityMasterBean);
					redir.addFlashAttribute("msg", "Record Updated Successfully");
					redir.addFlashAttribute("cssMsg", "warning");
				} else {
					redir.addFlashAttribute("msg", "Already Record Exist");
					redir.addFlashAttribute("cssMsg", "danger");
				}
			}
			if (hotelCapacityMasterBean.getId() == 0 && listBean == null) {
				capacityMasterDao.save(hotelCapacityMasterBean);

				redir.addFlashAttribute("msg", "Record Inserted Successfully");
				redir.addFlashAttribute("cssMsg", "success");
			}
			if (hotelCapacityMasterBean.getId() == 0 && listBean != null) {
				redir.addFlashAttribute("msg", "Already Record Exist");
				redir.addFlashAttribute("cssMsg", "danger");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return "redirect:occupation";
	}

	 @RequestMapping(value = "/deleteCapacity")
	public @ResponseBody String deleteCapacity(HotelRoomTypeBean roomTypeBean, ModelMap model,
			HttpServletRequest request, HttpSession session, BindingResult objBindingResult) {
		System.out.println("deleteCylinder page...");
		List<HotelOccupationMasterBean> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean delete = false;
		try {
			if (roomTypeBean.getId() != 0 && roomTypeBean.getStatus() != "") {
				delete = capacityMasterDao.delete(roomTypeBean.getId(),
						roomTypeBean.getStatus());
				if (delete) {
					jsonObj.put("message", "deleted");
				} else {
					jsonObj.put("message", "delete fail");
				}
			}

			listOrderBeans = capacityMasterDao.getAllCapacity("1");
			objectMapper = new ObjectMapper();
			if (listOrderBeans != null && listOrderBeans.size() > 0) {

				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				jsonObj.put("allOrders1", listOrderBeans);
				// System.out.println(sJson);
			} else {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", "''");
				jsonObj.put("allOrders1", listOrderBeans);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			logger.fatal("error in deleteRoomType class deleteEducation method  ");
			jsonObj.put("message", "excetption" + e);
			return String.valueOf(jsonObj);

		}
		return String.valueOf(jsonObj);
	}
	 
	 @RequestMapping(value = "/inActiveCapacity")
		public @ResponseBody String inActiveRoomType(@RequestParam("status") String status) throws JsonGenerationException, JsonMappingException, IOException {
			List<HotelOccupationMasterBean> listOrderBeans = null;
			ObjectMapper objectMapper = null;
			String sJson="";
			listOrderBeans=capacityMasterDao.getAllCapacity(status);
				 /// System.out.println("inActiveItem data--"+sJson);
			objectMapper = new ObjectMapper();
			if (listOrderBeans != null && listOrderBeans.size() > 0) {

				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				// System.out.println(sJson);
			}
			
			return sJson;
		}
	 @RequestMapping(value = "/getRoomOcupation")
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
		@ModelAttribute("occupation")
		public Map<Integer, String> populateCapacity() {
			Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
			try {
				String sSql = "SELECT id , name FROM `hotel_occupation_master` WHERE status='1'";
				List<HotelRoomCapacityBean> list = hotelRoomCapacityDao.populate(sSql);
				for (HotelRoomCapacityBean bean : list) {
					statesMap.put(bean.getId(), bean.getName());
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
			}
			return statesMap;
		}
	 
}
