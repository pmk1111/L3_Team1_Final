package com.naver.myhome.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.ChatRoom;

@Mapper
public interface ChatRoomMapper {
	
	public ChatRoom getChatRoomInfo(int employeeId, int participant);
	
	public List<ChatRoom> getChatRoomList(int employeeId);
	
	public int createChatRoom(int employeeId, int participant);
	
	public void updateResentContent(String resultText, int selectedRoomNum);
}
