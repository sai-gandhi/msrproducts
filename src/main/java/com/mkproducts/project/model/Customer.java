package com.mkproducts.project.model;



import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="Customer_Table")

public class Customer {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="customer_id",nullable = false,length = 50)
	private int id;
	@Column(name="customer_name",nullable = false,length = 50)
	private String name;
	@Column(name="customer_email",unique=true,nullable = false,length = 55)
	private String email;
	@Column(name="customer_password",nullable = false,length = 15)
	private String password;
	@Column(name="customer_location",nullable = false,length = 50)
	private String location;
	@Column(name="customer_contact",unique = true, nullable = false , length = 10)
	private String contact;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	
	

}
