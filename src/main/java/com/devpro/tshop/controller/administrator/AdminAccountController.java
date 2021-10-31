package com.devpro.tshop.controller.administrator;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.tshop.controller.BaseController;
import com.devpro.tshop.dto.ProductSearchModel;
import com.devpro.tshop.dto.UserSearchModel;
import com.devpro.tshop.entities.Roles;
import com.devpro.tshop.entities.Users;
import com.devpro.tshop.services.UsersService;

import net.bytebuddy.asm.Advice.This;
import net.bytebuddy.implementation.bind.annotation.Super;

@Controller
public class AdminAccountController  extends BaseController{
	@Autowired
	private UsersService usersService;
//	@RequestMapping(value = {"/admin/account/list"}, method = RequestMethod.GET)
//	public String adminhomepage(final Model model,final HttpServletRequest request,
//			final HttpServletResponse response) throws IOException{
//		List<Users> userList = usersService.findAll();
//		model.addAttribute("userList",userList);
//				return "administrator/accountList";
//		
//	}
	@RequestMapping(value = { "/admin/account/{seo}" }, method = RequestMethod.GET)
	public String getAccount(final Model model, final HttpServletRequest request, final HttpServletResponse response
			,@PathVariable("seo") String seo)
			throws IOException {
		System.out.println(seo);
		UserSearchModel userSearchModel =new UserSearchModel();
//		userSearchModel.setRoleName(seo);
		Set<Users> userList =null;
		Set<Roles> roleUsers =new HashSet<Roles>(roleUsers().getData());
//		
		for (Roles roles : super.roleUsers().getData()) {
			if (seo.equals(roles.getName())) {
				System.out.println(roles.getId());
				userList =roles.getUsers();
			}
		}
		System.out.println(userList);
		model.addAttribute("userList",userList);
		model.addAttribute("seo",seo);
		model.addAttribute("roleUsersSet",roleUsers);
		return "administrator/accountList"; // -> đường dẫn tới View

	}
	@RequestMapping(value = { "/admin/account/delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajaxDeletecategoryById(final Model model
			,final HttpServletRequest request
			,final HttpServletResponse response
			,final @RequestBody Users users){
		System.out.println(users.getId());
		Users user = usersService.getById(users.getId());
		user.setStatus(false);
		usersService.saveOrUpdate(user);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code",200);
		jsonResult.put("message",users);
		return ResponseEntity.ok(jsonResult);
	}
	@RequestMapping(value = { "/admin/account/addOrUpdate" }, method = RequestMethod.GET)
	public String adminProductAddOrUpdate(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		model.addAttribute("roleUserList",super.roleUsers().getData());
		Users users = new Users();
		model.addAttribute("users",users);
		return "administrator/addAccountUser"; // -> đường dẫn tới View.
	}
	@RequestMapping(value = { "/admin/account/addOrUpdate" }, method = RequestMethod.POST)
	public String adminProductAddOrUpdate(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @ModelAttribute("users") Users users // spring-form biding với product model
	) throws Exception {
		String roleUser = request.getParameter("role");
		String rePassword = request.getParameter("rePassword");
		Date date =new Date();
		System.out.println(users.getBirthday()+ users.getFullname()+users.getGender()+ roleUser+rePassword);
		Users userTest1 =usersService.getByTransactQuerySQL("SELECT * FROM balotshop.tbl_users where tbl_users.username = '"+users.getUsername()+"';");
		System.out.println("a1"+userTest1);
		if (userTest1 ==null) {
			Users userTest2  =usersService.getByTransactQuerySQL("SELECT * FROM balotshop.tbl_users where  tbl_users.email = '"+users.getEmail()+"';");
			System.out.println("a2"+userTest2);
			if (userTest2 == null) {
				if (rePassword.equals(users.getPassword())) {
					users.setAddress(users.getAddress());
					users.setBirthday(users.getBirthday());
					users.setEmail(users.getEmail());
					users.setFullname(users.getFullname());
					users.setGender(users.getGender());
					users.setPhone(users.getPhone());
					users.setUsername(users.getUsername());
					users.setStatus(true);
					users.setCreatedDate(date);
					users.setPassword(new BCryptPasswordEncoder(13).encode(users.getPassword()));
					
					usersService.addUser(users,roleUser);
					return getAccount(model, request, response, roleUser);
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
		 // đường dẫn tới View.
	}
}
