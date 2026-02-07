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
	
	
	@GetMapping("production")
	public ModelAndView production(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("production");
		return mv;
	}
	
	@GetMapping("oil_seeds")
	public ModelAndView oil_seeds(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("oil_seeds");
		return mv;
	}
	
	@GetMapping("food_grains")
	public ModelAndView food_grains(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("food_grains");
		return mv;
	}
	
	@GetMapping("commercial_crop")
	public ModelAndView commercial_crop(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("commercial_crop");
		return mv;
	}
	
	
	
	
	@GetMapping("zzgraph")
	public ModelAndView zzgraph(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("zzgraph");
		return mv;
	}
	
	
	
	@GetMapping("contactus")
	public ModelAndView contactus(){
		ModelAndView mv=new ModelAndView();
		mv.setViewName("contactus");
		return mv;
	}
	
	
	

}
