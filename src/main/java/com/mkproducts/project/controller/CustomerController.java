package com.mkproducts.project.controller;

import java.io.IOException;

import java.io.OutputStream;
import java.sql.Blob;
import java.sql.SQLException;
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
import com.mkproducts.project.service.CustomerService;
import com.mkproducts.project.model.Feedback;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
		    mv.setViewName("registersuccess");
		    mv.addObject("message", message);
		    return mv;
		 
	 }
	 
	 
	 @GetMapping("feedback")
		public ModelAndView feedback() {
			ModelAndView mv=new ModelAndView();
			mv.setViewName("feedback");
			return mv;
		}
	 
	 
	 @PostMapping("savecontactinformation")
	public ModelAndView savecontactinformation(HttpServletRequest request, @RequestParam("uimage") MultipartFile file) throws IOException, SerialException, SQLException {
		    ModelAndView mv = new ModelAndView();
		    String name = request.getParameter("uname"); 
		    String contact =request.getParameter("ucontact");
		    String locatiion = request.getParameter("ulocation");
		    String date =request.getParameter("date");
		    String umessage =request.getParameter("umessage");
		    byte[] bytes = file.getBytes();
		    Blob blob=new javax.sql.rowset.serial.SerialBlob(bytes);
		    		
		   Contactus c=new Contactus();
		   c.setName(name);
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
	 
	 @PostMapping("savefeedbackform")
	 public ModelAndView savefeedbackform(HttpServletRequest request) {
		 ModelAndView mv=new ModelAndView();
		 String name=request.getParameter("customer-name");
		 String contact=request.getParameter("contact");
		 String products=request.getParameter("product-name");
		 String crop=request.getParameter("crop-name");
		 String userstory=request.getParameter("user-story");
		 Feedback feedback=new Feedback();
		 feedback.setName(name);
		 feedback.setContact(contact);
		 feedback.setProducts(products);
		 feedback.setCrop(crop);
		 feedback.setUserstory(userstory);
		 
		 String message = customerService.addFeedback(feedback);
		    mv.setViewName("feedbacksuccess");
		    mv.addObject("message", message);
		    return mv;
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
		public ModelAndView viewallproducts() {
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

}
