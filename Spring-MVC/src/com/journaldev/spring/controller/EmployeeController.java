package com.journaldev.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.journaldev.spring.dao.EmployeeDAOImpl;
import com.journaldev.spring.forms.EmployeeForm;
import com.journaldev.spring.model.Employee;

/**
 * @author Ravitosh
 * 
 * Controller for Employee view screen.
 *
 */
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
		
		model.addAttribute("employeeForm", new EmployeeForm());
		
		return "employee";
	}
	
	/**
	 * Loads employee records from database and displays on view screen
	 * @return
	 * @throws JsonProcessingException
	 */
	@RequestMapping(value="/loadAllEmployees", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String searchEmployee() throws JsonProcessingException
	{
		String employeeListJson="";
		
		/*getting employee list from database*/
		List<Employee> employeeList = employeeDAO.list();
		
		ObjectMapper localObjectMapper = new ObjectMapper();
		employeeListJson= localObjectMapper.writeValueAsString(employeeList);		
		
		return employeeListJson;
	}
}
