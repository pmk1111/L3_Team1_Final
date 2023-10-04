package com.naver.myhome.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/mainboard")
public class MainboardController {
	
	@RequestMapping(value = "/MyDashboard", method = RequestMethod.GET)
	public String myDashboard() {
		return "mainboard/MyDashboard";
	}
	
	@RequestMapping(value = "/AdminDashboard", method = RequestMethod.GET)
	public String AdminDashboard() {
		return "mainboard/AdminDashboard";
	}
}
