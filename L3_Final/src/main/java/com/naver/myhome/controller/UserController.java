package com.naver.myhome.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.myhome.domain.User;
import com.naver.myhome.service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/user")
public class UserController {


	//지니
	private UserService userservice;
	
	@Autowired
	public UserController(UserService userservice) {
		this.userservice = userservice;
	}
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
//    public ModelAndView user_update(Principal principal, ModelAndView mv) {
//          String id =S principal.getName();
//        
//       if (id == null) {
//          mv.setViewName("redirect:login");
//          
//       } else {
//          User user= userservice.user_info(id);
//          mv.setViewName("user/profile");
//          mv.addObject("userinfo",user);
//       }
	public String update() {
       return "user/profile";
    }
	
	// 수정처리
	   @RequestMapping(value = "/updateProcess", method = RequestMethod.POST)
	   public String updateProcess(User user, Model model, HttpServletRequest request, RedirectAttributes rattr) {

	      int result = userservice.update(user);
	      if (result == 1) {
	         rattr.addFlashAttribute("result", "updateSuccess");
	         return "redirect:/board/list";
	      } else {
	         model.addAttribute("url", request.getRequestURL());
	         model.addAttribute("message", "정보 수정 실패");
	         return "error/error";

	      }

	   }
	   
	   //파일 저장 경로
//	   @Value("${file.path}")
//	   	private String fileRealPath;
//	   
//	   @RequestMapping(value = "/list")
//	   public ModelAndView memberList(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
//	         @RequestParam(value = "limit", defaultValue = "3", required = false) int limit, ModelAndView mv,
//	         @RequestParam(value = "search_field", defaultValue = "1", required = false) int index,
//	         @RequestParam(value = "search_word", defaultValue = "", required = false) String search_word) {
//
//	      int listcount = userservice.getSearchListCount(index, search_word);
//	      List<User> list = userservice.getSearchList(index, search_word, page, limit);
//
//	      // 총 페이지 수
//	      int maxpage = (listcount + limit - 1) / limit;
//
//	      // 현재 페이지에 보여줄 시작 페이지 수 (1, 11, 21 등...)
//	      int startpage = ((page - 1) / 10) * 10 + 1;
//
//	      // 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 등...)
//	      int endpage = startpage + 10 - 1;
//
//	      if (endpage > maxpage)
//	         endpage = maxpage;
//	      mv.setViewName("user/user_list");
//	      mv.addObject("page", page);
//	      mv.addObject("maxpage", maxpage);
//	      mv.addObject("startpage", startpage);
//	      mv.addObject("endpage", endpage);
//	      mv.addObject("listcount", listcount);
//	      mv.addObject("memberlist", list);
//	      mv.addObject("search_field", index);
//	      mv.addObject("search_word", search_word);
//	      return mv;
//
//	   }
//	   
//	   @RequestMapping(value = "/info", method = RequestMethod.GET)
//	   public ModelAndView member_info(@RequestParam("id") 
//	                           String id,
//	                           ModelAndView mv,
//	                           HttpServletRequest request) {
//	        
//	      User m = userservice.user_info(id);
//	      //m=null;//오류 확인하는 값
//	      if (m!= null) {
//	         mv.setViewName("member/member_info");
//	         mv.addObject("memberinfo", m);
//	      } else {
//	         mv.addObject("url", request.getRequestURL());
//	         mv.addObject("message","해당 정보가 없습니다.");
//	         mv.setViewName("error/error");
//	         
//	      }
//	      return mv;
//	   }
//	   
//	   @RequestMapping(value= "/delete", method = RequestMethod.GET)
//	      public String member_delete(String id ) {
//	         
//		   userservice.delete(id);
//	         return "redirect:list";
//	      }
//	
	//지니 끝

	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "user/join";
	}
	@RequestMapping(value = "/join2", method = RequestMethod.GET)
	public String join2() {
		return "user/join2";
	}
	@RequestMapping(value = "/confirm", method = RequestMethod.GET)
	public String confirm() {
		return "user/confirm";
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "user/login";
	}

	
}
