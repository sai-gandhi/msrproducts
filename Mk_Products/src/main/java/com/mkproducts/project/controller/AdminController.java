package com.mkproducts.project.controller;



import java.io.IOException;


import java.io.OutputStream;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.sql.rowset.serial.SerialException;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import com.mkproducts.project.model.Admin;
import com.mkproducts.project.model.Contactus;
import com.mkproducts.project.model.MarketRate;
import com.mkproducts.project.model.Product;
import com.mkproducts.project.service.AdminService;
import com.mkproducts.project.service.CustomerService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private CustomerService customerService;
	
	@GetMapping("adminlogin")
	public ModelAndView adminlogin() {
		ModelAndView mv=new ModelAndView();
	   mv.setViewName("adminlogin");
	   return mv;
	}
	
	@PostMapping("checkadminlogin")
	public ModelAndView checkadminlogin(HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		String aname=request.getParameter("name");
		String apassword=request.getParameter("password");
		
		Admin admin=adminService.checkAdminLogin(aname, apassword);
		if(admin!=null) {
			mv.setViewName("adminhome");
		}
		else {
			mv.setViewName("adminlogin");
		}
		return mv;
	}
	
	@GetMapping("adminhome")
	public ModelAndView adminhome() {
		ModelAndView mv=new ModelAndView();
	   mv.setViewName("adminhome");
	   return mv;
	}
	

	@GetMapping("addproduct")
	public ModelAndView addproduct() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("addproduct");
		return mv;
	}
	
	
	@PostMapping("insertproduct")
	public ModelAndView insertproduct(HttpServletRequest request, @RequestParam("image") MultipartFile file) throws IOException, SerialException, SQLException {
	    ModelAndView mv = new ModelAndView();
	    String productname = request.getParameter("name"); 
	    double productCost = Double.parseDouble(request.getParameter("cost"));
	    String productDescription = request.getParameter("description");
	    byte[] bytes = file.getBytes();
	    Blob blob=new javax.sql.rowset.serial.SerialBlob(bytes);
	    		
	    Product p = new Product();
	    p.setCost(productCost);
	    p.setName(productname);
	    p.setDescription(productDescription);
	    p.setImage(blob); // Directly set the byte array
	    
	    String message = adminService.addProduct(p);
	    mv.setViewName("productsuccess");
	    mv.addObject("message", message);
	    return mv;
	}
	
	@GetMapping("viewallproducts")
	public ModelAndView viewallproducts() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("viewallproducts");
		List<Product> products=adminService.viewAllProduct();
		mv.addObject("products", products);
		return mv;
	}

	 @GetMapping("displayproductimage")
	    public void displayProductImage(@RequestParam int id, HttpServletResponse response) throws IOException, SQLException {
	        Product product = adminService.displayProductiById(id);
	        if (product != null && product.getImage() != null) {
	            byte[] imageBytes = product.getImage().getBytes(1, (int) product.getImage().length());
	            response.setContentType("image/jpeg");
	            try (OutputStream out = response.getOutputStream()) {
	                out.write(imageBytes);
	            }
	        }
	    }

	 @GetMapping("viewallcontacts")
		public ModelAndView viewallcontacts() {
			ModelAndView mv=new ModelAndView();
			mv.setViewName("viewallcontacts");
			List<Contactus> contacts=adminService.viewAllContacts();
			mv.addObject("contacts", contacts);
			return mv;
		}

		 @GetMapping("displaycontactimage")
		    public void displayContactImage(@RequestParam int id, HttpServletResponse response) throws IOException, SQLException {
		        Contactus contactus = adminService.displayImageById(id);
		        if (contactus != null && contactus.getImage() != null) {
		            byte[] imageBytes = contactus.getImage().getBytes(1, (int) contactus.getImage().length());
		            response.setContentType("image/jpeg");
		            try (OutputStream out = response.getOutputStream()) {
		                out.write(imageBytes);
		            }
		        }
		    }	 
	 
		 @GetMapping("addrates")
			public ModelAndView addrates() {
				ModelAndView mv=new ModelAndView();
			   mv.setViewName("addrates");
			   return mv;
			}
		 
		 @PostMapping("saveprices")
			public ModelAndView saveprices(HttpServletRequest request) {
			    ModelAndView mv = new ModelAndView();
			   String name=request.getParameter("pname");
			   String date=request.getParameter("pdate");
			   String maxprice=request.getParameter("maxprice");
			   String avgprice=request.getParameter("avgprice");
			   String minprice=request.getParameter("minprice");
			   
			    
			    		
			    MarketRate r = new MarketRate();
			    r.setProductname(name);
			    r.setDate(date);
			    r.setMaxrate(maxprice);
			    r.setAvgrate(avgprice);
			    r.setMinrate(minprice);
			    
			    
			    String message = adminService.addRates(r);
			    mv.setViewName("ratesuccess");
			    mv.addObject("message", message);
			    return mv;
			}
		 
		 
		 @GetMapping("viewadminmarketrate")
			public ModelAndView viewadminmarketrate() {
				ModelAndView mv=new ModelAndView();
				mv.setViewName("viewadminmarketrate");
				List<MarketRate> marketrates=customerService.viewAllRates();
				mv.addObject("marketrates", marketrates);
				return mv;
			}
		 
	
		 
		 @GetMapping("updaterate/{id}")
		  public ModelAndView showUpdateRateForm(@PathVariable("id") int id) {
		      ModelAndView mv = new ModelAndView();
		      MarketRate marketRate = adminService.displayProductById(id);
		      mv.addObject("marketRate", marketRate);
		      mv.setViewName("updaterate"); // View for the update form
		      return mv;
		  }
		 
		 
		  @PostMapping("updaterate")
		  public ModelAndView updateRate(@ModelAttribute("marketRate") MarketRate marketRate) {
		      adminService.updateRate(marketRate);
		      ModelAndView mv = new ModelAndView("redirect:/viewadminmarketrate");
		      return mv;
		  }
		  
		  
		  @GetMapping("delete")
		  public String delete(@RequestParam int id) {
			  adminService.deleteContact(id);
			  return "redirect:/viewallcontacts";
		  }
		  
		  @GetMapping("productdelete")
		  public String productdelete(@RequestParam int id) {
			  adminService.deleteProduct(id);
			  return "redirect:/viewallproducts";
		  }
		  
		  
}
