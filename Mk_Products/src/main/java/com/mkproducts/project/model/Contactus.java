package com.mkproducts.project.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="Contact_Table")
public class Contactus {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="user_id", nullable = false, length = 55)
	private int id;
	@Column(name="user_name", nullable = false, length = 55)
	private String name;
	@Column(name="user_contact", nullable = false, length = 55)
	private String contact;
	@Column(name="user_location", nullable = false, length = 150)
	private String location;
	@Column(name="date", nullable = false, length = 55)
	private String date;
	@Column(name="user_message", nullable = false, length = 550)
	private String message;
	@Column(name="image", nullable = false)
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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}

}

