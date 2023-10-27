package com.naver.myhome.controller;



import java.io.File;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.naver.myhome.service.DocumentsService;
import com.naver.myhome.service.IssueService;

@Controller
@RequestMapping(value = "/documents")
public class DocumentsController {
	private static final Logger logger= LoggerFactory.getLogger(DocumentsController.class);
	
	
	private IssueService issueService;
	private DocumentsService documentsService;
	
	@Autowired
	public DocumentsController(DocumentsService documentsService, IssueService issueService) {
		
	}
	
	
	@RequestMapping(value = "/documents-list", method = RequestMethod.GET)
	public String documentslist() {
		
		return "documents/documents-list";
	}
}
