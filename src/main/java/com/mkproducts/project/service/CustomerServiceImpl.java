package com.mkproducts.project.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;


import com.mkproducts.project.model.Contactus;
import com.mkproducts.project.model.Customer;
import com.mkproducts.project.model.Feedback;
import com.mkproducts.project.model.MarketRate;

import com.mkproducts.project.model.Order;
import com.mkproducts.project.model.OrderItem;
import com.mkproducts.project.model.Product;
import com.mkproducts.project.model.TemporaryCustomer;
import com.mkproducts.project.repository.ContactusRepository;
import com.mkproducts.project.repository.CustomerRepository;
import com.mkproducts.project.repository.FeedbackRepository;
import com.mkproducts.project.repository.MarketRateRepository;
import com.mkproducts.project.repository.OrderItemRepository;
import com.mkproducts.project.repository.OrderRepository;
import com.mkproducts.project.repository.ProductRepository;
import com.mkproducts.project.repository.TemporaryCustomerRepository;

import jakarta.transaction.Transactional;


import java.sql.Timestamp;
import java.time.Instant;
import java.util.Random;

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
	 private TemporaryCustomerRepository tempRepo;
	
	 @Autowired
	    private JavaMailSender mailSender;
	
	@Autowired
    private OrderRepository orderRepository;
    
    @Autowired
    private OrderItemRepository orderItemRepository;

	@Override
	public Customer checkCustomerLogin(String email, String password) {
		
		return customerRepository.checkCustomerLogin(email, password);
	}
	
	//----------------------------------------------------------------------------------
	 @Override
	    public String registerWithOtp(Customer customer) {

	        if (customerRepository.existsByEmail(customer.getEmail())) {
	            return "Error: Email already exists!";
	        }
	        if (customerRepository.existsByContact(customer.getContact())) {
	            return "Error: Contact number already exists!";
	        }

	        try {
	            // Generate 6-digit OTP
	            String otp = String.format("%06d", new Random().nextInt(999999));

	            // Save temporary record
	            TemporaryCustomer temp = new TemporaryCustomer();
	            temp.setName(customer.getName());
	            temp.setEmail(customer.getEmail());
	            temp.setPassword(customer.getPassword());
	            temp.setLocation(customer.getLocation());
	            temp.setContact(customer.getContact());
	            temp.setOtp(otp);
	            temp.setOtpExpiry(Timestamp.from(Instant.now().plusSeconds(300))); // 5 min expiry
	            tempRepo.save(temp);

	            // Send OTP email
	            sendOtpEmail(customer.getEmail(), customer.getName(), otp);

	            return "OTP sent successfully to your email. Please verify within 5 minutes.";
	        } 
	        catch (DataIntegrityViolationException e) {
	            return "Error: Duplicate entry!";
	        } 
	        catch (Exception e) {
	            e.printStackTrace();
	            return "Error: Failed to send OTP email!";
	        }
	    }

	    @Override
	    public boolean verifyOtp(String email, String otp) {
	        TemporaryCustomer temp = tempRepo.findByEmail(email);

	        if (temp != null &&
	            temp.getOtp().equals(otp) &&
	            temp.getOtpExpiry().after(Timestamp.from(Instant.now()))) {

	            // Move to main table
	            Customer customer = new Customer();
	            customer.setName(temp.getName());
	            customer.setEmail(temp.getEmail());
	            customer.setPassword(temp.getPassword());
	            customer.setLocation(temp.getLocation());
	            customer.setContact(temp.getContact());
	            customerRepository.save(customer);
	            sendCustomerRegistration(customer);
	            tempRepo.delete(temp);
	            return true;
	        } 
	        else {
	            if (temp != null) {
	            	tempRepo.delete(temp); // delete invalid/expired OTP
	            }
	            return false;
	        }
	    }
	    
	    public void sendCustomerRegistration(Customer customer) {
	    	 try {
	    	        SimpleMailMessage message = new SimpleMailMessage();
	    	        message.setTo(customer.getEmail());
	    	        message.setSubject("✅ Your Email Has Been Successfully Verified - MSR Products & Services");

	    	        String emailBody = String.format(
	    	            "Hello %s,\n\n"
	    	          + "Congratulations! 🎉 Your email address has been successfully verified.\n\n"
	    	          + "Your MSR Products and Services account is now fully activated. You can log in anytime to explore our products, track orders, and manage your profile securely.\n\n"
	    	          + "If you need any assistance, feel free to contact our support team — we’re always happy to help.\n\n"
	    	          + "Thank you for verifying your account and being a part of the MSR family.\n\n"
	    	          + "Best regards,\n"
	    	          + "The MSR Products & Services Team\n"
	    	          + "------------------------------------------\n"
	    	          + "Email: support@msrproducts.com | Website: www.msrproducts.com",
	    	            customer.getName()
	    	        );

	    	        message.setText(emailBody);
	    	        mailSender.send(message);

	    	        System.out.println("📩 Verification success email sent to " + customer.getEmail());
	    	    } catch (Exception e) {
	    	        System.err.println("❌ Failed to send verification success email: " + e.getMessage());
	    	    }
	    }

	    // 🔹 Helper: Send OTP via email
	    private void sendOtpEmail(String toEmail, String name, String otp) {
	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setTo(toEmail);
	        message.setSubject("Action Required: Verify Your MK Products Account");

	        String emailBody = String.format(
	            "Hello %s,\n\n"
	          + "Thank you for registering with MK Products.\n\n"
	          + "To complete your registration and activate your account, please use the One-Time Password (OTP) provided below:\n\n"
	          + "🔐 OTP: %s\n\n"
	          + "This OTP is valid for 5 minutes. Please do not share it with anyone for security reasons.\n\n"
	          + "If you did not initiate this registration, please ignore this email.\n\n"
	          + "Best regards,\n"
	          + "The MK Products Support Team\n"
	          + "-------------------------------------\n"
	          + "Email: support@mkproducts.com | Website: www.mkproducts.com",
	            name, otp
	        );

	        message.setText(emailBody);
	        mailSender.send(message);
	    }

	//--------------------------------------------------------------------------------------

	@Override
	public String addContactus(Contactus c) {
		 contactusRepository.save(c);
		 sendContactNotification(c);
		 return "Product Added Successfully";
	}
	


	public void sendContactNotification(Contactus contact) {
	    try {
	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setTo(contact.getEmail());
	        message.setSubject("Contact Details Submitted Successfully");
	        message.setText("Hello " + contact.getName() + ",\n\n"
	            + "Thank you for providing your contact details!\n\n"
	            + "We are excited to have you as part of MSR Products and Services. 🎉\n\n"
	            + "We have successfully received your contact information, and our team will reach out to you soon if necessary.\n\n"
	            + "Your Message is "+ contact.getMessage()+"\n\n"
	            + "We look forward to helping you achieve your goals at MSR Products and Services!\n\n"
	            + "Best regards,\nMSR Products and Services Team");

	        mailSender.send(message);
	        System.out.println("✅ Email sent successfully to " + contact.getEmail());
	    } catch (Exception e) {
	        System.err.println("❌ Failed to send email: " + e.getMessage());
	    }
	}
	


	@Override
	public List<MarketRate> viewAllRates() {
		return marketRateRepository.findAll();
	}

