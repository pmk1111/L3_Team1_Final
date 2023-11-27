package com.naver.myhome.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.HandlerInterceptor;

import com.naver.myhome.domain.User;
import com.naver.myhome.service.EmployeeService;
import com.naver.myhome.service.UserService;

import lombok.NoArgsConstructor;

@NoArgsConstructor
public class EmployeeCheckInterceptor implements HandlerInterceptor {

    private EmployeeService employeeService;
    private UserService userService;

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        User currentUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String email = currentUser.getUsername();  // 이메일 정보 가져오기

        int userId = userService.getUserId(email);

        if (userId == 0 || (Integer)employeeService.getEmployeeId(userId) == null) {
            response.sendRedirect(request.getContextPath() + "/user/confirm");
            return false;
        }

        return true;
    }


}
