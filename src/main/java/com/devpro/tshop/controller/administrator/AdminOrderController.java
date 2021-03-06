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
import com.devpro.tshop.entities.Products;
import com.devpro.tshop.entities.SaleOrder;
import com.devpro.tshop.entities.SaleOrderProducts;
import com.devpro.tshop.services.ProductService;
import com.devpro.tshop.services.SaleOrderProductsService;
import com.devpro.tshop.services.SaleOrderService;

@Controller
public class AdminOrderController  extends BaseController{
	@Autowired
	private SaleOrderService saleOrderService;
	@Autowired
	private ProductService productService;
	@Autowired
	private SaleOrderProductsService saleOrderProductsService;
	@RequestMapping(value = {"/admin/saleOrder/list"}, method = RequestMethod.GET)
	public String adminhomepage(final Model model,final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
		List<SaleOrder> saleOrderList = saleOrderService.findAll();
		model.addAttribute("saleOrderList",saleOrderList);
		List<SaleOrderProducts> saleOrderProducts = saleOrderProductsService.findAll();
		model.addAttribute("saleOrderProducts",saleOrderProducts);
		List<Products> pList = productService.findAll();
		model.addAttribute("pList",pList);
		return "administrator/saleOrder";
		
	}
}
