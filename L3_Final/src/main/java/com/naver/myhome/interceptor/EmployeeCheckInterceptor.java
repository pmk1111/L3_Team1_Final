package com.naver.myhome.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.naver.myhome.domain.User;
import com.naver.myhome.service.EmployeeService;
import com.naver.myhome.service.UserService;

import lombok.NoArgsConstructor;

@NoArgsConstructor
public class EmployeeCheckInterceptor implements HandlerInterceptor {
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private UserService userService;
	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	
        String contextPath = request.getContextPath();
        String requestURI = request.getRequestURI();

        if (contextPath.equals(requestURI) || (contextPath + "/").equals(requestURI) 
        	|| (contextPath + "/home/home").equals(requestURI)) {
            return true;
        } else {
        	User currentUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        	String email = currentUser.getUsername(); 
        	Integer userId = userService.getUserId(email);
        	int employeeId = employeeService.getEmployeeId(userId);

        	if (employeeId == 0) {
        		response.sendRedirect(request.getContextPath() + "/user/confirm");
        		return false;
        	}
        	
        }
        return true;
    }


}
