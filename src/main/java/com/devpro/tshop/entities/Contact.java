package com.devpro.tshop.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_contact")
public class Contact extends BaseEntity {
	@Column(name = "fullname", length = 45, nullable = false)
	private String fullname;
	

	
	@Column(name = "email", length = 45, nullable = false)
	private String email;
	
	@Column(name = "request_type", length = 45, nullable = false)
	private String requestType;
	
	@Column(name = "message", length = 1000, nullable = false)
	private String message;

	

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRequestType() {
		return requestType;
	}

	public void setRequestType(String requestType) {
		this.requestType = requestType;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
}
