package com.naver.myhome.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.myhome.domain.Bookmark;
import com.naver.myhome.domain.User;
import com.naver.myhome.service.BookmarkService;


@Controller
@RequestMapping(value = "/bookmark")
public class BookmarkController {

	private static final Logger logger = LoggerFactory.getLogger(BookmarkController.class);

	private BookmarkService bookmarkService;
	
	

	@Autowired
	public BookmarkController(BookmarkService bookmarkService) {
		this.bookmarkService = bookmarkService;
		
	}

	@ResponseBody
	@PostMapping(value = "/bookmark")
	public int Bookmark(@AuthenticationPrincipal User user,@RequestParam ("issueId") int issueId ) {

		int userId = user.getId();
		
		int result = bookmarkService.checkBookmark(userId, issueId);
		System.out.println("컨트롤러 결과보기"+result);
		
		if(result == 0) {
			bookmarkService.addBookmark(userId, issueId);
			return 1;
		} else {
			bookmarkService.deleteBookmark(userId, issueId);
			return -1;
		}
	
		
	}
	@ResponseBody
	@GetMapping(value = "/bookmark-list")
	public ModelAndView issuelist(ModelAndView mv, @AuthenticationPrincipal User user ) {
		int userId = user.getId();
		logger.info("여기는 이슈리스트이 북마크 아이디"+userId);
		int bookmarkCount = bookmarkService.countBookmark(userId);
		logger.info("여기는 이슈리스트이 북마크 카운트"+bookmarkCount);
		List<Bookmark> bookmarkList = bookmarkService.getBookmarkList(userId);
		logger.info("여기는 이슈리스트이 북마크 리스트"+bookmarkList);
		mv.setViewName("bookmark/bookmark");
		mv.addObject("bookmarkList", bookmarkList);
		mv.addObject("bookmarkCount" ,bookmarkCount);
		return mv;
	}
	
}
