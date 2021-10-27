package com.devpro.tshop.controller.customer;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.tshop.controller.BaseController;
import com.devpro.tshop.dto.CategorySearchModel;
import com.devpro.tshop.dto.ContactModel;
import com.devpro.tshop.dto.ProductSearchModel;
import com.devpro.tshop.entities.Categories;
import com.devpro.tshop.entities.Products;
import com.devpro.tshop.services.CategoryService;
import com.devpro.tshop.services.ProductService;

@Controller // là 1 BEAN cho loại Controller.
public class HomepageController extends BaseController{
	
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ProductService productService;
	// định nghĩa các action
	@RequestMapping(value = { "/homepage" }, method = RequestMethod.GET)
	public String home(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		ContactModel contactModel =new ContactModel();
		model.addAttribute("contactModel",contactModel);
		List<Products> products = productService.findAll();

		// gửi danh sách products xuống views
		model.addAttribute("productList", products);
//		HttpSession session = request.getSession();
//		session.setAttribute("totalItems", "0");
		return "customer/homepage"; // -> đường dẫn tới View

	}
	// MVC được cấu hình chỉ định vào thư muc /src/main/webapp/WEB-INF/views
	// để tìm các views
//	@RequestMapping(value = { "/homepage/{seo}" }, method = RequestMethod.GET)
//	public String home1(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response
//			,@PathVariable("seo")String seo)
//			throws IOException {
//		String name =request.getParameter("name");
//		System.out.println("name"+name);
//		System.out.println(seo);
//		return "customer/homepage"; // -> đường dẫn tới View
//
//	}
	@RequestMapping(value = { "/detail" }, method = RequestMethod.GET)
	public String getDetail(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		return "customer/details"; // -> đường dẫn tới View

	}
	@RequestMapping(value = { "/category" }, method = RequestMethod.GET)
	public String getCategory(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		return "customer/categoryProducts"; // -> đường dẫn tới View

	}
	@RequestMapping(value = {"/ajax/newsletter"},method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_contact(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody ContactModel contactModel){
		
		System.out.println("ContactModel[Email]:"+contactModel.getEmail());
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("message",contactModel);
		return ResponseEntity.ok(jsonResult);
		
	}
	@RequestMapping(value = { "/detail/{seo}" }, method = RequestMethod.GET)
	public String getDetail(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response
			,@PathVariable("seo") String seo)
			throws IOException {
		ProductSearchModel productSearchModel = new ProductSearchModel();
		productSearchModel.setSeo(seo);
		List<Products> products = productService.search(productSearchModel).getData();
		model.addAttribute("detailProduct",products.get(0));
		System.out.println();
		model.addAttribute("productSearchModel",productSearchModel);
		return "customer/details"; // -> đường dẫn tới View

	}
	@RequestMapping(value = { "/homepage/{seo}" }, method = RequestMethod.GET)
	public String getCategory(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response
			,@PathVariable("seo") String seo)
			throws IOException {
		CategorySearchModel categorySearchModel = new CategorySearchModel();
		categorySearchModel.setSeo(seo);
		Categories categories = categoryService.search(categorySearchModel).getData().get(0);
		ProductSearchModel productSearchModel = new ProductSearchModel();
		productSearchModel.setCategoryId(categories.getId());
		model.addAttribute("productWithPaging",productService.search(productSearchModel));
		return "customer/categoryProducts"; // -> đường dẫn tới View

	}
}

