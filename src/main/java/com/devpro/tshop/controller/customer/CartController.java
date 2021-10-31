package com.devpro.tshop.controller.customer;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.tshop.controller.BaseController;
import com.devpro.tshop.dto.Cart;
import com.devpro.tshop.dto.CartItem;
import com.devpro.tshop.entities.Products;
import com.devpro.tshop.entities.SaleOrder;
import com.devpro.tshop.entities.SaleOrderProducts;
import com.devpro.tshop.entities.Users;
import com.devpro.tshop.services.ProductService;
import com.devpro.tshop.services.SaleOrderService;
@Controller
public class CartController extends BaseController{
	@Autowired
	private ProductService productService;
	
	@Autowired
	private SaleOrderService saleOrderService;
	private void calculateTotalPrice(final HttpServletRequest request) {

		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		//lấy danh sách sản phẩm trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();

		BigDecimal total = BigDecimal.ZERO;
		for (CartItem item : cartItems) {
			total = total.add(item.getPriceUnit().multiply(BigDecimal.valueOf(item.getQuality())));
		}
		cart.setTotalPrice(total);
	}
	private int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int totalItems = 0;
		for (CartItem item : cartItems) {
			totalItems += item.getQuality();
		}

		return totalItems;
	}
	
	@RequestMapping(value = { "/ajax/addToCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_AddToCart(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody CartItem cartItem) {

		// để lấy session sử dụng thông qua request
		// session tương tự như kiểu Map và được lưu trên main memory.
		HttpSession session = request.getSession();

		// Lấy thông tin giỏ hàng.
		Cart cart = null;
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// Lấy danh sách sản phẩm có trong giỏ hàng
		List<CartItem> cartItems = cart.getCartItems();
		System.out.println(cartItems.toString());
		// kiểm tra nếu có trong giỏ hàng thì tăng số lượng
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				isExists = true;
				item.setQuality(item.getQuality() + cartItem.getQuality());
			}
		}

		// nếu sản phẩm chưa có trong giỏ hàng
		if (!isExists) {
			Products productInDb = productService.getById(cartItem.getProductId());

			cartItem.setProductName(productInDb.getTitle());
			cartItem.setPriceUnit(productInDb.getPrice());
			cartItem.setAvatar(productInDb.getAvatar());

			cart.getCartItems().add(cartItem);
		}
		
		//Tính tổng tiền
		this.calculateTotalPrice(request);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));

		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}

	// định nghĩa action
	@RequestMapping(value = { "/cart/view" }, method = RequestMethod.GET)
	public String cartView(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		// đẩy thông báo xuống tầng view

		// MVC được cấu hình chỉ định vào thư mục /src/main/webapp/WEB-INF/views
		// để tìm các views
		// /WEB-INF/views/user/index.jsp
//		int total = getTotalItems(request);
//		model.addAttribute("total",total);
		return "customer/cart"; // -> đường dẫn tới View.
	}

	@RequestMapping(value = { "/ajax/deleteCartItems" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_DeleteItem(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody CartItem cartItem) {
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();
		System.out.println(cart.getTotalPrice());
		CartItem cartItem2 = null;
		for (CartItem cItems : cartItems) {
			if (cartItem.getProductId() == cItems.getProductId()) {
				cartItem2 = cItems;
				break;
			}
		}
		cart.getCartItems().remove(cartItem2);
		this.calculateTotalPrice(request);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("totalPrice", cart.getTotalPrice());
		System.out.println(cart.getTotalPrice());
		if (cart.getCartItems().isEmpty()) {
			session.removeAttribute("cart");
		}
		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
		
	}
	@RequestMapping(value = { "/cart/checkout" }, method = RequestMethod.GET)
	public String getCartCheckout(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		return "customer/checkout";
	}
	@RequestMapping(value = { "/cart/checkout" }, method = RequestMethod.POST)
	public String postCartCheckout(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {
		
		// Thông tin khách hàng
		String customerFullName = request.getParameter("customerFullName");
		String customerAddress = request.getParameter("customerAddress");
		String customerEmail = request.getParameter("customerEmail");
		String customerPhone = request.getParameter("customerPhone");
		String customerNote = request.getParameter("customerNote");
		
//		System.out.println(getUserLogined().getId()+" "+getUserLogined().getFullname());
		//tạo hóa đơn
		SaleOrder saleOrder = new SaleOrder();
		
		//kiểm tra khách hàng đã login hay chưa
		if (super.isLogined()) {
			Users userLogined = super.getUserLogined();
			saleOrder.setUser(userLogined);
			saleOrder.setCustomerName(userLogined.getFullname());
			saleOrder.setCustomerEmail(userLogined.getEmail());
			saleOrder.setCustomerAddress(userLogined.getAddress());
			saleOrder.setCustomerPhone(userLogined.getPhone());
		}else {
			saleOrder.setCustomerName(customerFullName);
			saleOrder.setCustomerEmail(customerEmail);
			saleOrder.setCustomerAddress(customerAddress);
			saleOrder.setCustomerPhone(customerPhone);
		}
		
		
//		saleOrder.setTotal();
		
		//mã hóa đơn
		saleOrder.setCode(String.valueOf(System.currentTimeMillis()));
		Date curDate = new Date();
		saleOrder.setCreatedDate(curDate);
		
//		if(getUserLogined() != null) {
//			
//		}
		
		//kết các sản phẩm trong giỏ hàng cho hóa đơn
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		int totalMoneyOfOrder = Integer.valueOf(cart.getTotalPrice().intValue()) +super.shipFee();
		
		BigDecimal total = new BigDecimal(totalMoneyOfOrder);
		System.out.println(total);
		
		saleOrder.setTotal(total);
		for(CartItem cartItem : cart.getCartItems()) {
			SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
			saleOrderProducts.setProduct(productService.getById(cartItem.getProductId()));
			saleOrderProducts.setQuality(cartItem.getQuality());
			saleOrderProducts.setCreatedDate(curDate);
			
			// sử dụng hàm tiện ích add hoặc remove đới với các quan hệ onetomany
			saleOrder.addSaleOrderProducts(saleOrderProducts);
		}
		
		//lưu vào cơ sở dữ liệu
		saleOrderService.saveOrUpdate(saleOrder);
		
		//xóa dữ liệu giỏ hàng trong session
		session.setAttribute("cart", null);
		session.setAttribute("totalItems", "0");
		
		return "redirect:/homepage";
	}
}
