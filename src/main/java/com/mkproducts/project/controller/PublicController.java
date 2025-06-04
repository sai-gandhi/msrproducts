package com.mkproducts.project.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class PublicController {
	
	
	
	
	@GetMapping("")
	public ModelAndView home(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("home");
		return mv;
	}
	
	@GetMapping("aboutus")
	public ModelAndView aboutus(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("aboutus");
		return mv;
	}
	
	@GetMapping("contactus")
	public ModelAndView contactus(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("contactus");
		return mv;
	}
	
	
	

}
