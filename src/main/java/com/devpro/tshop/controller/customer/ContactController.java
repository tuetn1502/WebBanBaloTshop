package com.devpro.tshop.controller.customer;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.tshop.controller.BaseController;
import com.devpro.tshop.dto.ContactModel;
import com.devpro.tshop.entities.Contact;
import com.devpro.tshop.services.ContactService;

@Controller
public class ContactController extends BaseController {
	@RequestMapping(value = { "/contact" }, method = RequestMethod.GET)
	public String get_contact(final Model model,final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
		//đẩy thông báo xuống tầng view
		Contact contact = new Contact();
		
		model.addAttribute("contact",contact);
		return "customer/contact"; //-> đường dẫn tới View
		
	}
	@Autowired
	private ContactService contactService;
//	// dùng cho HTML form
//
//	@RequestMapping(value = { "/contact" }, method = RequestMethod.POST)
//	public String post_contact(final Model model,final HttpServletRequest request,
//			final HttpServletResponse response) throws IOException{
//		//đẩy thông báo xuống tầng view
//				ContactModel contactModel = new ContactModel();
//				contactModel.setThongBao("Do you have any questions???");
//				model.addAttribute("contactModel",contactModel);
//		
//		//đọc dữ liệu từ người dùng submit lên
//		String yourName =request.getParameter("name");
//		String yourEmail =request.getParameter("email");
//		String yourSubject =request.getParameter("subject");
//		String yourmessage =request.getParameter("message");
//		model.addAttribute("DuLieuBanNhapLa",yourName + yourEmail+yourSubject+yourmessage);
//		return "customer/contact"; //-> đường dẫn tới View
//		
//	}
	// dùng cho Spring form
	@RequestMapping(value = { "/contact" }, method = RequestMethod.POST)
	public String post_contact(final Model model
			, final HttpServletRequest request
			, final HttpServletResponse response
			,@ModelAttribute("contact") Contact contact)
			throws IOException {
//		// đẩy thông báo xuống tầng view
//		contactModel.setThongBao("Do you have any questions???");
//		model.addAttribute("contactModel", contactModel);
//
//		// đọc dữ liệu từ người dùng submit lên
//		model.addAttribute("DuLieuBanNhapLa", contactModel.getName()+ contactModel.getEmail()+contactModel.getSubject()+contactModel.getMessage());
		contactService.saveOrUpdate(contact);
		return "customer/contact"; // -> đường dẫn tới View

	}
	
	//dùng ajax
	@RequestMapping(value = {"/ajax/contact"},method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_contact(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody Contact contact){
		
//		System.out.println("ContactModel[Email]:"+contactModel.getEmail());
//		contactService.saveOrUpdate(contact);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
//		jsonResult.put("code",200);
		jsonResult.put("message",contact);
		return ResponseEntity.ok(jsonResult);
		
	}
}
