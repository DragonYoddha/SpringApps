package com.journaldev.spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController 
{
	@RequestMapping("/errors")
	public String renderErrorPage(HttpServletRequest httpRequest)
	{
		return "error";
	}
}
