package com.mkproducts.project.controller;

import java.io.IOException;



import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mkproducts.project.model.Contactus;
import com.mkproducts.project.model.Customer;
import com.mkproducts.project.model.Product;
import com.mkproducts.project.model.MarketRate;

import com.mkproducts.project.model.Order;
import com.mkproducts.project.model.OrderItem;
import com.mkproducts.project.model.OrderStatus;
import com.mkproducts.project.service.CustomerService;
import com.mkproducts.project.model.Feedback;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class CustomerController {
	
	
	@Autowired
	private CustomerService customerService;
	
	
	
	@GetMapping("customerregister")
	public ModelAndView customerregister() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("customerregister");
		return mv;
	}
	
	@GetMapping("customerlogin")
	public ModelAndView customerlogin() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("customerlogin");
		return mv;
	}
	
	
	
	@GetMapping("customerhome")
	public ModelAndView customerhome(HttpServletRequest request, HttpServletResponse response) {
	    HttpSession session = request.getSession(false);

	    // Disable browser caching
	    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
	    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
	    response.setDateHeader("Expires", 0); // Proxies

	    if (session == null || session.getAttribute("customer") == null) {
	        return new ModelAndView("redirect:/customerlogin"); // Redirect to login page if session expired
	    }
	    return new ModelAndView("customerhome");
	}

	@GetMapping("logout")
	public ModelAndView logout(HttpServletRequest request) {
	    HttpSession session = request.getSession(false);
	    if (session != null) {
	        session.invalidate(); // Destroy session
	    }
	    return new ModelAndView("redirect:/customerlogin"); // Always redirect to login
	}


	
	 @PostMapping("checkcustomerlogin")
	  public ModelAndView checkadminlogin(HttpServletRequest request)
	  {
	    ModelAndView mv=new ModelAndView();
	    String cemail=request.getParameter("email");
	    String cpwd=request.getParameter("password");
	    
	    Customer customer=customerService.checkCustomerLogin(cemail, cpwd);
	    if(customer!=null)
	    {
	      HttpSession session=request.getSession();
	      session.setAttribute("customer", customer);
	      mv.setViewName("customerhome");
	    }
	    else
	    {
	      mv.setViewName("customerlogin");
	      mv.addObject("msg","Login Failed");
	    }
	    return mv;
	  }
	 
	 /*
	 
	 @PostMapping("customerregistration")
	 public ModelAndView customerregistration(HttpServletRequest request) {
		 ModelAndView mv=new ModelAndView();
		 String name=request.getParameter("uname");
		 String email=request.getParameter("email");
		 String password=request.getParameter("password");
		 String location=request.getParameter("location");
		 String contact=request.getParameter("contact");
		 
		 Customer customer=new Customer();
		 customer.setName(name);
		 customer.setEmail(email);
		 customer.setPassword(password);
		 customer.setLocation(location);
		 customer.setContact(contact);
		
    
		    String message = customerService.saveCustomer(customer);

	        if (message.startsWith("Error")) {
	            mv.setViewName("customerregister"); // show registration page again
	        } else {
	            mv.setViewName("registersuccess"); // go to success page
	        }

	        mv.addObject("message", message);
	        return mv;
		 
	 }
	 
	 */
	 
	 @PostMapping("/customerregistration")
	    public ModelAndView customerregistration(HttpServletRequest request) {
	        ModelAndView mv = new ModelAndView();
	        String name = request.getParameter("uname");
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        String location = request.getParameter("location");
	        String contact = request.getParameter("contact");

	        Customer customer = new Customer();
	        customer.setName(name);
	        customer.setEmail(email);
	        customer.setPassword(password);
	        customer.setLocation(location);
	        customer.setContact(contact);

	        String message = customerService.registerWithOtp(customer);

	        if (message.startsWith("Error")) {
	            mv.setViewName("customerregister");
	            mv.addObject("message", message);
	        } else {
	            mv.setViewName("verifyotp");
	            mv.addObject("email", customer.getEmail());
	            mv.addObject("message", "An OTP has been sent to your email.");
	        }

	        return mv;
	    }

	 @PostMapping("/verifyotp")
	 public ModelAndView verifyOtp(@RequestParam("email") String email, @RequestParam("otp") String otp) {
	     ModelAndView mv = new ModelAndView();
	     boolean verified = customerService.verifyOtp(email, otp);

	     if (verified) {
	         mv.setViewName("registersuccess");
	         mv.addObject("message", "Registration successful and verified!");
	     } else {
	         mv.setViewName("verifyotp");
	         mv.addObject("error", "❌ Invalid or expired OTP. You will be redirected to registration page shortly.");
	         mv.addObject("redirect", true);
	     }

	     return mv;
	 }

	
	 
	 
	 @PostMapping("savecontactinformation")
	public ModelAndView savecontactinformation(HttpServletRequest request, @RequestParam("uimage") MultipartFile file) throws IOException, SerialException, SQLException {
		    ModelAndView mv = new ModelAndView();
		    String name = request.getParameter("uname"); 
		    String email=request.getParameter("email");
		    String contact =request.getParameter("ucontact");
		    String locatiion = request.getParameter("ulocation");
		    String date =request.getParameter("date");
		    String umessage =request.getParameter("umessage");
		    byte[] bytes = file.getBytes();
		    Blob blob=new javax.sql.rowset.serial.SerialBlob(bytes);
		    		
		   Contactus c=new Contactus();
		   c.setName(name);
		   c.setEmail(email);
		   c.setContact(contact);
		   c.setLocation(locatiion);
		   c.setDate(date);
		   c.setMessage(umessage);
		   c.setImage(blob); // Directly set the byte array
		    
		    String message = customerService.addContactus(c);
		    mv.setViewName("contactussuccess");
		    mv.addObject("message", message);
		    return mv;
		}
	 
	
	 @GetMapping("feedback")
		public ModelAndView feedback(HttpServletRequest request) {
		  HttpSession session=request.getSession(false);
		  if(session==null||session.getAttribute("customer")==null) {
			  return new ModelAndView("redirect:/customerlogin");
		  }
			ModelAndView mv=new ModelAndView();
			mv.setViewName("feedback");
			return mv;
		}
	 
	 @PostMapping("savefeedbackform")
	 public ModelAndView savefeedbackform(
	         HttpServletRequest request,
	         HttpSession session,
	         @RequestParam("image") MultipartFile file) throws IOException, SerialException, SQLException {
	     
	     ModelAndView mv = new ModelAndView();


	     String name = request.getParameter("customer-name");
	     String contact = request.getParameter("contact");
	     String products = request.getParameter("product-name");
	     String crop = request.getParameter("crop-name");
	     String userstory = request.getParameter("user-story");
	     byte[] bytes = file.getBytes();
	     Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

	    
	     Feedback feedback = new Feedback();
	     feedback.setName(name);
	     feedback.setContact(contact);
	     feedback.setProducts(products);
	     feedback.setCrop(crop);
	     feedback.setUserstory(userstory);
	     feedback.setImage(blob);

	     Customer customer = (Customer) session.getAttribute("customer");

	     if (customer == null) {
	         mv.setViewName("redirect:/login");
	         mv.addObject("error", "Please log in before submitting feedback.");
	         return mv;
	     }


	     String message = customerService.addFeedback(feedback, customer);

	     mv.setViewName("feedbacksuccess");
	     mv.addObject("message", message);
	     return mv;
	 }

	 

	 
	 @GetMapping("viewfeedback")
		public ModelAndView viewafeedback(HttpServletRequest request) {
		 HttpSession session = request.getSession(false);
	     if (session == null || session.getAttribute("customer") == null) {
	         return new ModelAndView("redirect:/customerlogin");
	     }
			ModelAndView mv=new ModelAndView();
			mv.setViewName("viewfeedback");
			List<Feedback> feedback=customerService.getAllFeedbacks();
			mv.addObject("feedbacks", feedback);
			return mv;
		}

	    @GetMapping("displayfeedbackimage")
	    public void displayFeedbackImage(@RequestParam int id, HttpServletResponse response) throws IOException, SQLException {
	        Feedback feedback = customerService.getFeedbackById(id);
	        if (feedback != null && feedback.getImage() != null) {
	            byte[] imageBytes = feedback.getImage().getBytes(1, (int) feedback.getImage().length());
	            response.setContentType("image/jpeg");
	            try (OutputStream out = response.getOutputStream()) {
	                out.write(imageBytes);
	            }
	        }
	    }
	 
	 @GetMapping("marketrates")
		public ModelAndView marketrates() {
			ModelAndView mv=new ModelAndView();
			mv.setViewName("marketrates");
			List<MarketRate> marketrates=customerService.viewAllRates();
			mv.addObject("marketrates", marketrates);
			return mv;
		}
	 
	 @GetMapping("customerviewallproducts")
		public ModelAndView viewallproducts(HttpServletRequest request) {
		 HttpSession session = request.getSession(false);
	     if (session == null || session.getAttribute("customer") == null) {
	         return new ModelAndView("redirect:/customerlogin");
	     }
			ModelAndView mv=new ModelAndView();
			mv.setViewName("customerviewallproducts");
			List<Product> products=customerService.viewAllProducts();
			mv.addObject("products", products);
			return mv;
		}

		 @GetMapping("displayproductimages")
		    public void displayProductImages(@RequestParam int id, HttpServletResponse response) throws IOException, SQLException {
		        Product product = customerService.displayProductiByIds(id);
		        if (product != null && product.getImage() != null) {
		            byte[] imageBytes = product.getImage().getBytes(1, (int) product.getImage().length());
		            response.setContentType("image/jpeg");
		            try (OutputStream out = response.getOutputStream()) {
		                out.write(imageBytes);
		            }
		        }
		    }

		 
		 @GetMapping("crop_details")
		 public ModelAndView crop_details(HttpServletRequest request, HttpServletResponse response) {
			    HttpSession session = request.getSession(false);
			    if (session == null || session.getAttribute("customer") == null) {
			        return new ModelAndView("redirect:/customerlogin"); // Redirect to login page if session expired
			    }
			    
			    return new ModelAndView("crop_details");
			}
		 
		 
		 
		 @GetMapping("placeorder")
		 public ModelAndView placeOrder(HttpServletRequest request) {
		     HttpSession session = request.getSession(false);
		     if (session == null || session.getAttribute("customer") == null) {
		         return new ModelAndView("redirect:/customerlogin");
		     }
		     
		     ModelAndView mv = new ModelAndView("placeorder");
		     List<Product> products = customerService.getAllAvailableProducts();
		     mv.addObject("products", products);
		     return mv;
		 }

		 @PostMapping("submitorder")
		 public ModelAndView submitOrder(HttpServletRequest request, 
		                               @RequestParam("productIds") List<Integer> productIds,
		                               @RequestParam("quantities") List<Integer> quantities) {
		     HttpSession session = request.getSession(false);
		     if (session == null || session.getAttribute("customer") == null) {
		         return new ModelAndView("redirect:/customerlogin");
		     }
		     
		     Customer customer = (Customer) session.getAttribute("customer");
		     ModelAndView mv = new ModelAndView();
		     
		     // Create order
		     Order order = new Order();
		     order.setCustomer(customer);
		     
		     order.setStatus(OrderStatus.PENDING);

		     
		     double totalAmount = 0;
		     List<OrderItem> items = new ArrayList<>();
		     
		     // Process each product
		     for (int i = 0; i < productIds.size(); i++) {
		         int productId = productIds.get(i);
		         int quantity = quantities.get(i);
		         
		         if (quantity > 0) {
		             Product product = customerService.displayProductiByIds(productId);
		             
		             // Check stock availability
		             if (product.getProductcount() < quantity) {
		                 mv.setViewName("placeorder");
		                 mv.addObject("error", "Not enough stock for product: " + product.getName());
		                 return mv;
		             }
		             
		             // Create order item
		             OrderItem item = new OrderItem();
		             item.setProduct(product);
		             item.setQuantity(quantity);
		             item.setUnit_price(product.getCost());
		             items.add(item);
		             
		             // Calculate total
		             totalAmount += product.getCost() * quantity;
		         }
		     }
		     
		     if (items.isEmpty()) {
		         mv.setViewName("placeorder");
		         mv.addObject("error", "Please select at least one product");
		         return mv;
		     }
		     
		     order.setTotal_amount(totalAmount);
		     
		     // Save order
		     String result = customerService.placeOrder(order, items,customer);
		     mv.setViewName("orderconfirmation");
		     mv.addObject("message", result);
		     mv.addObject("order", order);
		     
		     return mv;
		 }

		 @GetMapping("myorders")
		 public ModelAndView viewMyOrders(HttpServletRequest request) {
		     HttpSession session = request.getSession(false);
		     if (session == null || session.getAttribute("customer") == null) {
		         return new ModelAndView("redirect:/customerlogin");
		     }
		     
		     Customer customer = (Customer) session.getAttribute("customer");
		     
		     ModelAndView mv = new ModelAndView("myorders");
		     List<Order> orders = customerService.getCustomerOrders(customer);
		     Collections.reverse(orders);
		     mv.addObject("orders", orders);
		     return mv;
		 }
