package com.naver.myhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.ChatRoom;
import com.naver.myhome.mybatis.mapper.ChatRoomMapper;

@Service
public class ChatRoomServiceImpl implements ChatRoomService{

	private ChatRoomMapper mapper;
	
	@Autowired
	public ChatRoomServiceImpl(ChatRoomMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public ChatRoom getChatRoomInfo(int employeeId, int participant) {
		return mapper.getChatRoomInfo(employeeId, participant);
	}
	
	@Override
	public List<ChatRoom> getChatRoomList(int employeeId) {
		return mapper.getChatRoomList(employeeId);
	}
	
	
	@Override
	public int createChatRoom(int employeeId, int participant) {
		return mapper.createChatRoom(employeeId, participant);
	}

	@Override
	public void updateResentContent(String resultText, int selectedRoomNum) {
		mapper.updateResentContent(resultText, selectedRoomNum);
	}


}
