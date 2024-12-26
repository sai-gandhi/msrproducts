package com.mkproducts.project.service;

import java.util.List;

import com.mkproducts.project.model.Admin;
import com.mkproducts.project.model.Contactus;
import com.mkproducts.project.model.MarketRate;
import com.mkproducts.project.model.Product;

public interface AdminService {
	public Admin checkAdminLogin(String name, String password);

	public String addProduct(Product product);

	public List<Product> viewAllProduct();

	public Product displayProductiById(int id);

	public List<Contactus> viewAllContacts();

	public Contactus displayImageById(int id);

	public String addRates(MarketRate r);

	public MarketRate displayProductById(int id);

	public void deleteContact(int id);

	public void deleteProduct(int id);

	public void deleteMarketrate(int id);
}
