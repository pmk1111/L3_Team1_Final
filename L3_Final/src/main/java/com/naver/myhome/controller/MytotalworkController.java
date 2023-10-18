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

	private MytotalworkService myTotalWorkService;

	@Autowired
	public MytotalworkController(MytotalworkService myTotalWorkService) {
	
		this.myTotalWorkService = myTotalWorkService;
	}
	
	
	@GetMapping(value = "/mywork")
	public ModelAndView myTotalWorks(ModelAndView mv, HttpServletRequest request, Principal principal,@RequestParam(value="search_word" , defaultValue="", required=false)
	   String search_word
	   ) {
		
	//	List<Mytotalwork> myTotalWorks = myTotalWorkService.getMyTotalWorks();
		List<Mytotalwork> myTotalWorks = myTotalWorkService.getSearchList(search_word);
		


		
		
		mv.addObject("myTotalWorks" ,myTotalWorks);
		mv.addObject("search_word",search_word);
		
	   
		mv.setViewName("total/mywork");
		return mv;
	}


	/*
	 * @ResponseBody
	 * @GetMapping("/mywork") public List<Mytotalwork>
	 * searchMyTotalWork(@RequestParam String searchtitle) { return
	 * myTotalWorkService.searchMyTotalWork(searchtitle); }
	 */
}
