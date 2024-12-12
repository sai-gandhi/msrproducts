package com.mkproducts.project.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="Admin_Table")
public class Admin {
	
	@Id
	@Column(name="Admin_name",nullable = false,length = 50)
	private String name;
	@Column(name="Admin_password",nullable = false,length = 15)
	private String password;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

}
