package com.mkproducts.project.service;

import java.util.List;


import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
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
    
    @Autowired
    private JavaMailSender mailSender;

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

    @Override
    public List<Order> getPendingOrders() {
        return orderRepository.findByStatus(OrderStatus.PENDING);
    }

    @Override
    public List<Order> getProcessedOrders() {
        return orderRepository.findAll().stream()
                .filter(order -> order.getStatus() != OrderStatus.PENDING)
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
    public void updateOrderStatus(Order order, int orderId, String status, String message,List<OrderItem> items) {
        // ❌ Problem: You already have an 'order' parameter — don’t redeclare it!
        // ✅ FIX: Use a different variable name when fetching from repository
        Order existingOrder = orderRepository.findById(orderId)
                .orElseThrow(() -> new RuntimeException("Order not found with ID: " + orderId));

        OrderStatus previousStatus = existingOrder.getStatus();
        OrderStatus newStatus = OrderStatus.valueOf(status.trim().toUpperCase());

        existingOrder.setStatus(newStatus);
        orderRepository.save(existingOrder);

        if (newStatus == OrderStatus.APPROVED) {
            updateProductStock(existingOrder, false); // Deduct stock
            sendOrderConfirmNotification(existingOrder,items);
        } else if (newStatus == OrderStatus.REJECTED && previousStatus == OrderStatus.PENDING) {
            updateProductStock(existingOrder, true); // Restore stock
            // optionally: send rejection email/message with reason
            if (message != null && !message.isEmpty()) {
                sendOrderRejectionNotification(existingOrder, message,items);
            }
        }
    }

    
    public void sendOrderConfirmNotification(Order order,List<OrderItem> items) {
        try {
            if (order.getCustomer() == null || order.getCustomer().getEmail() == null) {
                System.err.println("❌ Cannot send email: Customer or email is null for order " + order.getOrderId());
                return;
            }
            
            StringBuilder itemDetails = new StringBuilder();
            for (OrderItem item : items) {
                itemDetails.append("• ")
                		   .append(item.getProduct().getName())
                           .append(" — Quantity: ")
                           .append(item.getQuantity())
                           .append("\n");
            }
           

            String customerName = order.getCustomer().getName();
            String toEmail = order.getCustomer().getEmail();

            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(toEmail);
            message.setSubject("✅ Your Order #" + order.getOrderId() + " Has Been Approved!");

            message.setText("Hello " + customerName + ",\n\n"
                    + "Great news! Your order (Order ID: " + order.getOrderId() + ") has been approved by MSR Products & Services.\n\n"
                    + "📦 Order Details:\n"
                    + itemDetails.toString()
                    + "Total Amount: ₹" + order.getTotal_amount() + "\n\n"
                    + "Status: " + order.getStatus() + "\n\n"
                    + "Our team will process your order soon.\n"
                    + "If you have any questions or need help understanding how our products can be used in your field, we’d be happy to assist you!\n"
                    + "Thank you for shopping with MSR Products & Services!\n\n"
                    + "Best regards,\nMSR Products & Services Team");

            mailSender.send(message);
            System.out.println("✅ Order confirmation email sent to: " + toEmail);

        } catch (Exception e) {
            System.err.println("❌ Failed to send email for order " + order.getOrderId() + ": " + e.getMessage());
        }
    }


   
    	public void sendOrderRejectionNotification(Order order, String reason,List<OrderItem> items) {
    	    try {
    	        if (order.getCustomer() == null || order.getCustomer().getEmail() == null) {
    	            System.err.println("❌ Cannot send email: Customer or email is null for order " + order.getOrderId());
    	            return;
    	        }
    	        
    	        StringBuilder itemDetails = new StringBuilder();
                for (OrderItem item : items) {
                    itemDetails.append("• ")
                    		   .append(item.getProduct().getName())
                               .append(" — Quantity: ")
                               .append(item.getQuantity())
                               .append("\n");
                }

    	        String customerName = order.getCustomer().getName();
    	        String toEmail = order.getCustomer().getEmail();

    	        SimpleMailMessage message = new SimpleMailMessage();
    	        message.setTo(toEmail);
    	        message.setSubject("❌ Order #" + order.getOrderId() + " Has Been Rejected");

    	        String rejectionMessage = (reason != null && !reason.trim().isEmpty())
    	                ? reason.trim()
    	                : "Unfortunately, we were unable to process your order at this time.";

    	        message.setText("Hello " + customerName + ",\n\n"
    	                + "We regret to inform you that your order (Order ID: " + order.getOrderId() + ") \n\n"
    	                + "📦 Order Details:\n\n"
    	                + itemDetails.toString()
    	                + "has been rejected by MSR Products & Services.\n\n"
    	                + "Status: " + order.getStatus() + "\n\n"
    	                + "Reason for rejection:\n"
    	                + rejectionMessage + "\n\n"
    	                + "please contact our support team.\n\n"
    	                + "We sincerely apologize for the inconvenience caused.\n\n"
    	                + "Best regards,\n"
    	                + "MSR Products & Services Team");

    	        mailSender.send(message);
    	        System.out.println("📧 Rejection email sent successfully to " + toEmail);

    	    } catch (Exception e) {
    	        System.err.println("❌ Failed to send rejection email for order " + order.getOrderId() + ": " + e.getMessage());
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