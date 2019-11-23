package com.skillstorm.clockwork.service;

import java.util.Set;

import com.skillstorm.clockwork.beans.Employee;
import com.skillstorm.clockwork.data.UserDao;

public class EmployeeService {

	private UserDao userDao = new UserDao();

	public Set<Employee> getEmployeeName(String UserName) {
		return userDao.getEmployeeName(UserName);
	}

}
