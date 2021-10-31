package com.devpro.tshop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.devpro.tshop.dto.UserSearchModel;
import com.devpro.tshop.entities.Categories;
import com.devpro.tshop.entities.Roles;
import com.devpro.tshop.entities.Users;
import com.devpro.tshop.services.CategoryService;
import com.devpro.tshop.services.PagerData;
import com.devpro.tshop.services.RolesService;

public abstract class BaseController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private RolesService rolesService;
	//phân quyền
	private List<String> roles() {
		List<String> roles = new ArrayList<String>();
		Users logined = getUserLogined();
		
		if(logined == null) return roles;
		for(Roles r : logined.getRoles()) {
			roles.add(r.getAuthority());
		}
		
		return roles;
	}
	
	@ModelAttribute("isAdmin")
	public boolean isAdmin() {
		for(String role : roles()) {
			if(role.equalsIgnoreCase("admin")) return true;
		}
		return false;
	}
	
	@ModelAttribute("isLogined")
	public boolean isLogined() {
		boolean isLogined =false;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			isLogined =true;
		}
		return isLogined;
	}
//	@ModelAttribute("isMember")
//	public boolean isMember() {
//		for(String role : roles()) {
//			if(role.equalsIgnoreCase("member")) return true;
//		}
//		return false;
//	}
	
	@ModelAttribute("userLogined")
	public Users getUserLogined() {
		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(userLogined != null && userLogined instanceof UserDetails)
			return (Users) userLogined;
		
		return null;
	}
	
	
	@ModelAttribute("shipFee")
	public int shipFee() {
		int shipFee =30000;
		return shipFee;
	}
	
	
	@ModelAttribute("categories")
	public List<Categories> categories() {
		return categoryService.findAll();
	}
	@ModelAttribute("categoryParent")
	public PagerData<Categories> categoryParent() {
		String sql="SELECT * FROM balotshop.tbl_category where tbl_category.parent_id is null;";
		return categoryService.runTransactQuerySQL(sql,0);
	}
	@ModelAttribute("roleUsers")
	public PagerData<Roles> roleUsers() {
		String sql="SELECT * FROM balotshop.tbl_Roles;";
		return rolesService.runTransactQuerySQL(sql,0);
	}
	@ModelAttribute("categoryChild")
	public PagerData<Categories> categoryChild() {
		String sql="SELECT * FROM balotshop.tbl_category where tbl_category.parent_id is not null;";
		return categoryService.runTransactQuerySQL(sql,0);
	}
	
	public PagerData<Categories> categoryChildByParentId(int id) {
		String sql="SELECT * FROM balotshop.tbl_category where tbl_category.parent_id = "+id+";";
		return categoryService.runTransactQuerySQL(sql,0);
	}
	public int getCurrentPage(HttpServletRequest request) {
		try {
			return Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			return 1;
		}
	}
	public Integer getInterger(HttpServletRequest request, String paramName) {
		try {
			return Integer.parseInt(request.getParameter(paramName));
		} catch (Exception e) {
			return null;
		}
	}
}
