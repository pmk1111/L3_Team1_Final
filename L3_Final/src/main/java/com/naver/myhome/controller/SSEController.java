package com.naver.myhome.controller;

import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.codec.ServerSentEvent;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Sinks;


@RestController
public class SSEController {

    private final Sinks.Many<ServerSentEvent<String>> sink;

    public SSEController() {
        this.sink = Sinks.many().multicast().onBackpressureBuffer();
    }

    @GetMapping("/subscribe")
    public ResponseEntity<Flux<ServerSentEvent<String>>> subscribe() {
        Flux<ServerSentEvent<String>> eventFlux = sink.asFlux();
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_TYPE, MediaType.TEXT_EVENT_STREAM_VALUE)
                .body(eventFlux);
    }

    // 채팅방 목록 업데이트 이벤트를 전송하는 메소드
    public void sendChatRoomUpdateEvent() {
        sink.tryEmitNext(ServerSentEvent.builder("ChatRoomUpdated").build());
    }
    
    // Sinks.Many<ServerSentEvent<String>> 빈을 반환하는 메소드
    public Sinks.Many<ServerSentEvent<String>> getSink() {
        return sink;
    }
}



