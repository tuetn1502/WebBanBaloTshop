package com.devpro.tshop.entities;

import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@Table(name = "tbl_users")
public class Users extends BaseEntity implements UserDetails{
	@Column(name = "username", length = 45, nullable = false)
	private String  username;
	
	@Column(name = "password", length = 100, nullable = false)
	private String password;
	@Column(name = "fullname", length = 4500, nullable = true)
	private String  fullname;
	@Column(name = "birthday", nullable = true)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;
	@Column(name = "gender", length = 10, nullable = true)
	private String gender;
	@Column(name = "address", length = 200, nullable = true)
	private String address;
	@Column(name = "phone", length = 15, nullable = true)
	private String phone;
	@Column(name = "email", length = 100, nullable = false)
	private String email;
	@Column(name = "owner", nullable = true)
	private Boolean owner;
	
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "users")
	
	private Set<Roles> roles = new HashSet<Roles>();

	public void addRoles(Roles role) {
		role.getUsers().add(this);
		roles.add(role);
	}
	public void deleteRole(Roles role) {
		role.getUsers().remove(this);
		roles.remove(role);
	}
	
	public Set<Roles> getRoles() {
		return roles;
	}
	public void setRoles(Set<Roles> roles) {
		this.roles = roles;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Boolean getOwner() {
		return owner;
	}
	public void setOwner(Boolean owner) {
		this.owner = owner;
	}
	/**
	 * GrantedAuthority chính là Entity Roles
	 */
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return this.roles;
	}
	
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	
	@Override
	public boolean isEnabled() {
		return true;
	}
	
}