//
//		 @GetMapping("notifications")
//		 public ModelAndView viewNotifications(HttpServletRequest request) {
//		     HttpSession session = request.getSession(false);
//		     if (session == null || session.getAttribute("customer") == null) {
//		         return new ModelAndView("redirect:/customerlogin");
//		     }
//		     
//		     Customer customer = (Customer) session.getAttribute("customer");
//		     ModelAndView mv = new ModelAndView("notifications");
//		     List<Notification> notifications = customerService.getCustomerNotifications(customer);
//		     mv.addObject("notifications", notifications);
//		     return mv;
//	 }
//
//	 @PostMapping("markasread")
//		 public String markAsRead(@RequestParam("notificationId") int notificationId) {
//		     customerService.markNotificationAsRead(notificationId);
//		     return "redirect:/notifications";
//		 }
//	
		 
		 
		 
		 @GetMapping("/generateInvoice")
		 public void generateInvoice(@RequestParam("orderId") String orderCode,
		                             HttpServletResponse response) throws Exception {

		     Order order = customerService.getOrderByOrderCode(orderCode);

		     if (order == null) {
		         response.sendError(HttpServletResponse.SC_NOT_FOUND, "Order not found");
		         return;
		     }
		     
		     
		     response.setContentType("application/pdf");
		     response.setHeader("Content-Disposition", "inline; filename=Invoice_" + order.getOrderId() + ".pdf");


		        try {
		            Document document = new Document(PageSize.A4);
		            PdfWriter.getInstance(document, response.getOutputStream());

		            document.open();

		            // ---------- TITLE ----------
		            Font titleFont = new Font(Font.HELVETICA, 22, Font.BOLD);
		            Paragraph title = new Paragraph("ORDER INVOICE", titleFont);
		            title.setAlignment(Paragraph.ALIGN_CENTER);
		            document.add(title);

		            document.add(new Paragraph(" "));

		            // ---------- ORDER DETAILS ----------
		            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd   HH:mm");

		            document.add(new Paragraph("Order Code   : " + order.getOrderId())); // string code
		            document.add(new Paragraph("Order DB ID  : " + order.getId()));
		            document.add(new Paragraph("Order Date   : " + order.getOrder_date().format(dtf)));
		            if (order.getCustomer() != null) {
		                document.add(new Paragraph("Customer     : " + order.getCustomer().getName()));
		                document.add(new Paragraph("Email        : " + order.getCustomer().getEmail()));
		            }
		            document.add(new Paragraph("Status       : " + order.getStatus().name()));
		            document.add(new Paragraph("Total Amount : ₹" + order.getTotal_amount()));

		            document.add(new Paragraph(" "));
		            document.add(new Paragraph("Items", new Font(Font.HELVETICA, 16, Font.BOLD)));
		            document.add(new Paragraph(" "));

		            // ---------- ITEMS TABLE ----------
		            PdfPTable table = new PdfPTable(4);
		            table.setWidthPercentage(100);

		            table.addCell("Product");
		            table.addCell("Quantity");
		            table.addCell("Unit Price");
		            table.addCell("Total");

		            for (OrderItem item : order.getItems()) {
		                String productName = item.getProduct().getName();
		                int quantity = item.getQuantity();
		                double unitPrice = item.getUnit_price();
		                double totalItem = quantity * unitPrice;

		                table.addCell(productName);
		                table.addCell(String.valueOf(quantity));
		                table.addCell("₹" + unitPrice);
		                table.addCell("₹" + totalItem);
		            }

		            document.add(table);

		            document.add(new Paragraph(" "));
		            
		            document.add(new Paragraph("Thank you for shopping with us. We appreciate your business and look forward to serving you again."));


		            document.close();
		        } catch (Exception e) {
		            e.printStackTrace();
		            // If PDF creation fails, send 500
		            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error generating PDF");
		        }

		     
		 }

		 
		 
		  

		 
		
}
