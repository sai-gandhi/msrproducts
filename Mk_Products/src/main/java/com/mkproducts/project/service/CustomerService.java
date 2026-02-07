package com.mkproducts.project.service;

import java.util.List;


import org.springframework.stereotype.Service;

import com.mkproducts.project.model.Contactus;
import com.mkproducts.project.model.Customer;
import com.mkproducts.project.model.Feedback;
import com.mkproducts.project.model.MarketRate;

import com.mkproducts.project.model.Order;
import com.mkproducts.project.model.OrderItem;
import com.mkproducts.project.model.Product;
@Service
public interface CustomerService {

	Customer checkCustomerLogin(String email, String password);

	String addContactus(Contactus c);
	
	String addFeedback(Feedback c);

	List<MarketRate> viewAllRates();

	String saveCustomer(Customer customer);

	List<Product> viewAllProducts();

	Product displayProductiByIds(int id);

	List<Feedback> getAllFeedbacks();
	
	Feedback getFeedbackById(int id);
	
	
	
	
	
	List<Product> getAllAvailableProducts();
    String placeOrder(Order order, List<OrderItem> items);
    List<Order> getCustomerOrders(Customer customer);
    Order getOrderById(int orderId);
//    List<Notification> getCustomerNotifications(Customer customer);
//    void markNotificationAsRead(int notificationId);
    void updateProductStock(Product product, int quantity);

	



}
