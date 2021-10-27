package com.devpro.tshop.controller.administrator;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.tshop.controller.BaseController;
import com.devpro.tshop.services.CategoryService;

@Controller
public class AdminHomepageController extends BaseController {
	@Autowired
	private CategoryService categoryService;
	@RequestMapping(value = {"/admin/index"}, method = RequestMethod.GET)
	public String adminhomepage(final Model model,final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
				return "administrator/index";
		
	}
}
