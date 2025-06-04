package com.mkproducts.project.service;

import java.util.List;

import com.mkproducts.project.model.Admin;
import com.mkproducts.project.model.Contactus;
import com.mkproducts.project.model.MarketRate;
import com.mkproducts.project.model.Order;
import com.mkproducts.project.model.Product;

public interface AdminService {
    // Authentication
    Admin checkAdminLogin(String name, String password);
    
    // Product Management
    String addProduct(Product product);
    String updateProduct(Product product);
    List<Product> viewAllProduct();
    Product displayProductiById(int id);
    void deleteProduct(int id);
    
    // Contact Management
    List<Contactus> viewAllContacts();
    Contactus displayImageById(int id);
    void deleteContact(int id);
    
    // Market Rate Management
    String addRates(MarketRate r);
    MarketRate displayProductById(int id);
    void deleteMarketrate(int id);
    
    // Order Management
    List<Order> getPendingOrders();
    List<Order> getProcessedOrders();
    Order getOrderById(int id);
    void updateOrderStatus(int orderId, String status, String message);
}