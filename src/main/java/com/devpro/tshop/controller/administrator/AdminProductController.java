package com.devpro.tshop.controller.administrator;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.tshop.controller.BaseController;
import com.devpro.tshop.dto.ProductSearchModel;
import com.devpro.tshop.entities.Products;
import com.devpro.tshop.services.CategoryService;
import com.devpro.tshop.services.ProductService;

@Controller // -> đây là 1 BEAN cho loại CONTROLLER.
public class AdminProductController extends BaseController{

	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;

	/**
	 * danh sách sản phẩm.
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	/// định nghĩa action
	@RequestMapping(value = { "/admin/product/list" }, method = RequestMethod.GET)
	public String getAdminProductList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {

//		List<Products> products = productService.findAll();
//
//		// gửi danh sách products xuống views
//		model.addAttribute("productWithPaging", products);
//		
//		System.out.println(request.getParameter("categoryId"));
//		//phân trang
		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.setKeyword(request.getParameter("keyword"));
		searchModel.setPage(getCurrentPage(request));
		searchModel.setCategoryId(getInterger(request, "categoryId"));
		model.addAttribute("productWithPaging",productService.search(searchModel));
		model.addAttribute("searchModel",searchModel);
		// MVC được cấu hình chỉ định vào thư mục /src/main/webapp/WEB-INF/views
		// để tìm các views
		// /WEB-INF/views/user/index.jsp
		return "administrator/productList"; // -> đường dẫn tới View.
	}

	/// định nghĩa action
	@RequestMapping(value = { "/admin/product/edit/{productId}" }, method = RequestMethod.GET)
	public String adminProductEdit(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("productId") int productId) throws IOException {

		// gửi danh sách categories xuống view
		model.addAttribute("categories", categoryService.findAll());
		
		Products product = productService.getById(productId);
		
		// gửi products xuống views
		model.addAttribute("product", product);

		// MVC được cấu hình chỉ định vào thư mục /src/main/webapp/WEB-INF/views
		// để tìm các views
		// /WEB-INF/views/user/index.jsp
		return "administrator/productAddOrUpdate"; // -> đường dẫn tới View.
	}

	/**
	 * Thêm mới sản phẩm.
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	/// định nghĩa action
	@RequestMapping(value = { "/admin/product/addOrUpdate" }, method = RequestMethod.GET)
	public String adminProductAddOrUpdate(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {

		// gửi danh sách categories xuống view
//		model.addAttribute("categories", categoryService.findAll());

		// gửi product mới xuống view
		model.addAttribute("product", new Products());
		
		// MVC được cấu hình chỉ định vào thư mục /src/main/webapp/WEB-INF/views
		// để tìm các views
		// /WEB-INF/views/user/index.jsp
		return "administrator/productAddOrUpdate"; // -> đường dẫn tới View.
	}

	/**
	 * Thêm mới sản phẩm
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @param product
	 * @return
	 * @throws Exception
	 */
	/// định nghĩa action
	@RequestMapping(value = { "/admin/product/addOrUpdate" }, method = RequestMethod.POST)
	public String adminProductAddOrUpdate(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @ModelAttribute("product") Products product, // spring-form biding với
																							// product model
			@RequestParam("productAvatar") MultipartFile productAvatar, // hứng file đẩy lên
			@RequestParam("productPictures") MultipartFile[] productPictures // hứng file đẩy lên
	) throws Exception {
		
		// cần kiểm tra xem id của product
		// = null || = 0 thì thêm mới
		// ngược lại là chỉnh sửa
		if(product.getId() == null || product.getId() <= 0) { // thêm mới
			System.out.println(product.getIsHot());
			productService.add(product, productAvatar, productPictures);
		} else { //chỉnh sửa
			System.out.println(product.getIsHot());
			productService.update(product, productAvatar, productPictures);
		}
		
		// MVC được cấu hình chỉ định vào thư mục /src/main/webapp/WEB-INF/views
		// để tìm các views
		// /WEB-INF/views/user/index.jsp
		return getAdminProductList(model, request, response); // đường dẫn tới View.
	}
	@RequestMapping(value = { "/admin/product/delete" }, method = RequestMethod.GET)
	public String getAdminProductdelete(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("productId") int productId) throws IOException {

//		// gửi danh sách categories xuống view
//		model.addAttribute("categories", categoryService.findAll());
//		
//		Products product = productService.getById(productId);
//		
//		// gửi danh sách products xuống views
//		model.addAttribute("product", product);

		// MVC được cấu hình chỉ định vào thư mục /src/main/webapp/WEB-INF/views
		// để tìm các views
		// /WEB-INF/views/user/index.jsp
		return getAdminProductList(model, request, response); // -> đường dẫn tới View.
	}
	@RequestMapping(value = { "/admin/product/delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxDeleteProductById(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody Products p){
		Products products = productService.getById(p.getId());
		products.setStatus(false);
		productService.saveOrUpdate(products);
//		productService.deleteById(p.getId());
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",p);
		return ResponseEntity.ok(jsonResult);
		
		//chưa xong
	}
}