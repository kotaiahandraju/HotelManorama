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

import com.aurospaces.neighbourhood.bean.HotelRoomBean;
import com.aurospaces.neighbourhood.bean.HotelRoomTypeBean;
import com.aurospaces.neighbourhood.db.dao.HotelRoomDao;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;




@Controller
@RequestMapping(value = "/admin")
public class RoomController {
	
	
	private Logger logger = Logger.getLogger(RoomController.class);
	@Autowired
	HotelRoomDao roomDao;
	
	
	@RequestMapping(value = "/roomHome")
	public String roomHome(@Valid @ModelAttribute("roomForm") HotelRoomBean roomBean,
			ModelMap model, HttpServletRequest request, HttpSession session) {

		ObjectMapper objectMapper = null;
		String sJson = null;
		List<HotelRoomBean> listOrderBeans = null;
		try {
			listOrderBeans = roomDao.getAllRoom("1");
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
		return "roomHome";
	}
	
	@RequestMapping(value = "/saveRoom")
	public String saveRoomType( HotelRoomBean roomBean,
		RedirectAttributes redir) {
		
		//List<CylindermasterBean> cylinderMaster=null;
		
		int id = 0;
		
		try
		{
			HotelRoomTypeBean objRoomBean =roomDao.getByRoomTypeName(roomBean);
			int dummyId =0;
			if(objRoomBean != null){
				dummyId = objRoomBean.getId();
			}
			if(roomBean.getId() != 0)
			{
				id = roomBean.getId();
				if(id == dummyId || objRoomBean == null )
				{
					
					
					
					roomDao.save(roomBean);
					redir.addFlashAttribute("msg", "Record Updated Successfully");
					redir.addFlashAttribute("cssMsg", "warning");
				}
				else
				{
					redir.addFlashAttribute("msg", "Already Record Exist");
					redir.addFlashAttribute("cssMsg", "danger");
				}
			}
			if(roomBean.getId() == 0 && objRoomBean == null)
			{
				roomBean.setStatus("1");
				roomDao.save(roomBean);
				
				redir.addFlashAttribute("msg", "Record Inserted Successfully");
				redir.addFlashAttribute("cssMsg", "success");
			}
			if(roomBean.getId() == 0 && objRoomBean != null)
			{
				redir.addFlashAttribute("msg", "Already Record Exist");
				redir.addFlashAttribute("cssMsg", "danger");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return "redirect:roomHome";
	}	
		

	
	 @RequestMapping(value = "/deleteRoom")
	public @ResponseBody String deleteRoom(HotelRoomBean roomBean, ModelMap model,
			HttpServletRequest request, HttpSession session, BindingResult objBindingResult) {
		System.out.println("deleteRoomType page...");
		List<HotelRoomBean> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean delete = false;
		try {
			if (roomBean.getId() != 0 && roomBean.getStatus() !="") {
				delete = roomDao.delete(roomBean.getId(),roomBean.getStatus());
				if (delete) {
					jsonObj.put("message", "deleted");
				} else {
					jsonObj.put("message", "delete fail");
				}
			}

			listOrderBeans = roomDao.getAllRoom("1");
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
	 @RequestMapping(value = "/inActiveRoom")
		public @ResponseBody String inActiveRoom(@RequestParam("status") String status) throws JsonGenerationException, JsonMappingException, IOException {
			List<HotelRoomBean> listHotelRoomTypeBean = null;
			ObjectMapper objectMapper = null;
			String sJson=null;
			listHotelRoomTypeBean=roomDao.getAllRoom(status);
			if(listHotelRoomTypeBean !=null){
				objectMapper =new ObjectMapper();
				 sJson=objectMapper.writeValueAsString(listHotelRoomTypeBean);
			}
			
			return sJson;
		}
	}
