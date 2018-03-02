/*package com.eBilling.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;
import org.apache.commons.lang.StringUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eBilling.dao.ClientDao;
import com.eBilling.dao.RegisterDao;
import com.eBilling.model.Client;
import com.eBilling.model.Register;
import com.eBilling.service.ClientService;
import com.eBilling.service.PurchaseInfoService;
import com.eBilling.service.RegistrationService;
import com.eBilling.util.AWSS3Util;
import com.eBilling.util.CommonUtils;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class ClientController {
	
	@Autowired
	ClientService clientService;
	
	
	
	@RequestMapping(value = "/clientHome")
public String clientHome(@ModelAttribute Register register ,HttpServletResponse objResponce, HttpSession objSession,HttpServletRequest objRequest) {

		System.out.println("From clientHome Home");
		objResponce.setCharacterEncoding("UTF-8");
		String sJson = null;
		try {
			sJson = clientService.getAllClient();
			objRequest.setAttribute("allClientInfo", sJson);
			System.out.println("sJson:"+sJson);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
	
		
	return "clientHome";
}
	
	@RequestMapping(value = "/saveClient")
	public @ResponseBody String saveClient(@ModelAttribute Client client ,@RequestParam("file") List<MultipartFile> multipartFile, HttpSession objSession,HttpServletRequest objRequest) {
		boolean isInsert=false;
		String sJson ="";
		String photoPath = null;
		try{
			System.out.println("multipartFile=="+multipartFile);
			if (!multipartFile.isEmpty()){
				for(MultipartFile file: multipartFile){
					System.out.println("file=="+file.getOriginalFilename());
						photoPath = AWSS3Util.ImageUpload(file);
						System.out.println("photoPath=="+photoPath);
					
				}
				if(StringUtils.isNotBlank(photoPath)){
					client.setUploadLogo(photoPath);	
				}
				
			}
			client.setClientId(CommonUtils.getAutoGenId());
			client.setCreatedDate(CommonUtils.getDate());
			client.setClientEmail(client.getClientEmail());
			client.setCompanyName(client.getCompanyName());
			client.setContactNo(client.getContactNo());
			client.setContactPerson(client.getContactPerson());
			client.setEmailSupport(client.getEmailSupport());
			client.setSmsUrl(client.getSmsUrl());
			client.setSmsPassword(client.getSmsPassword());
			client.setSmsSuport(client.getEmailSupport());
			client.setSmsUserName(client.getSmsUserName());
			client.setTinNo(client.getTinNo());
			
			isInsert=clientService.saveClient(client);
			 if (isInsert) {
				 sJson = clientService.getAllClient();
					System.out.println("save: " + sJson);
			 }
		}catch(Exception e){
			System.out.println("Exception in Client Controller in  saveClient()");
		}
			 
		return sJson;
}
	@RequestMapping(value = "/updateClient")
	public @ResponseBody
	String updateClient(@ModelAttribute Client client,
			@RequestParam("file") List<MultipartFile> multipartFile, HttpSession objSession,
			HttpServletRequest objRequest) {
		boolean isupdate = false;
		String sJson = "";
		try {
			System.out.println("multipartFile--------"+multipartFile);
			client.setEmailSupport(data.getString("emailSupport"));
			client.setSmsSuport(data.getString("smsSuport"));
			client.setUploadLogo(data.getString("uploadLogo"));
			client.setClientId(data.getString("clientId"));
			client.setClientEmail(data.getString("clientEmail"));
			client.setAddress(data.getString("address"));
			client.setCompanyName(data.getString("companyName"));
			client.setContactNo(data.getString("contactNo"));
			client.setContactPerson(data.getString("contactPerson"));
			client.setTinNo(data.getString("tinNo"));
			client.setCreatedDate(CommonUtils.getDate());
			System.out.println("isupdateisupdateisupdateisupdate");
				//isupdate = clientService.updateClient(client);
				System.out.println("isupdate"+isupdate);
				if (isupdate)
					sJson = clientService.getAllClient();
				System.out.println("update: " + sJson);
		} catch (Exception ex) {
			System.out
			.println("Exception in Product Client in  updateClient()");
			ex.printStackTrace();
		}
		return sJson;
	}

	@RequestMapping(value = "/deleteClient")
	public @ResponseBody
	String deleteClient(@RequestParam("id") String id,
			HttpSession objSession, HttpServletRequest objRequest)
			throws JsonGenerationException, JsonMappingException, IOException {
		boolean isDelete = false;
		String sJson = "";
		isDelete = clientService.deleteClient(id);
		System.out.println("1111111111"+isDelete);
		if (isDelete){
			sJson = clientService.getAllClient();
			System.out.println("Delete"+sJson);
		}
		return sJson;
	}

	
}*/