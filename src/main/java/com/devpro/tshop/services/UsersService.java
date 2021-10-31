package com.devpro.tshop.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.tshop.dto.CategorySearchModel;
import com.devpro.tshop.dto.UserSearchModel;
import com.devpro.tshop.entities.Categories;
import com.devpro.tshop.entities.Roles;
import com.devpro.tshop.entities.Users;

@Service
public class UsersService extends BaseService<Users>{
	@Autowired
	private RolesService rolesService;
	@Autowired
	 UsersService usersService;
	@Override
	protected Class<Users> clazz() {
		// TODO Auto-generated method stub
		return Users.class;
	}
	public Users loadUserByUsername(String userName) {
		String sql = "select * from tbl_users u where u.username = '" + userName + "'";
		List<Users> users = this.runTransactQuerySQL(sql, 0).getData();
		
		if(users == null || users.size() <= 0) return null;
		return users.get(0);
	}
	public void addUser(Users user,String name) {
		Roles roleUser = new Roles();
//		System.out.println(name);
		if (name == null) {
			roleUser =rolesService.getById(2);
		}else {
			List<Roles> rList =rolesService.findAll();
			for (Roles roles : rList) {
				if (roles.getName().equals(name)) {
					roleUser=roles;
					break;
				}
			}
		}
		
        user.addRoles(roleUser);
      
        usersService.saveOrUpdate(user);
    }
	public void registerDefaultUser(Users user) {
		Roles roleUser = new Roles();
		roleUser =rolesService.getById(2);
		
        user.addRoles(roleUser);
      
        usersService.saveOrUpdate(user);
    } 
	public PagerData<Users> search(UserSearchModel userSearchModel){
		//Khởi tạo câu truy vấn
		String sql = "SELECT * FROM balotshop.tbl_users uc WHERE 1=1";
		if (userSearchModel != null) {
			
			if (userSearchModel.getIdUser() != null) {
				sql += " and uc.user_id = "+userSearchModel.getIdUser();
			}
			if (!StringUtils.isEmpty(userSearchModel.getKeyword())) {
				sql += " and (uc.username like '%"+ userSearchModel.getKeyword()+"%'"+"or uc.fullname like '%"
						+ userSearchModel.getKeyword() +"%'"+"or uc.email like '%"+ userSearchModel.getKeyword()+"%'"+"or uc.phone like '%"+ userSearchModel.getKeyword()+ "%')";
			}
		}
		return runTransactQuerySQL(sql, userSearchModel ==null?0:userSearchModel.getPage());
		
	}

}
