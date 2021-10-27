package com.devpro.tshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.devpro.tshop.entities.Categories;
import com.devpro.tshop.services.CategoryService;
import com.devpro.tshop.services.PagerData;

public abstract class BaseController {
	@Autowired
	private CategoryService categoryService;
	
	@ModelAttribute("categories")
	public List<Categories> categories() {
		return categoryService.findAll();
	}
	@ModelAttribute("categoryParent")
	public PagerData<Categories> categoryParent() {
		String sql="SELECT * FROM balotshop.tbl_category where tbl_category.parent_id is null;";
		return categoryService.runTransactQuerySQL(sql,0);
	}
	@ModelAttribute("categoryChild")
	public PagerData<Categories> categoryChild() {
		String sql="SELECT * FROM balotshop.tbl_category where tbl_category.parent_id is not null;";
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
