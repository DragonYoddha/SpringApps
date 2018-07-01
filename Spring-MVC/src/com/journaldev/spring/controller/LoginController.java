package com.journaldev.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.journaldev.spring.forms.LoginForm;

@Controller
public class LoginController {

	@RequestMapping("/")
	public String login(Model model)
	{
		model.addAttribute("loginForm", new LoginForm());
		return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String checkLogin(@ModelAttribute("loginForm")LoginForm form,Model model) throws Exception
	{
		if("ravitosh".equalsIgnoreCase(form.getUsername()) && "khatri".equalsIgnoreCase(form.getPassword())) 
		{
			return "redirect:/displayEmplopyee";
		}
		else
		{
			throw new NullPointerException("Invalid Credentials");
		}
	}
	
}
