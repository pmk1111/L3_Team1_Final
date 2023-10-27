package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.ChatRoom;

public interface ChatRoomService {
	
	public ChatRoom getChatRoomInfo(int employeeId, int participant);
	
	public List<ChatRoom> getChatRoomList(int employeeId);

	public int createChatRoom(int employeeId, int participant);

	public void updateResentContent(String resultText, int selectedRoomNum);

}
