package com.devpro.tshop.services;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.devpro.tshop.entities.Roles;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	UsersService userService;
	
	/**
	 * UserDetails chính là Entiy User.
	 */
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		return userService.loadUserByUsername(username);
	}
	private Set<Roles> roles = new HashSet<Roles>();
    
}
