package com.naver.myhome.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.Chat;

@Mapper
public interface ChatMapper {
	
	public List<Chat> getChatList(int selectedRoomNum);
	
	public int insertChat(String resultText, int selectedRoomNum, int employeeId, int msgTo);
}
