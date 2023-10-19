package com.naver.myhome.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.myhome.domain.Access;
import com.naver.myhome.domain.Company;
import com.naver.myhome.domain.Employee;
import com.naver.myhome.domain.User;
import com.naver.myhome.service.AdminService;
import com.naver.myhome.service.UserService;
import com.naver.myhome.task.SendMail;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

      private static final Logger logger = LoggerFactory.getLogger(IssueController.class);
      //지니
      private AdminService adminService;
      private UserService userService;
      private SendMail sendMail;
      private PasswordEncoder passwordEncoder;
      
      @Autowired
      public AdminController(AdminService adminService, UserService userService, SendMail sendMail, PasswordEncoder passwordEncoder) {
         this.adminService = adminService;
         this.userService = userService;
         this.sendMail = sendMail;
         this.passwordEncoder = passwordEncoder;
      }
      
      
      @ResponseBody
      @GetMapping(value = "/companyinfo")
      public ModelAndView companyInfo(ModelAndView mv, String companyName, String companyDomain) throws Exception{
          int companyId = 1;
        
          
//             Company company = adminService.companyInfo(companyId);
//             mv.addObject("companyinfo", company);
             
             String name = adminService.companyName(companyId);
             String domain = adminService.companyDomain(companyId);
             
             mv.addObject("companyName", name);
             mv.addObject("companyDomain", domain);
             mv.setViewName("admin/company-info");
               return mv;
         }

          
       @ResponseBody
       @PostMapping(value = "/updateName")
       public HashMap <String, String> updateName(ModelAndView mv, @RequestParam("companyId") int companyId,
                   @RequestParam(value = "companyName", defaultValue="", required =false) String companyName, @RequestParam(value="companyDomain", defaultValue="", required =false)  String companyDomain) {
          HashMap <String, String> map = new  HashMap <String, String>();
             if(companyDomain .equals ("")) {
              // 회사명 업데이트
              int updateName = adminService.updateName(companyId, companyName);
              if (updateName > 0) {
                  // 업데이트 성공
                 String afterName = adminService.companyName(companyId);;
                  map.put("afterName", afterName);
                  
                  map.put("message", "회사명이 성공적으로 업데이트되었습니다.");
              } else {
                  // 업데이트 실패
                 map.put("error", "회사명 업데이트 중 오류가 발생했습니다.");
               }
             } else {
                 int updateDomain = adminService.updateDomain(companyId, companyDomain);
                 if (updateDomain > 0) {
                        // 업데이트 성공
                       String afterDomain = adminService.companyName(companyId);;
                        map.put("afterName", afterDomain);
                        
                        map.put("message", "전용 url이 성공적으로 업데이트되었습니다.");
                    } else {
                        // 업데이트 실패
                       map.put("error", "전용 url 업데이트 중 오류가 발생했습니다.");
                     }
             }
              return map;
       }
              



      //비밀번호 변경
       @PostMapping(value = "/change-pwd" )
       public String changePwd() {
   		return "/admin/change-pwd";
   	}
       
       //비밀번호 확인 처리
       @ResponseBody
   	   @PostMapping(value="/changePwd")
       public String checkPwd(@RequestParam Map<String, Object> paramMap,
    		   				  @ModelAttribute("loginCompany") Company company,
    		   				  RedirectAttributes rattr) {
    	   
    	   paramMap.put("companyId", company.getId());
    	   
    	   int result = adminService.changePwd(paramMap);
    	   
    	   String message = null;
    	   String path = null;
    	   
    	   if(result > 0) {
    		   message = "비밀번호 변경 성공";
    		   path = "info";
    	   } else {
    		   message = "현재 비밀번호가 일치하지 않음.";
    		   path = "changePwd";
    	   }
    	   rattr.addFlashAttribute("message",message);
    	   return "redirect:"+path;
    	   
    
   	}
   	
       

      @GetMapping(value = "/list")
      public ModelAndView employeeList( ModelAndView mv){
         int companyId = 1; //회사번호
         int companyInvited= 1 ;//직원 초대
         
         
          // 회사의 직원 목록을 가져와서 모델에 추가
          List<Employee> employee = adminService.findEmployee(companyId);
          int countValue = adminService.countEmployee(companyId);
          mv.addObject("employee", employee);
          mv.addObject("employeeCount", countValue);
          
          System.out.println(countValue);
   
          //회사의 이용 중지 직원 목록
          List<Employee> stopEmployee = adminService.stopEmployee(companyId);
          int countStopValue = adminService.countStopEmployee(companyId);
          mv.addObject("stopEmployee", stopEmployee);
          mv.addObject("stopEmployeeCount", countStopValue);
          
          System.out.println(countStopValue);
            
          // 유저 목록을 가져와서 모델에 추가
          List<User> user = userService.findUser(companyInvited);
          int count = userService.countUser(companyInvited);
          mv.addObject("user", user);
          mv.addObject("count", count);
          mv.setViewName("admin/employee-list");
          
          System.out.println(count);
          
        
            
          return mv;
      }
      
      //직원 상태 업데이트 
         @ResponseBody
         @PostMapping(value = "/update-employeeStatus")
         public int updateEmployeeStatus(@RequestParam("employeeId") int employeeId,
                   @RequestParam("employeeStatus") int employeeStatus,
                   @RequestParam("tab") String tab,
               Model model, HttpServletRequest request, RedirectAttributes rattr) {
            
               int result = 0;
               
               if ("useruse".equals(tab)) { //정상 -> 이용중지
                
                    result = adminService.stopEmployeeStatus(employeeId);
                 
               } else if ("userstop".equals(tab)) { //이용중지 -> 정상
                  
                       result = adminService.useEmployeeStatus(employeeId);
                    
               }
                 System.out.println(result);
                 
                return result;
         } 



      //관리자 유무 
      @ResponseBody
      @PostMapping(value = "/employee-auth")
      public int employeeAuth(@RequestParam("employeeId") int employeeId,
                         @RequestParam("employeeAuth") String employeeAuth,
                         @RequestParam("tab") String tab,
            Model model, HttpServletRequest request, RedirectAttributes rattr) {
         
            int result = 0;
            
             if ("userstop".equals(tab)) {
                if(employeeAuth.equals("Y")) {
                   result=adminService.noMoreAuth(employeeId);
                }else if(employeeAuth.equals("N")) {
                   result = adminService.addAuth(employeeId);
                }
             }else if("useruse".equals(tab)) {
                if(employeeAuth.equals("Y")) {
                   result=adminService.noMoreAuth(employeeId);
                }else if(employeeAuth.equals("N")) {
                   result = adminService.addAuth(employeeId);
                }
             }
              System.out.println(result);
              
             return result;
      } 
      
      //가입대기
      @ResponseBody
      @PostMapping(value = "/wait-reg")
      public int regWait(@RequestParam("userId") int userId,
                     @RequestParam("action") String action,
            Model model, HttpServletRequest request, RedirectAttributes rattr) {
            int companyInvited=1;
            int companyId = 1;
            
            int result = 0;
             
            
            if("approve".equals(action)) {
               result = userService.approveUser(userId);
               
                if (result == 1) {
                      int addEmployee = adminService.addEmployee(userId,companyId);
                      return addEmployee;
                    }
               
            }else if("reject".equals(action)) {
               result = userService.rejectUser(userId);
            }
            
            
           
            System.out.println(result);
            
            return result;
            
      }

      //정상리스트 가져오기
      @ResponseBody
      @PostMapping(value = "/user-uselist")
      public List<Employee> userUseList(@RequestParam("companyId")  int companyId){

          logger.info("여기는 user-uselist 컨트롤러");

         
         // 회사의 직원 목록을 가져와서 모델에 추가
          List<Employee> employee = adminService.findEmployee(companyId);
           
          
          return employee;
         
      }
      
      //이용중지 리스트 가져오기
      @ResponseBody
      @PostMapping(value = "/user-stoplist")

      public List<Employee> userStopList(@RequestParam("companyId")  int companyId){

          
         
         // 회사의 직원 목록을 가져와서 모델에 추가
          List<Employee> stopEmployee = adminService.stopEmployee(companyId);
          
          return stopEmployee;
         
      }

      
      @GetMapping(value = "/invite")
      public String invite(Company company, RedirectAttributes rattr, Model model, HttpServletRequest request) {
            
         
             return "admin/invite-employee";
          }
      
      
      
      
      @GetMapping(value = "/wait-approve")
      public String regwait() {
             return "admin/wait-approve";
          }
         
         

   //
      @PostMapping(value="/sendMail")
      public String sendMail(String[] invite_box1) {
         String companyName = "widUs";
         String companyDomain = "example@widus.com";
               
         for (String box: invite_box1) {
            if(!box.equals(""))
            sendMail.sendInviteEmail(box,companyName,companyDomain);
         }
         return "admin/invite-employee";
         
      }

      

      //지니 끝
      
      @GetMapping(value="/admin-dashboard")
      public String adminDashboard() {
         return "admin/AdminDashboard";
      }
      /* 혜원 */
      @GetMapping(value = "/project-access-stats")
      public String projectAccessStats(ModelAndView mv, HttpServletRequest request) {
         

         
           List<Access> Access = adminService.getAccesslist();
           
           
           
           
           
           
           mv.addObject("Access" ,Access);
          
          
      
      

         return "project/project-access-stats";
      }
      

   }

