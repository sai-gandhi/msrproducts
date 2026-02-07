package com.mkproducts.project.model;

import java.sql.Blob;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="Product_Table")
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY )
	@Column(name="product_id", nullable = false,length=100)
	private int id;
	@Column(name="product_name", nullable = false,length=55)
	private String name;
	@Column(name="product_cost", nullable = false,length=20)
	private double cost;
	@Column(name="product_description", nullable = false,length=200)
	private String description;
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
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

}
