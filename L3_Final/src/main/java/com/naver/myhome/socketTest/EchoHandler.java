package com.naver.myhome.socketTest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.server.ServerEndpoint;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
@ServerEndpoint(value = "/echo.do")
public class EchoHandler {
    private static final Map<String, List<Session>> rooms = new HashMap<>();
    private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);

    @OnOpen
    public void onOpen(Session session) {
        logger.info("Open session id:" + session.getId());
        String queryString = session.getQueryString();
        String roomNum = queryString.substring(queryString.indexOf("=") + 1);
        logger.info("입장한 방 = " + roomNum);

        // 이 세션의 기존 방 목록에서 제거
        for (Map.Entry<String, List<Session>> entry : rooms.entrySet()) {
            entry.getValue().remove(session);
        }

        // 방이 없을 경우 새로운 방 생성
        if (!rooms.containsKey(roomNum)) {
            rooms.put(roomNum, new ArrayList<>());
        }

        rooms.get(roomNum).add(session);

        for (Session s : rooms.get(roomNum)) {
            logger.info("참여자 : " + s.getId() + " 참여 중인 방 : " + roomNum);
        }
    }


    @OnMessage
    public void onMessage(String getMessage, Session session) {
        logger.info("onMessage : " + session.getId());
        logger.info("onMessage : " + getMessage);
        int index = getMessage.lastIndexOf(",");
        String input = getMessage.substring(0, index);
        String sender = getMessage.substring(index + 1);
        logger.info("Message From " + sender + ": " + input);

        String queryString = session.getQueryString();
        String roomNum = queryString.substring(queryString.indexOf("=") + 1);

        // 같은 방에 있는 사용자에게 메시지 전송
        List<Session> roomSessions = rooms.get(roomNum);
        if (roomSessions != null) {
            for (Session s : roomSessions) {
                if (!session.getId().equals(s.getId())) {
                    try {
                        s.getBasicRemote().sendText(sender + ">" + input);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }

    @OnError
    public void onError(Throwable e, Session session) {
        logger.info("error입니다.");
    }

    @OnClose
    public void onClose(Session session) {
        logger.info("Session " + session.getId() + " has ended");

        String queryString = session.getQueryString();
        String roomNum = queryString.substring(queryString.indexOf("=") + 1);

        if (rooms.containsKey(roomNum)) {
            rooms.get(roomNum).remove(session);
            if (rooms.get(roomNum).isEmpty()) {
                rooms.remove(roomNum);
            }
        }
    }
}
