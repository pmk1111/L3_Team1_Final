package com.naver.myhome.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuthenticationInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String contextPath = request.getContextPath();
        String requestURI = request.getRequestURI();
//        System.out.println("요청 경로는=" + requestURI);

        if (contextPath.equals(requestURI) || (contextPath + "/").equals(requestURI) 
        	|| (contextPath + "/home/home").equals(requestURI)) {
            return true;
        }
    	
        if (request.getUserPrincipal() == null) {
            response.sendRedirect(request.getContextPath() + "/user/login");
            return false;
        }
        return true;
    }
}