//	@Override
//	public String saveCustomer(Customer customer) {
//		
//		if (customerRepository.existsByEmail(customer.getEmail())) {
//            return "Error: Email already exists!";
//        }
//        if (customerRepository.existsByContact(customer.getContact())) {
//            return "Error: Contact number already exists!";
//        }
//
//        try {
//        	customerRepository.save(customer);
//            sendCustomerRegistration(customer);  // ✅ Call directly (no 'customer.' prefix)
//            return "Registration successful!";
//        } catch (DataIntegrityViolationException e) {
//            return "Error: Duplicate entry!";
//        }
//		
//		
//	}
	
	
	
	

	@Override
	public List<Product> viewAllProducts() {
		return productRepository.findAll();
	}

	@Override
	public Product displayProductiByIds(int id) {
		return productRepository.findById(id).get();
	}

	@Override
	public String addFeedback(Feedback c,Customer customer) {
		feedbackRepository.save(c);
		sendFeedbackNotification(c,customer);
		return "Feedback is saved";
	}
	
	public void sendFeedbackNotification(Feedback c,Customer customer) {
		try {
			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(customer.getEmail());
			message.setSubject("Thank You for Your Feedback!");
			message.setText("Hello " + c.getName() + ",\n\n"
				    + "Welcome to MSR Products and Services! 🎉\n\n"
				    + "Your thoughts help us improve and inspire other customers to make confident decisions.\n\n"
				    + "We’re delighted to have you as a valued customer and look forward to serving you again soon!\n\n"
				    + "Thank you for choosing MSR Products and Services.\n\n"
				    + "Best regards,\n"
				    + "The MSR Products and Services Team");


	        mailSender.send(message);
	        System.out.println("✅ Email sent successfully to " + customer.getEmail());
	    } catch (Exception e) {
	        System.err.println("❌ Failed to send email: " + e.getMessage());
	    }
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
    public String placeOrder(Order order, List<OrderItem> items, Customer customer) {
        // 1️⃣ Save order to get auto-generated ID
        Order savedOrder = orderRepository.save(order);

        // 2️⃣ Generate formatted Order ID
        String formattedOrderId = String.format("ORD%05d", savedOrder.getId());
        savedOrder.setOrderId(formattedOrderId);

        // 3️⃣ Save again to persist formatted Order ID
        savedOrder = orderRepository.save(savedOrder);

        // 4️⃣ Save order items and update stock
        for (OrderItem item : items) {
            item.setOrder(savedOrder);
            orderItemRepository.save(item);

            Product product = item.getProduct();
            int newStock = product.getProductcount() - item.getQuantity();
            product.setProductcount(newStock);
            productRepository.save(product);
        }

        // 5️⃣ Send email with correct Order ID
        sendOrderNotification(savedOrder, items, customer);

        return "Order placed successfully with ID: " + formattedOrderId;
    }

    
    public void sendOrderNotification(Order order, List<OrderItem> items, Customer customer) {
        try {
            StringBuilder itemDetails = new StringBuilder();
            for (OrderItem item : items) {
                itemDetails.append("• ")
                		   .append(item.getProduct().getName())
                           .append(" — Quantity: ")
                           .append(item.getQuantity())
                           .append("\n");
            }

            String emailContent = "Hello " + customer.getName() + ",\n\n"
                    + "🛒 Thank you for your order with MSR Products and Services!\n\n"
                    + "Your order (Order ID: " + order.getOrderId() + ") has been successfully placed.\n\n"
                    + "📦 Order Details:\n"
                    + itemDetails.toString()
                    + "\n"
                    + "We'll notify you once your order is Accepted.\n\n"
                    + "💬 If you have any questions, feel free to reply to this email or contact our support team.\n\n"
                    + "Thank you for choosing MSR Products and Services.\n\n"
                    + "Best regards,\n"
                    + "\n"
                    + "The MSR Products and Services Team";

            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(customer.getEmail());
            message.setSubject("🧾 Order Confirmation - MSR Products and Services");
            message.setText(emailContent);

            mailSender.send(message);
            System.out.println("✅ Order confirmation email sent successfully to " + customer.getEmail());
        } catch (Exception e) {
            System.err.println("❌ Failed to send order confirmation email: " + e.getMessage());
        }
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

	
   
    @Override
    public Order getOrderByOrderCode(String orderCode) {
        return orderRepository.findByOrderId(orderCode);
    }

    
    
    /*
    @Override
        public String loadTemplate(String path) throws IOException {
            InputStream is = getClass()
                    .getClassLoader()
                    .getResourceAsStream(path);

            if (is == null) {
                throw new IOException("Template not found: " + path);
            }


            return new String(is.readAllBytes(), StandardCharsets.UTF_8);
        }

        public String buildInvoiceHtml(Order order) throws IOException {
            String html = loadTemplate("templates/invoice.html");

            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");

            StringBuilder itemsHtml = new StringBuilder();
            for (OrderItem item : order.getItems()) {
                double total = item.getQuantity() * item.getUnit_price();
                itemsHtml.append("""
                    <tr>
                        <td>%s</td>
                        <td class="text-right">%d</td>
                        <td class="text-right">₹%.2f</td>
                        <td class="text-right">₹%.2f</td>
                    </tr>
                """.formatted(
                    item.getProduct().getName(),
                    item.getQuantity(),
                    item.getUnit_price(),
                    total
                ));
            }

            return html.replace("{{orderCode}}", order.getOrderId())
                       .replace("{{orderDate}}", order.getOrder_date().format(dtf))
                       .replace("{{customerName}}", order.getCustomer().getName())
                       .replace("{{customerEmail}}", order.getCustomer().getEmail())
                       .replace("{{status}}", order.getStatus().name())
                       .replace("{{totalAmount}}",
                               String.format("%.2f", order.getTotal_amount()))
                       .replace("{{items}}", itemsHtml.toString());
        }
    

*/
	

}
