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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.HotelOccupationMasterBean;
import com.aurospaces.neighbourhood.bean.HotelRoomPriceBean;
import com.aurospaces.neighbourhood.bean.HotelRoomPriceHistory;
import com.aurospaces.neighbourhood.bean.HotelRoomTypeBean;
import com.aurospaces.neighbourhood.bean.HotelRoomUserDetailsBean;
import com.aurospaces.neighbourhood.db.dao.HotelOccupationMasterDao;
import com.aurospaces.neighbourhood.db.dao.HotelRoomMasterDao;
import com.aurospaces.neighbourhood.db.dao.HotelRoomPriceDao;
import com.aurospaces.neighbourhood.db.dao.HotelRoomTypeDao;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping(value="/admin")
public class bookingHistoryController {
	
	@Autowired HotelRoomTypeDao hotelRoomTypeDao;
	@Autowired HotelRoomMasterDao hotelRoomMasterDao;
	@Autowired HotelOccupationMasterDao hotelCapacityMasterDao;
	@Autowired HotelRoomPriceDao roomPriceDao;
	
		@RequestMapping(value = "/bookingHistory")
		 public String bookingHistory(HotelRoomPriceBean roomPriceBean,HttpServletRequest request) {
			ObjectMapper objectMapper = null;
			String sJson = null;
			List<HotelRoomUserDetailsBean> listOrderBeans=null;
			ModelAndView modelAndview;
			try {
				
				System.out.println("user Booking History");
				
				listOrderBeans = roomPriceDao.getBookigHistory();
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
			return "bookingHistory";
				
		}
	}



