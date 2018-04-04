package com.aurospaces.neighbourhood.controller;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aurospaces.neighbourhood.bean.HotelRoomMasterBean;
import com.aurospaces.neighbourhood.db.dao.HotelOccupationMasterDao;
import com.aurospaces.neighbourhood.db.dao.HotelRoomMasterDao;
import com.aurospaces.neighbourhood.db.dao.HotelRoomTypeDao;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class UserRoomTariff {
	
	@Autowired HotelRoomTypeDao hotelRoomTypeDao;
	@Autowired HotelRoomMasterDao hotelRoomMasterDao;
	@Autowired HotelOccupationMasterDao hotelCapacityMasterDao;
		private Logger logger = Logger.getLogger(UserRoomTariff.class);
		
		@RequestMapping(value = "/userroomtariff")
		 public String userroomtariff() {
			ObjectMapper objectMapper = null;
			String sJson = null;
			List<HotelRoomMasterBean> listOrderBeans=null;
			ModelAndView modelAndview;
			try {
				
				System.out.println("user room Tariff");
				
				/*listOrderBeans = hotelRoomMasterDao.getAllRooms("1");
				if (listOrderBeans != null && listOrderBeans.size() > 0) {
					objectMapper = new ObjectMapper();
					sJson = objectMapper.writeValueAsString(listOrderBeans);
					request.setAttribute("allOrders1", sJson);
					// System.out.println(sJson);
				} else {
					objectMapper = new ObjectMapper();
					sJson = objectMapper.writeValueAsString(listOrderBeans);
					request.setAttribute("allOrders1", "''");
				}*/

			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);

			}
			return "roomtariff";
				
		}
		
				
	}



