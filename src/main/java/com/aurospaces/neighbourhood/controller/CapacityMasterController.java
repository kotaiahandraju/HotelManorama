package com.aurospaces.neighbourhood.controller;

import java.io.IOException;
import java.util.List;

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

import com.aurospaces.neighbourhood.bean.HotelCapacityMasterBean;
import com.aurospaces.neighbourhood.bean.HotelRoomTypeBean;
import com.aurospaces.neighbourhood.db.dao.CylindermasterDao;
import com.aurospaces.neighbourhood.db.dao.HotelCapacityMasterDao;
import com.aurospaces.neighbourhood.db.dao.HotelRoomTypeDao;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping(value = "/admin")
public class CapacityMasterController {

	private Logger logger = Logger.getLogger(CapacityMasterController.class);
	@Autowired
	HotelCapacityMasterDao capacityMasterDao;

	@RequestMapping(value = "/capacityHome")
	public String capacityHome(@Valid @ModelAttribute("capacityForm") HotelCapacityMasterBean hotelCapacityMasterBean,
			ModelMap model, HttpServletRequest request, HttpSession session) {

		ObjectMapper objectMapper = null;
		String sJson = null;
		List<HotelCapacityMasterBean> listOrderBeans = null;
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
		return "capacityHome";
	}

	@RequestMapping(value = "/addCapacity", method = RequestMethod.POST)
	public String addRoomType(HotelCapacityMasterBean hotelCapacityMasterBean,
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
		return "redirect:capacityHome";
	}

	 @RequestMapping(value = "/deleteCapacity")
	public @ResponseBody String deleteCapacity(HotelRoomTypeBean roomTypeBean, ModelMap model,
			HttpServletRequest request, HttpSession session, BindingResult objBindingResult) {
		System.out.println("deleteCylinder page...");
		List<HotelCapacityMasterBean> listOrderBeans = null;
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
			List<HotelCapacityMasterBean> listOrderBeans = null;
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
		
}
