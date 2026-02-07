package com.mkproducts.project.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mkproducts.project.model.Contactus;
import com.mkproducts.project.model.Customer;
import com.mkproducts.project.model.Feedback;
import com.mkproducts.project.model.MarketRate;

import com.mkproducts.project.model.Order;
import com.mkproducts.project.model.OrderItem;
import com.mkproducts.project.model.Product;
import com.mkproducts.project.repository.ContactusRepository;
import com.mkproducts.project.repository.CustomerRepository;
import com.mkproducts.project.repository.FeedbackRepository;
import com.mkproducts.project.repository.MarketRateRepository;
import com.mkproducts.project.repository.OrderItemRepository;
import com.mkproducts.project.repository.OrderRepository;
import com.mkproducts.project.repository.ProductRepository;

import jakarta.transaction.Transactional;

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
	
	
	
	@Autowired
    private OrderRepository orderRepository;
    
    @Autowired
    private OrderItemRepository orderItemRepository;

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

	@Override
	public List<Feedback> getAllFeedbacks() {
		
		return feedbackRepository.findAll();
	}

	@Override
	public Feedback getFeedbackById(int id) {
		
		return feedbackRepository.findById(id).get();
	}

	
	
	
	
    
    
    
    // Existing methods...
    
    @Override
    public List<Product> getAllAvailableProducts() {
        return productRepository.findByProductcountGreaterThan(0);
    }
    
    @Override
    @Transactional
    public String placeOrder(Order order, List<OrderItem> items) {
        // Save order
        Order savedOrder = orderRepository.save(order);
        
        // Save order items and update product stock
        for (OrderItem item : items) {
            item.setOrder(savedOrder);
            orderItemRepository.save(item);
            
            // Update product stock
            Product product = item.getProduct();
            int newStock = product.getProductcount() - item.getQuantity();
            product.setProductcount(newStock);
            productRepository.save(product);
        }
        
        return "Order placed successfully";
    }
    
    @Override
    public List<Order> getCustomerOrders(Customer customer) {
        return orderRepository.findByCustomer(customer);
    }
    
    @Override
    public Order getOrderById(int orderId) {
        return orderRepository.findById(orderId).orElse(null);
    }
    
//    @Override
//    public List<Notification> getCustomerNotifications(Customer customer) {
//        return notificationRepository.findByCustomerOrderByCreatedAtDesc(customer);
//    }
    
//    @Override
//    public void markNotificationAsRead(int notificationId) {
//        Notification notification = notificationRepository.findById(notificationId).orElse(null);
//        if (notification != null) {
//            notification.setIs_read(true);
//            notificationRepository.save(notification);
//        }
//    }
    
    @Override
    public void updateProductStock(Product product, int quantity) {
        int newStock = product.getProductcount() - quantity;
        product.setProductcount(newStock);
        productRepository.save(product);
    }
	

}
