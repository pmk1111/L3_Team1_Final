package com.naver.myhome.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.myhome.domain.Mytotalwork;
import com.naver.myhome.service.MytotalworkService;

@Controller
@RequestMapping(value = "/total")
public class MytotalworkController {

	
	private static final Logger logger = LoggerFactory.getLogger(MytotalworkController.class);

	private MytotalworkService MytotalworkService;

	@Autowired
	public MytotalworkController(MytotalworkService MytotalworkService) {
	
		this.MytotalworkService = MytotalworkService;
	}
	
	@GetMapping(value = "/mywork")
	public ModelAndView issuelist(ModelAndView mv, HttpServletRequest request, Principal principal) {
		
		List<Mytotalwork> Mytotalworklist = MytotalworkService.getMytotalworkList();
		

		
		mv.setViewName("total/mywork");
		mv.addObject("Mytotalworklist" ,Mytotalworklist);
		return mv;
	}


	@ResponseBody
	@PostMapping("/mywork")
	public List<Mytotalwork> searchmytotalwork(@RequestParam String searchtitle) {
		return MytotalworkService.searchmytotalwork(searchtitle);
	}
}
