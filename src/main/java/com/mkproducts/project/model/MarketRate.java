package com.mkproducts.project.model;

import jakarta.persistence.Column;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="Market-Rate_Table")
public class MarketRate {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="product_ID",nullable = false,length=50)
	private int id;
	@Column(name="product_name",nullable = false,length=15)
	private String productname;
	@Column(name="date",nullable = false,length=15)
	private String date;
	@Column(name="product_maxrate",nullable = false,length=15)
	private String maxrate;
	@Column(name="product_avgrate",nullable = false,length=15)
	private String avgrate;
	@Column(name="product_minrate",nullable = false,length=15)
	private String minrate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getMaxrate() {
		return maxrate;
	}
	public void setMaxrate(String maxrate) {
		this.maxrate = maxrate;
	}
	public String getAvgrate() {
		return avgrate;
	}
	public void setAvgrate(String avgrate) {
		this.avgrate = avgrate;
	}
	public String getMinrate() {
		return minrate;
	}
	public void setMinrate(String minrate) {
		this.minrate = minrate;
	}
	

}

