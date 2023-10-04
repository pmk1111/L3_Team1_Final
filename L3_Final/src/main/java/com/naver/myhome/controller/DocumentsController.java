package com.naver.myhome.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/documents")
public class DocumentsController {
	
	@RequestMapping(value = "/documentslist", method = RequestMethod.GET)
	public String documentslist() {
		return "documents/documentslist";
	}
}
