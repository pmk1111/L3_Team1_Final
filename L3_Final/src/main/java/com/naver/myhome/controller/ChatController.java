package com.naver.myhome.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naver.myhome.domain.Chat;
import com.naver.myhome.domain.ChatRoom;
import com.naver.myhome.domain.Employee;
import com.naver.myhome.domain.User;
import com.naver.myhome.service.ChatRoomService;
import com.naver.myhome.service.ChatService;
import com.naver.myhome.service.EmployeeService;
import com.naver.myhome.service.UserService;

@Controller
public class ChatController {

	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	private UserService userService;
	private EmployeeService employeeService;
	private ChatService chatService;
	private ChatRoomService chatRoomService;

	@Autowired
	public ChatController(EmployeeService employeeService, UserService userService,
			ChatRoomService chatRoomService, ChatService chatService) {
		this.employeeService = employeeService;
		this.userService = userService;
		this.chatService = chatService;
		this.chatRoomService = chatRoomService;
	}


	@RequestMapping(value = "/chatView", method = RequestMethod.GET)
	public String login_ok(Model m, Principal principal,HttpServletRequest request) {
		logger.info("요청한 url2=" + request.getRequestURL());
		int end = request.getRequestURL().lastIndexOf("/");
		String url = request.getRequestURL().substring(7, end);
		//http://와 마지막 / 사의의 url 주소를 가져온다.

		logger.info("url=" + url);
		m.addAttribute("url",url);
		m.addAttribute("name", principal.getName());
		return "chat/chat";
	}

	@GetMapping("/get-chat-employee-list")
	@ResponseBody
	public List<Employee> getChatList(Principal principal){
		String userEmail = principal.getName();
		int userId = userService.getUserId(userEmail);
		
		List<Employee> employeeList = employeeService.getEmployeeListForChat(userId);

		for(Employee list : employeeList) {
			logger.info("가져온 사용자 정보"+list);
		}
		return employeeList;
	} 
	
	@GetMapping("/get-chat-room-list")
	@ResponseBody
	public List<ChatRoom> getChatRoomList(Principal principal){
		String userEmail = principal.getName();
		int userId = userService.getUserId(userEmail);
		
		int employeeId = employeeService.getEmployeeId(userId);
		logger.info("가져온 내 직원 id = " + employeeId);
		
		List<ChatRoom> chatRoomList = chatRoomService.getChatRoomList(employeeId);
		for(ChatRoom room: chatRoomList) {
			logger.info("가져온 채팅방 정보 = " + room);
		}
		
		return chatRoomList;
	}
	
	@PostMapping("/create-room")
	@ResponseBody
	public boolean createRoom(@RequestParam int participant, Principal principal) {
		String userEmail = principal.getName();
		int userId = userService.getUserId(userEmail);
		
		logger.info("가져온 사용자 정보 = " + userId);
		logger.info("가져온 참여자 정보 = " + participant);
		
		int employeeId = employeeService.getEmployeeId(userId);
		logger.info("가져온 내 직원 id = " + employeeId);
		
		ChatRoom chatRoom = chatRoomService.getChatRoomInfo(employeeId, participant);
		logger.info("가져온 채팅방 정보 = " + chatRoom);
		
		int getResult=0;
		if(chatRoom == null) {
			getResult = chatRoomService.createChatRoom(employeeId, participant);
		}
		logger.info("createRoom 결과 = " + getResult);
		
		boolean result = false;
		if(getResult == 1) {
			result = true;
		} else if(getResult == 0) {
			result = false;
		}
		
		return result;
	}
	
	@GetMapping("/get-room-num")
	@ResponseBody
	public int getRoomNum(@RequestParam int participant, Principal principal) {
		String userEmail = principal.getName();
		int userId = userService.getUserId(userEmail);
		
		logger.info("가져온 사용자 정보 = " + userId);
		
		int employeeId = employeeService.getEmployeeId(userId);
		logger.info("가져온 safasfasfsa 직원 id = " + employeeId);
		logger.info("가져온 참여자 정보 = " + participant);
		
		ChatRoom chatRoom = chatRoomService.getChatRoomInfo(employeeId, participant);
		int selectedRoomNum = chatRoom.getId();
		logger.info("가져온 채팅방은...?? = " + selectedRoomNum);
		
		return selectedRoomNum;
	}
	
	@GetMapping("/get-chat-list")
	@ResponseBody
	public List<Chat> getChatList(@RequestParam int msgTo, Principal principal){
		String userEmail = principal.getName();
		int userId = userService.getUserId(userEmail);
		
		logger.info("가져온 사용자 정보 = " + userId);
		
		int employeeId = employeeService.getEmployeeId(userId);
		logger.info("가져온 safasfasfsa 직원 id = " + employeeId);
		logger.info("가져온 참여자 정보 = " + msgTo);
		
		ChatRoom chatRoom = chatRoomService.getChatRoomInfo(employeeId, msgTo);
		int selectedRoomNum = chatRoom.getId();
		logger.info("가져온 채팅방은...?? = " + selectedRoomNum);
		
		List<Chat> chatList = chatService.getChatList(selectedRoomNum);
		for(Chat chat : chatList) {
			logger.info("가져온 채팅 리스트" + chat);
		}
		
		return chatList;
		
	}
	
	@PostMapping("/insert-chat")
	@ResponseBody
	public boolean insertChat(Principal principal, @RequestParam String resultText, @RequestParam int msgTo) {
		
		String userEmail = principal.getName();
		int userId = userService.getUserId(userEmail);
		 
		int employeeId = employeeService.getEmployeeId(userId);
		logger.info("가져온 내 직원 id = " + employeeId);
		
		ChatRoom chatRoom = chatRoomService.getChatRoomInfo(employeeId, msgTo);
		int selectedRoomNum = chatRoom.getId();
		logger.info("선택한 채팅방 번호 = " + selectedRoomNum);
		
		logger.info("보낼 메시지 = " + resultText);
		logger.info("메시지 받는 사람 = " + msgTo);
		int sqlResult = chatService.insertChat(resultText, selectedRoomNum, employeeId, msgTo);
		
		boolean result = false;
		if(sqlResult == 1) {
			result = true;
			chatRoomService.updateResentContent(resultText, selectedRoomNum);
		} else {
			result = false;
		}
		
		return result;
	}
}
