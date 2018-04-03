/**
 * 
 */
package com.aurospaces.neighbourhood.controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

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
import com.aurospaces.neighbourhood.db.dao.HotelRoomCapacityDao;
import com.aurospaces.neighbourhood.db.dao.HotelRoomTypeDao;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author Kotaiah
 *
 */
@Controller
@RequestMapping(value = "/admin")
public class RoomCapacityController {
	@Autowired HotelRoomCapacityDao hotelRoomCapacityDao;
	@Autowired HotelRoomTypeDao hotelRoomTypeDao;
	@RequestMapping(value = "/roomcapacity")
	public String roomcapacity(@Valid @ModelAttribute("capacityForm") HotelRoomCapacityBean hotelCapacityMasterBean,
			ModelMap model, HttpServletRequest request, HttpSession session) {

		ObjectMapper objectMapper = null;
		String sJson = null;
		List<HotelRoomCapacityBean> listOrderBeans = null;
		try {
			listOrderBeans = hotelRoomCapacityDao.getAllRoomCapacity("1");
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
		return "roomcapacity";
	}
	@RequestMapping(value = "/addroomcapacity", method = RequestMethod.POST)
	public String addroomcapacity(HotelRoomCapacityBean roomTypeBean,
			BindingResult bindingresults, Model model, RedirectAttributes redir) {

		// List<CylindermasterBean> cylinderMaster=null;

		int id = 0;
		String size = null;

		try {
			
			roomTypeBean.setStatus("1");
			HotelRoomCapacityBean roomTypeBean2 = hotelRoomCapacityDao.getByRoomCapacityName(roomTypeBean);
			int dummyId = 0;
			if (roomTypeBean2 != null) {
				dummyId = roomTypeBean2.getId();
			}
			if (roomTypeBean.getId() != 0) {
				id = roomTypeBean.getId();
				if (id == dummyId || roomTypeBean2 == null) {

					hotelRoomCapacityDao.save(roomTypeBean);
					redir.addFlashAttribute("msg", "Record Updated Successfully");
					redir.addFlashAttribute("cssMsg", "warning");
				} else {
					redir.addFlashAttribute("msg", "Already Record Exist");
					redir.addFlashAttribute("cssMsg", "danger");
				}
			}
			if (roomTypeBean.getId() == 0 && roomTypeBean2 == null) {
				hotelRoomCapacityDao.save(roomTypeBean);

				redir.addFlashAttribute("msg", "Record Inserted Successfully");
				redir.addFlashAttribute("cssMsg", "success");
			}
			if (roomTypeBean.getId() == 0 && roomTypeBean2 != null) {
				redir.addFlashAttribute("msg", "Already Record Exist");
				redir.addFlashAttribute("cssMsg", "danger");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return "redirect:roomcapacity";
	}

	 @RequestMapping(value = "/deleteroomcapacity")
	public @ResponseBody String deleteroomcapacity(HotelRoomCapacityBean roomTypeBean, ModelMap model,
			HttpServletRequest request, HttpSession session, BindingResult objBindingResult) {
		System.out.println("deleteCylinder page...");
		List<HotelRoomCapacityBean> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean delete = false;
		try {
			if (roomTypeBean.getId() != 0 && roomTypeBean.getStatus() != "") {
				delete = hotelRoomCapacityDao.delete(roomTypeBean.getId(),
						roomTypeBean.getStatus());
				if (delete) {
					jsonObj.put("message", "deleted");
				} else {
					jsonObj.put("message", "delete fail");
				}
			}

			listOrderBeans = hotelRoomCapacityDao.getAllRoomCapacity("1");
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
			jsonObj.put("message", "excetption" + e);
			return String.valueOf(jsonObj);

		}
		return String.valueOf(jsonObj);
	}
	 
	 @RequestMapping(value = "/inactiveroomcapacity")
		public @ResponseBody String inactiveroomcapacity(@RequestParam("status") String status) throws JsonGenerationException, JsonMappingException, IOException {
			List<HotelRoomCapacityBean> listOrderBeans = null;
			ObjectMapper objectMapper = null;
			String sJson="";
			listOrderBeans=hotelRoomCapacityDao.getAllRoomCapacity(status);
				 /// System.out.println("inActiveItem data--"+sJson);
			objectMapper = new ObjectMapper();
			if (listOrderBeans != null && listOrderBeans.size() > 0) {

				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				// System.out.println(sJson);
			}
			
			return sJson;
		}
	 
		
}
