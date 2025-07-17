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


import com.mkproducts.project.model.Admin;
import com.mkproducts.project.model.Contactus;
import com.mkproducts.project.model.Customer;
import com.mkproducts.project.model.MarketRate;
import com.mkproducts.project.model.Order;
import com.mkproducts.project.model.Product;
import com.mkproducts.project.service.AdminService;
import com.mkproducts.project.service.CustomerService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
    
    @Autowired
    private AdminService adminService;
    
    @Autowired
    private CustomerService customerService;
    
    @GetMapping("adminlogin")
    public ModelAndView adminlogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminlogin");
        return mv;
    }
    
    @PostMapping("checkadminlogin")
    public ModelAndView checkadminlogin(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        String aname = request.getParameter("name");
        String apassword = request.getParameter("password");
        
        Admin admin = adminService.checkAdminLogin(aname, apassword);
        if(admin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            mv.setViewName("adminhome");
        } else {
            mv.setViewName("adminlogin");
            mv.addObject("message", "Invalid credentials");
        }
        return mv;
    }
    
    @GetMapping("adminhome")
    public ModelAndView adminhome(HttpServletRequest request,HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("admin") == null) {
            return new ModelAndView("redirect:/adminlogin");
        }
        return new ModelAndView("adminhome");
    }
    
    @GetMapping("addproduct")
    public ModelAndView addproduct(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("admin") == null) {
            return new ModelAndView("redirect:/adminlogin");
        }
        return new ModelAndView("addproduct");
    }
    
    @PostMapping("insertproduct")
    public ModelAndView insertproduct(HttpServletRequest request, @RequestParam("image") MultipartFile file) 
            throws IOException, SerialException, SQLException {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("admin") == null) {
            return new ModelAndView("redirect:/adminlogin");
        }
        
        ModelAndView mv = new ModelAndView();
        String productname = request.getParameter("name"); 
        double productCost = Double.parseDouble(request.getParameter("cost"));
        int productcount = Integer.parseInt(request.getParameter("productcount"));
        String productDescription = request.getParameter("description");
        byte[] bytes = file.getBytes();
        Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
        
        Product p = new Product();
        p.setCost(productCost);
        p.setName(productname);
        p.setProductcount(productcount);
        p.setDescription(productDescription);
        p.setImage(blob);
        
        String message = adminService.addProduct(p);
        mv.setViewName("productsuccess");
        mv.addObject("message", message);
        return mv;
    }
    
    @GetMapping("viewallproducts")
    public ModelAndView viewallproducts(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("admin") == null) {
            return new ModelAndView("redirect:/adminlogin");
        }
        
        ModelAndView mv = new ModelAndView();
        mv.setViewName("viewallproducts");
        List<Product> products = adminService.viewAllProduct();
        mv.addObject("products", products);
        return mv;
    }

    @GetMapping("displayproductimage")
    public void displayProductImage(@RequestParam int id, HttpServletResponse response) 
            throws IOException, SQLException {
        Product product = adminService.displayProductiById(id);
        if(product != null && product.getImage() != null) {
            byte[] imageBytes = product.getImage().getBytes(1, (int) product.getImage().length());
            response.setContentType("image/jpeg");
            try (OutputStream out = response.getOutputStream()) {
                out.write(imageBytes);
            }
        }
    }
    
    @GetMapping("viewallcontacts")
    public ModelAndView viewallcontacts(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("admin") == null) {
            return new ModelAndView("redirect:/adminlogin");
        }
        
        ModelAndView mv = new ModelAndView();
        mv.setViewName("viewallcontacts");
        List<Contactus> contacts = adminService.viewAllContacts();
        mv.addObject("contacts", contacts);
        return mv;
    }

    @GetMapping("displaycontactimage")
    public void displayContactImage(@RequestParam int id, HttpServletResponse response) 
            throws IOException, SQLException {
        Contactus contactus = adminService.displayImageById(id);
        if(contactus != null && contactus.getImage() != null) {
            byte[] imageBytes = contactus.getImage().getBytes(1, (int) contactus.getImage().length());
            response.setContentType("image/jpeg");
            try (OutputStream out = response.getOutputStream()) {
                out.write(imageBytes);
            }
        }
    }
    
    @GetMapping("addrates")
    public ModelAndView addrates(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("admin") == null) {
            return new ModelAndView("redirect:/adminlogin");
        }
        return new ModelAndView("addrates");
    }

    @PostMapping("saveprices")
    public ModelAndView saveprices(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("admin") == null) {
            return new ModelAndView("redirect:/adminlogin");
        }
        
        ModelAndView mv = new ModelAndView();
        String name = request.getParameter("pname");
        String date = request.getParameter("pdate");
        String maxprice = request.getParameter("maxprice");
        String avgprice = request.getParameter("avgprice");
        String minprice = request.getParameter("minprice");
        
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
    public ModelAndView viewadminmarketrate(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("admin") == null) {
            return new ModelAndView("redirect:/adminlogin");
        }
        
        ModelAndView mv = new ModelAndView();
        mv.setViewName("viewadminmarketrate");
        List<MarketRate> marketrates = customerService.viewAllRates();
        mv.addObject("marketrates", marketrates);
        return mv;
    }
    
    @GetMapping("deletemarketrate")
    public String marketratedelete(@RequestParam int id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("admin") == null) {
            return "redirect:/adminlogin";
        }
        adminService.deleteMarketrate(id);
        return "redirect:/viewadminmarketrate";
    }
    
    @GetMapping("delete")
    public String delete(@RequestParam int id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("admin") == null) {
            return "redirect:/adminlogin";
        }
        adminService.deleteContact(id);
        return "redirect:/viewallcontacts";
    }
    

    
    @GetMapping("updateproduct")
    public ModelAndView updateproduct(@RequestParam int id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("admin") == null) {
            return new ModelAndView("redirect:/adminlogin");
        }
        
        ModelAndView mv = new ModelAndView();
        Product product = adminService.displayProductiById(id);
        mv.setViewName("updateproduct");
        mv.addObject("product", product);
        return mv;
    }
    
    @PostMapping("updateproduct")
    public ModelAndView updateProduct(HttpServletRequest request, @RequestParam(value = "image", required = false) MultipartFile file) 
            throws IOException, SerialException, SQLException {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("admin") == null) {
            return new ModelAndView("redirect:/adminlogin");
        }
        
        ModelAndView mv = new ModelAndView();
        int productId = Integer.parseInt(request.getParameter("id"));
        String productname = request.getParameter("name"); 
        double productCost = Double.parseDouble(request.getParameter("cost"));
        int productcount = Integer.parseInt(request.getParameter("productcount"));
        String productDescription = request.getParameter("description");
        
        Product p = adminService.displayProductiById(productId);
        p.setCost(productCost);
        p.setName(productname);
        p.setProductcount(productcount);
        p.setDescription(productDescription);
        
        if(file != null && !file.isEmpty()) {
            byte[] bytes = file.getBytes();
            Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
            p.setImage(blob);
        }
        
        String message = adminService.updateProduct(p);
        mv.setViewName("productsuccess");
        mv.addObject("message", message);
        return mv;
    }
    
    
    
    
    
    
    
    
    // Order Management
    
    @GetMapping("manageorders")
    public ModelAndView manageOrders(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("admin") == null) {
            return new ModelAndView("redirect:/adminlogin");
        }
        
        ModelAndView mv = new ModelAndView("manageorders");
        List<Order> pendingOrders = adminService.getPendingOrders();
        List<Order> processedOrders = adminService.getProcessedOrders();
        mv.addObject("pendingOrders", pendingOrders);
        mv.addObject("processedOrders", processedOrders);
        return mv;
    }
    
    @PostMapping("updateorderstatus")
    public String updateOrderStatus(@RequestParam("orderId") int orderId,
                                  @RequestParam("status") String status,
                                  @RequestParam(value = "message", required = false) String message,
                                  HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("admin") == null) {
            return "redirect:/adminlogin";
        }
        
        adminService.updateOrderStatus(orderId, status, message);
        return "redirect:/manageorders";
    }
    
    @GetMapping("vieworder")
    public ModelAndView viewOrder(@RequestParam int id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("admin") == null) {
            return new ModelAndView("redirect:/adminlogin");
        }
        
        ModelAndView mv = new ModelAndView("vieworder");
        Order order = adminService.getOrderById(id);
        mv.addObject("order", order);
        return mv;
    }
    
    @GetMapping("viewallcustomers")
    public ModelAndView viewallstudents(HttpServletRequest request) {
    	HttpSession session=request.getSession(false);
    	if(session==null||session.getAttribute("admin")==null) {
    		return new ModelAndView("redirect:/adminlogin");
    	}
      ModelAndView mv=new ModelAndView();
      mv.setViewName("viewallcustomers");
      long count=adminService.customercount();
      mv.addObject("count",count);
      List<Customer> customers=adminService.viewAllCustomers();
      mv.addObject("customerlist",customers);
      return mv;
    }
    
   
    
   
}