package com.devpro.tshop.services;

import org.springframework.stereotype.Service;

import com.devpro.tshop.entities.Roles;

@Service
public class RolesService extends BaseService<Roles>{

	@Override
	protected Class<Roles> clazz() {
		// TODO Auto-generated method stub
		return Roles.class;
	}

}
