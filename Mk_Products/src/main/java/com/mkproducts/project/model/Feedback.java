package com.mkproducts.project.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="feedback")
public class Feedback {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="customer_id",nullable = false,length = 50)
	private int id;
	@Column(name="customer_name",nullable = false,length = 50)
	private String name;
	@Column(name="customer_contact",nullable = false,length = 10)
	private String contact;
	@Column(name="products",nullable = false,length = 200)
	private String products;
	@Column(name="crop",nullable = false,length = 50)
	private String crop;
	@Column(name="userstory",nullable = false,length = 500)
	private String userstory;
	
	@Column(name="product_image", nullable = false)
	private Blob image;
	
	
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
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getProducts() {
		return products;
	}
	public void setProducts(String products) {
		this.products = products;
	}
	public String getCrop() {
		return crop;
	}
	public void setCrop(String crop) {
		this.crop = crop;
	}
	public String getUserstory() {
		return userstory;
	}
	public void setUserstory(String userstory) {
		this.userstory = userstory;
	}
	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}
	

}
