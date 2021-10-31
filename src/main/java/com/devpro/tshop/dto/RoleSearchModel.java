package com.devpro.tshop.dto;

public class RoleSearchModel {
	private Integer idRole;
	private String roleName;
	private int page;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	public Integer getIdRole() {
		return idRole;
	}
	public void setIdRole(Integer idRole) {
		this.idRole = idRole;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	@Override
	public String toString() {
		return "UserSearchModel [idRole=" + idRole + ", roleName=" + roleName + "]";
	}
	
}
