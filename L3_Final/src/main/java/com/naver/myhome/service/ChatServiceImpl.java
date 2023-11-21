package com.naver.myhome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.codec.ServerSentEvent;
import org.springframework.stereotype.Service;

import com.naver.myhome.controller.SSEController;
import com.naver.myhome.domain.Chat;
import com.naver.myhome.mybatis.mapper.ChatMapper;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Sinks;

@Service
public class ChatServiceImpl implements ChatService{
	
	private ChatMapper mapper;
    private final Sinks.Many<ServerSentEvent<String>> sink;

	@Autowired
	public ChatServiceImpl(ChatMapper mapper, SSEController sseController) {
		this.mapper = mapper;
        this.sink = sseController.getSink();
	}
	
	@Override
	public List<Chat> getChatList(int selectedRoomNum) {
		return mapper.getChatList(selectedRoomNum);
	}

    @Override
    public int insertChat(String resultText, int selectedRoomNum, int employeeId, int msgTo) {
        int result = mapper.insertChat(resultText, selectedRoomNum, employeeId, msgTo);

        // 메시지 추가 후 SSE 이벤트 발생
        sendChatRoomUpdateEvent();
        return result;
    }
	
    // 채팅방 목록 업데이트 이벤트를 발생시키는 메소드
    private void sendChatRoomUpdateEvent() {
        sink.tryEmitNext(ServerSentEvent.builder("ChatRoomUpdated").build());
    }


    // SSE 이벤트를 구독하는 메소드
    public Flux<ServerSentEvent<String>> getChatSSEEvents() {
        return sink.asFlux();
    }
}
