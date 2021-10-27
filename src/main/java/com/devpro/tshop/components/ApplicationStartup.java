package com.devpro.tshop.components;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import com.devpro.tshop.entities.Categories;
import com.devpro.tshop.entities.Products;
import com.devpro.tshop.services.CategoryService;
import com.devpro.tshop.services.ContactService;
import com.devpro.tshop.services.ProductService;

@Component // bean
public class ApplicationStartup implements ApplicationListener<ApplicationReadyEvent> {

	@Autowired // inject 1 bean vào trong 1 bean khác
	private CategoryService categoryService;
	private ContactService contactService;
	
	/**
	 * khi ứng dụng chạy xong sẽ chạy vào hàm này.
	 */
	@Override
	public void onApplicationEvent(final ApplicationReadyEvent event) {	
		
		
	}
	
//	@SuppressWarnings("null")
//	private void seedCategory() {
//		//tìm kiếm cateJava có trong db không?
//		Categories cateJava =categoryService.getByTransactQuerySQL("SELECT * FROM tshop.tbl_category where tbl_category.name = 'Java1';");
//		
//		if (cateJava == null) { //Nếu không có thì tạo mới category
//			System.out.println("java1");
//			cateJava = new Categories();
//			cateJava.setName("Java1");
//			cateJava.setDescription("Java");
//			cateJava.setCreatedDate(new Date());
//			Products p =new Products();
//			p.setTitle("Sản phẩm 1");
//			p.setPrice(new BigDecimal("100000"));
//			p.setDetailDescription("Chi tiết sản phẩm");
//			p.setShortDescription("là sản phẩm....");
//			p.setCreatedDate(new Date());
//			cateJava.addProduct(p);
//			
//			//xem lại chưa thêm dc sp
//		} else { //Nếu có thì chỉnh sửa
//			cateJava.setUpdatedDate(new Date());
//			System.out.println("java2");
//		}
//		categoryService.saveOrUpdate(cateJava);
//	}
}
