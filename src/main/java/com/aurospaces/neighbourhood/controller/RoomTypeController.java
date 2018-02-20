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
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.HotelRoomTypeBean;
import com.aurospaces.neighbourhood.db.dao.HotelRoomTypeDao;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;




@Controller
@RequestMapping(value = "/admin")
public class RoomTypeController {
	
	
	private Logger logger = Logger.getLogger(RoomTypeController.class);
	@Autowired
	HotelRoomTypeDao roomTypeDao;
	@RequestMapping(value = "/roomTypeHome")
	public String roomTypeHome(@Valid @ModelAttribute("roomTypeForm") HotelRoomTypeBean roomTypeBean,
			ModelMap model, HttpServletRequest request, HttpSession session) {

		ObjectMapper objectMapper = null;
		String sJson = null;
		List<HotelRoomTypeBean> listOrderBeans = null;
		try {
			listOrderBeans = roomTypeDao.getAllRoomType("1");
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				 System.out.println(sJson);
			} else {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", "''");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return "roomTypeHome";
	}
	
	@RequestMapping(value = "/saveRoomType")
	public String saveRoomType( HotelRoomTypeBean roomTypeBean,
		RedirectAttributes redir) {
		
		//List<CylindermasterBean> cylinderMaster=null;
		
		int id = 0;
		
		try
		{
			HotelRoomTypeBean objRoomTypeBean =roomTypeDao.getByRoomTypeName(roomTypeBean);
			int dummyId =0;
			if(objRoomTypeBean != null){
				dummyId = objRoomTypeBean.getId();
			}
			if(roomTypeBean.getId() != 0)
			{
				id = roomTypeBean.getId();
				if(id == dummyId || objRoomTypeBean == null )
				{
					
					
					
					roomTypeDao.save(roomTypeBean);
					redir.addFlashAttribute("msg", "Record Updated Successfully");
					redir.addFlashAttribute("cssMsg", "warning");
				}
				else
				{
					redir.addFlashAttribute("msg", "Already Record Exist");
					redir.addFlashAttribute("cssMsg", "danger");
				}
			}
			if(roomTypeBean.getId() == 0 && objRoomTypeBean == null)
			{
				roomTypeBean.setStatus("1");
				roomTypeDao.save(roomTypeBean);
				
				redir.addFlashAttribute("msg", "Record Inserted Successfully");
				redir.addFlashAttribute("cssMsg", "success");
			}
			if(roomTypeBean.getId() == 0 && objRoomTypeBean != null)
			{
				redir.addFlashAttribute("msg", "Already Record Exist");
				redir.addFlashAttribute("cssMsg", "danger");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return "redirect:roomTypeHome";
	}	
		

	
	 @RequestMapping(value = "/deleteRoomType")
	public @ResponseBody String deleteRoomType(HotelRoomTypeBean roomTypeBean, ModelMap model,
			HttpServletRequest request, HttpSession session, BindingResult objBindingResult) {
		System.out.println("deleteRoomType page...");
		List<HotelRoomTypeBean> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean delete = false;
		try {
			if (roomTypeBean.getId() != 0 && roomTypeBean.getStatus() !="") {
				delete = roomTypeDao.delete(roomTypeBean.getId(),roomTypeBean.getStatus());
				if (delete) {
					jsonObj.put("message", "deleted");
				} else {
					jsonObj.put("message", "delete fail");
				}
			}

			listOrderBeans = roomTypeDao.getAllRoomType("1");
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
			logger.fatal("error in EducationController class deleteEducation method  ");
			jsonObj.put("message", "excetption" + e);
			return String.valueOf(jsonObj);

		}
		return String.valueOf(jsonObj);
	}
	 @RequestMapping(value = "/inActiveRoomType")
		public @ResponseBody String inActiveRoomType(@RequestParam("status") String status)  {
			List<HotelRoomTypeBean> listHotelRoomTypeBean = null;
			ObjectMapper objectMapper = null;
			String sJson=null;
				 try {
					 
					 listHotelRoomTypeBean=roomTypeDao.getAllRoomType(status);
						if(listHotelRoomTypeBean !=null && listHotelRoomTypeBean.size() > 0 ){
							objectMapper =new ObjectMapper();
					sJson=objectMapper.writeValueAsString(listHotelRoomTypeBean);
				}  else {
							sJson= "";
						}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			
			return sJson;
		}
	 
	}
