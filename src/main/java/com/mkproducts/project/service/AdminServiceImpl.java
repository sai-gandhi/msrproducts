package com.mkproducts.project.service;

import java.util.List;


import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mkproducts.project.model.Admin;
import com.mkproducts.project.model.Contactus;
import com.mkproducts.project.model.Customer;
import com.mkproducts.project.model.MarketRate;
import com.mkproducts.project.model.Order;
import com.mkproducts.project.model.OrderItem;
import com.mkproducts.project.model.Product;
import com.mkproducts.project.model.OrderStatus;
import com.mkproducts.project.repository.AdminRepository;
import com.mkproducts.project.repository.ContactusRepository;
import com.mkproducts.project.repository.CustomerRepository;
import com.mkproducts.project.repository.MarketRateRepository;
import com.mkproducts.project.repository.OrderItemRepository;
import com.mkproducts.project.repository.OrderRepository;
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
    
    @Autowired
    private OrderRepository orderRepository;
    
    @Autowired
    private OrderItemRepository orderItemRepository;
    
    @Autowired
    private CustomerRepository customerRepository;

    // Authentication
    @Override
    public Admin checkAdminLogin(String name, String password) {
        return adminRepository.checkAdminLogin(name, password);
    }

    // Product Management
    @Override
    @Transactional
    public String addProduct(Product product) {
        productRepository.save(product);
        return "Product Added Successfully";
    }

    @Override
    @Transactional
    public String updateProduct(Product product) {
        productRepository.save(product);
        return "Product Updated Successfully";
    }

    @Override
    public List<Product> viewAllProduct() {
        return productRepository.findAll();
    }
    
    @Override
    public Product displayProductiById(int id) {
        return productRepository.findById(id).orElse(null);
    }

   

    // Contact Management
    @Override
    public List<Contactus> viewAllContacts() {
        return contactusRepository.findAll();
    }
    
    @Override
    public Contactus displayImageById(int id) {
        return contactusRepository.findById(id).orElse(null);
    }

    @Override
    @Transactional
    public void deleteContact(int id) {
        contactusRepository.deleteById(id);
    }

    // Market Rate Management
    @Override
    @Transactional
    public String addRates(MarketRate r) {
        marketRateRepository.save(r);
        return "Market Rate Added Successfully";
    }

    @Override
    public MarketRate displayProductById(int id) {
        return marketRateRepository.findById(id).orElse(null);
    }
    
    @Override
    @Transactional
    public void deleteMarketrate(int id) {
        marketRateRepository.deleteById(id);
    }

    // Order Management Methods
    
    @Override
    public List<Order> getPendingOrders() {
        return orderRepository.findByStatus(OrderStatus.PENDING.toString());
    }

    @Override
    public List<Order> getProcessedOrders() {
        return orderRepository.findAll().stream()
                .filter(order -> !order.getStatus().equals(OrderStatus.PENDING.toString()))
                .collect(Collectors.toList());
    }

    @Override
    public Order getOrderById(int id) {
        Order order = orderRepository.findById(id).orElse(null);
        if (order != null) {
            List<OrderItem> items = orderItemRepository.findByOrder(order);
            order.setItems(items);
        }
        return order;
    }

    @Override
    @Transactional
    public void updateOrderStatus(int orderId, String status, String message) {
        Order order = orderRepository.findById(orderId).orElse(null);
        if (order != null) {
            String previousStatus = order.getStatus();
            order.setStatus(status);
            orderRepository.save(order);
            
            if (OrderStatus.APPROVED.toString().equals(status)) {
                updateProductStock(order, false); // Deduct stock
            } else if (OrderStatus.REJECTED.toString().equals(status) && 
                      OrderStatus.PENDING.toString().equals(previousStatus)) {
                updateProductStock(order, true); // Restore stock
            }
        }
    }

    @Transactional
    protected void updateProductStock(Order order, boolean restoreStock) {
        for (OrderItem item : order.getItems()) {
            Product product = item.getProduct();
            int quantityChange = restoreStock ? item.getQuantity() : -item.getQuantity();
            int newStock = product.getProductcount() + quantityChange;
            product.setProductcount(Math.max(0, newStock));
            productRepository.save(product);
        }
    }

	@Override
	public long customercount() {
		return customerRepository.count();
	}

	@Override
	public List<Customer> viewAllCustomers() {
		return customerRepository.findAll();
	}

	
}