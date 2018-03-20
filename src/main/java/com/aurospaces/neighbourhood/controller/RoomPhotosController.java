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
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.HotelCapacityMasterBean;
import com.aurospaces.neighbourhood.bean.HotelRoomPhotosBean;
import com.aurospaces.neighbourhood.bean.HotelRoomTypeBean;
import com.aurospaces.neighbourhood.db.dao.CylindermasterDao;
import com.aurospaces.neighbourhood.db.dao.HotelCapacityMasterDao;
import com.aurospaces.neighbourhood.db.dao.HotelRoomMasterDao;
import com.aurospaces.neighbourhood.db.dao.HotelRoomPhotosDao;
import com.aurospaces.neighbourhood.db.dao.HotelRoomTypeDao;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import CommonUtils.FileUploadUtil;

@Controller
@RequestMapping(value = "/admin")
public class RoomPhotosController {

	private Logger logger = Logger.getLogger(RoomPhotosController.class);
	@Autowired
	CylindermasterDao cylindermasterDao;
	@Autowired
	HotelRoomTypeDao hotelRoomTypeDao;
	@Autowired
	HotelRoomMasterDao hotelRoomMasterDao;
	@Autowired
	HotelCapacityMasterDao hotelCapacityMasterDao;
	@Autowired
	HotelRoomPhotosDao RoomPhotosDao;

	@RequestMapping(value = "/roomPhotosHome")
	public String roomPhotosHome(@Valid @ModelAttribute("roomPhotoForm") HotelRoomPhotosBean roomPhotoBean,
			ModelMap model, HttpServletRequest request, HttpSession session) {

		ObjectMapper objectMapper = null;
		String sJson = null;
		List<HotelRoomPhotosBean> listOrderBeans = null;
		try {
			listOrderBeans = RoomPhotosDao.getAllRoomPhotos("1");
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
		return "roomPhotosHome";
	}

	@SuppressWarnings("null")
	@RequestMapping(value = "/addRoomPhotos", method = RequestMethod.POST)
	public String addRoomPhotos(@RequestParam("image") MultipartFile[] file,
			@ModelAttribute("roomPhotoForm") HotelRoomPhotosBean roomPhotoBean, RedirectAttributes redir,
			HttpServletRequest request) {

		// List<CylindermasterBean> cylinderMaster=null;

		int id = 0;

		try {
			StringBuffer photoIncreMent=null;
			photoIncreMent=new StringBuffer();
			for (int i = 0; i < file.length; i++) {
				String photoPath = null;
				// System.out.println("file=="+file[i].getOriginalFilename());
				if (file[i].getOriginalFilename() != "") {
					photoPath = FileUploadUtil.ImageUpload(file[i], request);
					String imageData =photoPath;
					System.out.println(imageData);
					// System.out.println("--:"+i+"photoPath=="+photoPath+"----:"+roomPhotoBean.getCapacityId());
					
					if(i==0) {
						photoIncreMent.append(imageData);
						System.out.println("append data...."+photoIncreMent);
					}else {
						StringBuffer data=photoIncreMent.append(",").append(imageData);
						System.out.println("addd data---- "+data);
					}
					
			}
			}
			
			roomPhotoBean.setStatus("1");
			roomPhotoBean.setImages(photoIncreMent.toString());
			HotelRoomPhotosBean roomPhotoBean2 = RoomPhotosDao.getByRoomPhotoId(roomPhotoBean);
			int dummyId = 0;
			if (roomPhotoBean2 != null) {
				dummyId = roomPhotoBean2.getId();
			}
			if (roomPhotoBean.getId() != 0) {
				id = roomPhotoBean.getId();
				if (id == dummyId || roomPhotoBean2 == null) {
					RoomPhotosDao.save(roomPhotoBean);
					redir.addFlashAttribute("msg", "Record Updated Successfully");
					redir.addFlashAttribute("cssMsg", "warning");
				} else {
					redir.addFlashAttribute("msg", "Already Record Exist");
					redir.addFlashAttribute("cssMsg", "danger");
				}
			}
			if (roomPhotoBean.getId() == 0 && roomPhotoBean2 == null) {
				RoomPhotosDao.save(roomPhotoBean);

				redir.addFlashAttribute("msg", "Record Inserted Successfully");
				redir.addFlashAttribute("cssMsg", "success");
			}
			if (roomPhotoBean.getId() == 0 && roomPhotoBean2 != null) {
				redir.addFlashAttribute("msg", "Already Record Exist");
				redir.addFlashAttribute("cssMsg", "danger");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return "redirect:roomPhotosHome";
	}

	private List ArrayList() {
		// TODO Auto-generated method stub
		return null;
	}

	@RequestMapping(value = "/deleteRoomPhotos")
	public @ResponseBody String deleteRoomPhotos(HotelRoomPhotosBean roomPhotoBean, ModelMap model,
			HttpServletRequest request, HttpSession session, BindingResult objBindingResult) {
		// System.out.println("deleteCylinder page...");
		List<HotelRoomPhotosBean> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean delete = false;
		try {
			if (roomPhotoBean.getId() != 0 && roomPhotoBean.getStatus() != "") {
				delete = RoomPhotosDao.delete(roomPhotoBean.getId(), roomPhotoBean.getStatus());
				if (delete) {
					jsonObj.put("message", "deleted");
				} else {
					jsonObj.put("message", "delete fail");
				}
			}

			listOrderBeans = RoomPhotosDao.getAllRoomPhotos("1");
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

	@RequestMapping(value = "/inActiveRoomPhotos")
	public @ResponseBody String inActiveRoomPhotos(@RequestParam("status") String status)
			throws JsonGenerationException, JsonMappingException, IOException {
		List<HotelRoomPhotosBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = "";
		listOrderBeans = RoomPhotosDao.getAllRoomPhotos(status);
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
