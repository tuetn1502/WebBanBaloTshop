package com.devpro.tshop.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.devpro.tshop.entities.Users;

@Service
public class UsersService extends BaseService<Users>{

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


}
