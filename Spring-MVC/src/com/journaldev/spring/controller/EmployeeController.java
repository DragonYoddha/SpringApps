package com.journaldev.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationConfig;
import com.journaldev.spring.dao.EmployeeDAOImpl;
import com.journaldev.spring.forms.LoginForm;
import com.journaldev.spring.forms.EmployeeForm;
import com.journaldev.spring.model.Employee;

@Controller
public class EmployeeController {

	@Autowired
	EmployeeDAOImpl employeeDAO;

	public EmployeeDAOImpl getEmployeeDAO() {
		return employeeDAO;
	}

	public void setEmployeeDAO(EmployeeDAOImpl employeeDAO) {
		this.employeeDAO = employeeDAO;
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws JsonProcessingException 
	 */
	@RequestMapping(value = "/displayEmplopyee")
	public String home(Model model) throws JsonProcessingException {
		String employeeListJson="";
		List<Employee> employeeList = employeeDAO.list();
		System.out.println(employeeList);
		
		ObjectMapper localObjectMapper = new ObjectMapper();
		employeeListJson= localObjectMapper.writeValueAsString(employeeList);
		model.addAttribute("employeeList", employeeListJson);
		model.addAttribute("employeeForm", new EmployeeForm());
		
		return "employee";
	}
	
	@RequestMapping(value="/search",method = RequestMethod.GET)
	public String searchEmployee(@ModelAttribute("employeeForm")EmployeeForm form,Model model)
	{
		String gridSearchField = form.getGridSearchFields();
		
		
		return null;
	}
}
