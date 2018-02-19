package com.aurospaces.neighbourhood.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aurospaces.neighbourhood.db.dao.CylindermasterDao;
import com.fasterxml.jackson.databind.ObjectMapper;

@SuppressWarnings("unused")
@Controller
@RequestMapping(value="admin")
public class DashBoardController {
	@Autowired CylindermasterDao cylindermasterDao;
	private Logger logger = Logger.getLogger(DashBoardController.class);
	@RequestMapping(value = "/dashboard")
	public String fillingStationHome( ModelMap model, HttpServletRequest request,
			HttpSession session) {
		//List<ddd> listOrderBeans  = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson=null;
		boolean delete = false;
		try {
			/*listOrderBeans = addGasDao.getdata();
			 objectMapper = new ObjectMapper();
				if (listOrderBeans != null && listOrderBeans.size() > 0) {
					
					objectMapper = new ObjectMapper();
					sJson = objectMapper.writeValueAsString(listOrderBeans);
					request.setAttribute("allOrders1", sJson);
					jsonObj.put("dps", listOrderBeans);
					// System.out.println(sJson);
				} else {
					objectMapper = new ObjectMapper();
					sJson = objectMapper.writeValueAsString(listOrderBeans);
					request.setAttribute("dps", "''");
					jsonObj.put("allOrders1", listOrderBeans);
				}*/

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return "dashboardHome";
	}
/*	@RequestMapping(value = "/getCount")
	public @ResponseBody String getCount( ModelMap model, HttpServletRequest request,
			HttpSession session) {
		JSONObject objJson =new JSONObject();
		List<Map<String, Object>> cylindersCount =null;
		int totalCylinderCount = 0;
		int totalGas = 0;
		int customerCount = 0;
		try {
			
			 cylindersCount=cylindermasterDao.getCylindersCount();
			 for (int i = 0 ; i < cylindersCount.size() ; i++) {
		            Map<String, Object> myMap = cylindersCount.get(i);
//		            System.out.println("Data For Map" + i);
		            String status= String.valueOf( myMap.get("cylinderstatus"));
		            session.setAttribute(String.valueOf( myMap.get("cylinderstatus")),myMap.get("count"));
//		            System.out.println(myMap.get("count"));
//		            System.out.println( myMap.get("cylinderstatus"));
		            for (Entry<String, Object> entrySet : myMap.entrySet()) {
		                System.out.println("Key = " + entrySet.getKey() + " , Value = " + entrySet.getValue());
		            }
		        }
			 totalGas =  fillingstationmasterDao.totalGas();
			 totalCylinderCount = cylindermasterDao.getTotalcylindersCount();
			 customerCount = objCustomerDao.getCustomerCount();
			session.setAttribute("totalCylinderCount", totalCylinderCount);
			session.setAttribute("totalGas", totalGas);
			objJson.put("totalCylinderCount", totalCylinderCount);
			objJson.put("customerCount", customerCount);
			objJson.put("totalGas", totalGas);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return String.valueOf(objJson);
	}*/
	
	
}
