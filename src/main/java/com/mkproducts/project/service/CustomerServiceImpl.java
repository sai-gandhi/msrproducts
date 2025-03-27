package com.mkproducts.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkproducts.project.model.Contactus;
import com.mkproducts.project.model.Customer;
import com.mkproducts.project.model.Feedback;
import com.mkproducts.project.model.MarketRate;
import com.mkproducts.project.model.Product;
import com.mkproducts.project.repository.ContactusRepository;
import com.mkproducts.project.repository.CustomerRepository;
import com.mkproducts.project.repository.FeedbackRepository;
import com.mkproducts.project.repository.MarketRateRepository;
import com.mkproducts.project.repository.ProductRepository;

@Service
public class CustomerServiceImpl implements CustomerService{
	
	@Autowired
	private CustomerRepository customerRepository;
	@Autowired
	private ContactusRepository contactusRepository;
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private MarketRateRepository marketRateRepository;
	
	@Autowired
	private FeedbackRepository feedbackRepository;

	@Override
	public Customer checkCustomerLogin(String email, String password) {
		
		return customerRepository.checkCustomerLogin(email, password);
	}

	@Override
	public String addContactus(Contactus c) {
		 contactusRepository.save(c);
		 return "Product Added Successfully";
	}

	@Override
	public List<MarketRate> viewAllRates() {
		return marketRateRepository.findAll();
	}

	@Override
	public String saveCustomer(Customer customer) {
		customerRepository.save(customer);
		return "Customer Registaration Success";
	}

	@Override
	public List<Product> viewAllProducts() {
		return productRepository.findAll();
	}

	@Override
	public Product displayProductiByIds(int id) {
		return productRepository.findById(id).get();
	}

	@Override
	public String addFeedback(Feedback c) {
		feedbackRepository.save(c);
		
		return "Feedback is saved";
	}

}
