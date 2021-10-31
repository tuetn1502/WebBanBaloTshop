package com.devpro.tshop.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.tshop.dto.ProductSearchModel;
import com.devpro.tshop.entities.Users;
import com.devpro.tshop.services.PagerData;
import com.devpro.tshop.services.ProductService;
import com.devpro.tshop.services.RolesService;
import com.devpro.tshop.services.UsersService;

@Controller
public class LoginController extends BaseController {
	@Autowired
	private UsersService usersService;
	
	@Autowired
	private ProductService productService;
	@RequestMapping(value = {"/login"}, method = RequestMethod.GET)
	public String login(final Model model,final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
				return "login";
		
	}
	@RequestMapping(value = {"/logout"}, method = RequestMethod.GET)
	public String logout(final Model model,final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
				return "logout";
		
	}
	@RequestMapping(value = {"/signup"}, method = RequestMethod.GET)
	public String signup(final Model model,final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
			Users users =new Users();
			model.addAttribute("users",users);
			String alertString="";
			model.addAttribute("alert",alertString);
				return "customer/signup";
		
	}
	@RequestMapping(value = {"/signup"}, method = RequestMethod.POST)
	public String post_signup(final Model model,final HttpServletRequest request,
			final HttpServletResponse response) throws IOException, ParseException{
			Users users =new Users();
			String fullname =request.getParameter("fullname");
			String birthday =request.getParameter("birthday");
			Date date = new SimpleDateFormat("yyyy-MM-dd").parse(birthday);
			String gender =request.getParameter("gender");
			String address =request.getParameter("address");
			String email =request.getParameter("email");
			String username =request.getParameter("username");
			String password =request.getParameter("password");
			String rePassword =request.getParameter("rePassword");
			String phone =request.getParameter("phone");
			System.out.println(username+" "+email);
			Users userTest1 =usersService.getByTransactQuerySQL("SELECT * FROM balotshop.tbl_users where tbl_users.username = '"+username+"';");
			System.out.println("a1"+userTest1);
			Date curDate =new Date();
			if (userTest1 ==null) {
				Users userTest2  =usersService.getByTransactQuerySQL("SELECT * FROM balotshop.tbl_users where  tbl_users.email = '"+email+"';");
//				PagerData<Users> userTest2  =usersService.runTransactQuerySQL("SELECT * FROM balotshop.tbl_users where  tbl_users.email = '"+email+"';",0);
				System.out.println("a2"+userTest2);
				if (userTest2 == null) {
					if (rePassword.equals(password)) {
						users.setAddress(address);
						users.setBirthday(date);
						users.setEmail(email);
						users.setFullname(fullname);
						users.setGender(gender);
						users.setPhone(phone);
						users.setUsername(username);
						users.setStatus(true);
						users.setPassword(new BCryptPasswordEncoder(13).encode(password));
						users.setCreatedDate(curDate);
						
						usersService.registerDefaultUser(users);
						ProductSearchModel productSearchModel = new ProductSearchModel();
						model.addAttribute("productWithPaging",productService.searchHotProduct(productSearchModel));
						return "customer/homepage";
					} else {
						model.addAttribute("alert","Mật khẩu không trùng khớp!");
						return "customer/signup";
					}	
				}else {
					model.addAttribute("alert","Tài khoản email đã tồn tại!");
					return "customer/signup";
				}
				
			} else {
				model.addAttribute("alert","Tên đăng nhập đã tồn tại!");
				return "customer/signup";
			}
					
				
		
	}
	
}
