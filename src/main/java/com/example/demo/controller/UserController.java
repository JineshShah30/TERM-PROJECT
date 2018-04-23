package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.entity.User;
import com.example.demo.repository.UserRepository;

@Controller
public class UserController {

	@Autowired
	private UserRepository user;
	
	@GetMapping(value="/")
	public ModelAndView renderIndex() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	
	@PostMapping(value="/redirect")
	public ModelAndView handleRedirect(
			@RequestParam(name="myId") String myId,
			@RequestParam(name="myName") String name,
			HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		request.getSession().setAttribute("name", name);
		request.getSession().setAttribute("userId",myId);
		
		System.out.println("session attrs :"+ name + myId);
		
		boolean b = user.existsByUserid(myId);
		System.out.println("boolean b value "+b);
		if(b==true) {
			
			User u = user.findByUserid(myId) ;
			System.out.println(u.getDescription());
			System.out.println(u.getName());
			
			mv.addObject("u",u);
			mv.setViewName("successful");
			
			return mv;
			
					}
		else {
			return new ModelAndView("create_profile");
			
			}
	}
	
	
	
}
