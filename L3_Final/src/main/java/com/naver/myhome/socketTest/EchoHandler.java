package com.naver.myhome.socketTest;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;

import javax.websocket.Session;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

@Service
@ServerEndpoint(value="/echo.do")//클라이언트가 접속할 서버 주소
public class EchoHandler {
    private static final List<Session> sessionList=new ArrayList<Session>();
    private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);
    public EchoHandler() {
    	logger.info("웹소켓(서버) 객체생성");
    }    

    @OnOpen
    public void onOpen(Session session, @PathParam("roomNum") String roomNum) {
        logger.info("Open session id:"+session.getId());
        try {
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        sessionList.add(session);
    }

    private void sendAllSessionToMessage(Session self,String sendMessage) {
        try {
            for(Session session : EchoHandler.sessionList) {
                if(!self.getId().equals(session.getId())) {
                    session.getBasicRemote().sendText(sendMessage);
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    @OnMessage
    public void onMessage(String getMessage,Session session) {
 
    	logger.info("onMessage : "+session.getId());
    	logger.info("onMessage : "+getMessage);
    	int index = getMessage.lastIndexOf(","); 
    	String input = getMessage.substring(0,index); 
    	String sender=getMessage.substring(index+1);
        logger.info("Message From "+sender + ": "+ input);
        try {
//            session.getBasicRemote().sendText("나>" + input);
        }catch (Exception e) {
           e.printStackTrace();
        }
        String message = sender + ">" + input;
        sendAllSessionToMessage(session, message); 
    }

	@OnError
    public void onError(Throwable e,Session session) {
		logger.info("error입니다.");
    }
    
    @OnClose
    public void onClose(Session session) {
        logger.info("Session "+session.getId()+" has ended");
        sessionList.remove(session);
    }
}






 
