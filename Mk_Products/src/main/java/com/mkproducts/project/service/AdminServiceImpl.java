package com.mkproducts.project.service;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkproducts.project.model.Admin;
import com.mkproducts.project.model.Contactus;
import com.mkproducts.project.model.MarketRate;
import com.mkproducts.project.model.Product;
import com.mkproducts.project.repository.AdminRepository;
import com.mkproducts.project.repository.ContactusRepository;
import com.mkproducts.project.repository.MarketRateRepository;
import com.mkproducts.project.repository.ProductRepository;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private ContactusRepository contactusRepository;
	
	@Autowired
	private MarketRateRepository marketRateRepository;

	@Override
	public Admin checkAdminLogin(String name, String password) {
		return adminRepository.checkAdminLogin(name,password);
		
	}

	@Override
	public String addProduct(Product product) {
		 productRepository.save(product);
		 return "Product Added Successfully";
	}

	@Override
	public List<Product> viewAllProduct() {
		return productRepository.findAll();
	}
	
	
	@Override
	public Product displayProductiById(int id) {
		return productRepository.findById(id).get();
	}

	
	@Override
	public List<Contactus> viewAllContacts() {
		return contactusRepository.findAll();
	}
	
	@Override
	public Contactus displayImageById(int id) {
		return contactusRepository.findById(id).get();
	}

	@Override
	public String addRates(MarketRate r) {
		 marketRateRepository.save(r);
		 return "Product Added Successfully";
	}

	@Override
	public MarketRate displayProductById(int id) {
		return marketRateRepository.findById(id).get();
	}
	
	@Override
	public MarketRate updateRate(MarketRate marketRate) {
        return marketRateRepository.save(marketRate); // Save will update if the customer already exists
    }

	@Override
	public void deleteContact(int id) {
		contactusRepository.deleteById(id);
		
	}

	@Override
	public void deleteProduct(int id) {
		 productRepository.deleteById(id);
		
	}

}
