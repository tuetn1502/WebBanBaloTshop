package com.devpro.tshop.controller.administrator;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.tshop.components.Utilities;
import com.devpro.tshop.controller.BaseController;
import com.devpro.tshop.dto.CategorySearchModel;
import com.devpro.tshop.dto.ProductSearchModel;
import com.devpro.tshop.entities.Categories;
import com.devpro.tshop.services.CategoryService;
import com.devpro.tshop.services.ProductService;
import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;

@Controller
public class AdminCategoryController extends BaseController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ProductService productService;
	@RequestMapping(value = { "/admin/category/list" }, method = RequestMethod.GET)
	public String getAdminProductList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
//		Categories category = new Categories();
//		model.addAttribute("category",category);
//		model.addAttribute("categories", categoryService.findAll());
		
		
		CategorySearchModel searchModel = new CategorySearchModel();
		searchModel.setKeyword(request.getParameter("keyword"));
		searchModel.setPage(getCurrentPage(request));
		searchModel.setCategoryId(getInterger(request, "categoryId"));
		model.addAttribute("searchModel",searchModel);
		model.addAttribute("categoryWithPaging",categoryService.search(searchModel));
		
		// MVC được cấu hình chỉ định vào thư mục /src/main/webapp/WEB-INF/views
		// để tìm các views
		// /WEB-INF/views/user/index.jsp
		return "administrator/categoryList"; // -> đường dẫn tới View.
	}

	
	
	@RequestMapping(value = { "/admin/category/addOrUpdate" }, method = RequestMethod.GET)
	public String adminProductAddOrUpdate(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {


		Categories category = new Categories();
		model.addAttribute("category",category);
		return "administrator/categoryAddOrUpdate"; // -> đường dẫn tới View.
	}
	@RequestMapping(value = { "/admin/category/addOrUpdate" }, method = RequestMethod.POST)
	public String adminProductAddOrUpdate(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @ModelAttribute("category") Categories newCategory // spring-form biding với product model
	) throws Exception {
		System.out.println(newCategory.getParentId().getId());
		Categories category = new Categories();
		for (Categories ca : categoryParent().getData()) {
			System.out.println(ca.getId());
			if (newCategory.getParentId().getId()!= ca.getId()) {
				System.out.println("1234");
				category.setName(newCategory.getName());
				category.setDescription(newCategory.getDescription());
				category.setStatus(newCategory.getStatus());
				category.setCreatedDate(new Date());
				category.setSeo(Utilities.slugify(newCategory.getName()));
			}else {
				System.out.println("abcde");
				System.out.println(newCategory.getName() +newCategory.getStatus());
				String sql ="SELECT * FROM balotshop.tbl_category where tbl_category.name = '"+newCategory.getName()+"';";
				System.out.println(sql);
				category =categoryService.getByTransactQuerySQL(sql);
				
				if (category == null) { //Nếu không có thì tạo mới category
					category = new Categories();
					category.setName(newCategory.getName());
					category.setDescription(newCategory.getDescription());
					category.setStatus(newCategory.getStatus());
					category.setCreatedDate(new Date());
					category.setSeo(Utilities.slugify(newCategory.getName()));
					category.setParentId(newCategory.getParentId());
				} else { //Nếu có thì chỉnh sửa
					category.setName(newCategory.getName());
					category.setDescription(newCategory.getDescription());
					category.setStatus(newCategory.getStatus());
					category.setUpdatedDate(new Date());
					category.setSeo(Utilities.slugify(newCategory.getName()));
					category.setParentId(newCategory.getParentId());
				}
			}
		}
		
		
		categoryService.saveOrUpdate(category);
		// MVC được cấu hình chỉ định vào thư mục /src/main/webapp/WEB-INF/views
		// để tìm các views
		// /WEB-INF/views/user/index.jsp
		return getAdminProductList(model, request, response); // đường dẫn tới View.
	}
	@RequestMapping(value = { "/admin/category/edit/{categoryId}" }, method = RequestMethod.GET)
	public String adminCategotyEdit(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("categoryId") int categoryId) throws IOException {

		// gửi danh sách categories xuống view
		Categories category = categoryService.getById(categoryId);
		model.addAttribute("category",category);
		// MVC được cấu hình chỉ định vào thư mục /src/main/webapp/WEB-INF/views
		// để tìm các views
		// /WEB-INF/views/user/index.jsp
		return "administrator/categoryAddOrUpdate"; // -> đường dẫn tới View.
	}
	@RequestMapping(value = { "/admin/category/delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxDeletecategoryById(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody Categories categories){
		System.out.println(categories.getId());
		Categories category =categoryService.getById(categories.getId());
		System.out.println(category.getStatus());
		if (category!=null) {
			category.setStatus(false);
			categoryService.saveOrUpdate(category);
		}
		
		System.out.println(category.getStatus());
//		categoryService.deleteById(categories.getId());
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",categories);
		return ResponseEntity.ok(jsonResult);
	}
	@RequestMapping(value = { "/admin/category/{seo}" }, method = RequestMethod.GET)
	public String getCategory(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response
			,@PathVariable("seo") String seo)
			throws IOException {
//		System.out.println(seo);
		CategorySearchModel categorySearchModel = new CategorySearchModel();
		categorySearchModel.setSeo(seo);

//		System.out.println(categorySearchModel);
		Categories categories = categoryService.search(categorySearchModel).getData().get(0);
		System.out.println(categories.getId());
		ProductSearchModel productSearchModel = new ProductSearchModel();
		productSearchModel.setCategoryId(categories.getId());

//		System.out.println(productService.search(productSearchModel));
		model.addAttribute("productWithPaging",productService.searchByParentID(productSearchModel));
//		CategorySearchModel searchModel = new CategorySearchModel();
		productSearchModel.setKeyword(request.getParameter("keyword"));
		productSearchModel.setPage(getCurrentPage(request));
		productSearchModel.setCategoryId(getInterger(request, "categoryId"));
		model.addAttribute("searchModel",productSearchModel);
		return "administrator/productList"; // -> đường dẫn tới View

	}
}
