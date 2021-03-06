package com.skillstorm.controllers;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.skillstorm.javabeans.TimeSheet;
import com.skillstorm.javabeans.User;
import com.skillstorm.service.UserService;

public class UserController {

	UserService user = new UserService();

	public void getUser(HttpServletRequest req, HttpServletResponse resp)
			throws NumberFormatException, JsonProcessingException, IOException {

		resp.setContentType("application/json");

		System.out.println("User Controller, get user called");

		if (req.getParameter("userName") != null && req.getParameter("password") != null) {
			try {

				resp.getWriter().println(new ObjectMapper().writeValueAsString(
						user.verifyAndGetUser(req.getParameter("userName"), req.getParameter("password"), resp)));
				resp.setStatus(201);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				resp.setStatus(401);

			}

		}

	}

	public void postUser(HttpServletRequest req, HttpServletResponse resp)
			throws JsonParseException, JsonMappingException, IOException {
		resp.setContentType("application/json");
		System.out.println("User Controller");
		resp.getWriter().println((new ObjectMapper().writeValueAsString(
				user.verifyAndGetUserByUserObj(new ObjectMapper().readValue(req.getInputStream(), User.class)))));

	}

}