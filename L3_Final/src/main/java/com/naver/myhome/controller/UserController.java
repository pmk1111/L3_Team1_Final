package com.naver.myhome.controller;

import java.security.Principal;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.myhome.domain.User;
import com.naver.myhome.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {


   //주영
   private PasswordEncoder passwordEncoder;
  
   private UserService userService;
  
   @Value("${my.savefolder}")
	private String savefolder;
   
   @Autowired
   public UserController(UserService userService,PasswordEncoder passwordEncoder) {
      this.userService = userService;
      this.passwordEncoder= passwordEncoder;
   }
   //지니
	@GetMapping(value = "/profile")
    public ModelAndView userUpdate(Principal principal, ModelAndView mv) {
        String email = principal.getName();
        System.out.println("----------------------------------------------------"+email);
       if (email == null) {
          mv.setViewName("redirect:login");
          
       } else {
          User user= userService.userInfo(email);
          mv.setViewName("user/profile");
          mv.addObject("userinfo",user);
       
      
       }
       return mv;
	}  

	@PostMapping(value = "/update-process")
	public String userUpdate(User user, Model model, HttpServletRequest request,
	                         RedirectAttributes rattr) {
			      

	    int result = userService.update(user);
	    System.out.println(result);
	    if (result > 0) {
	        rattr.addFlashAttribute("result", "success");
	        return "redirect:/user/profile";
	    } else {
	    	 model.addAttribute("url", request.getRequestURL());
	         model.addAttribute("message", " 업데이트 되지 않았습니다.");
	         return "error/error";
	      }
	    
	}

    	
    	@GetMapping(value = "/change-pwd" )
   		public String changePwd(Principal principal, Model model) {
   		    if (principal != null) {
   		    	String email = principal.getName();
   		    	System.out.println("체인지페이지========================"+email);
   		        model.addAttribute("email", email);
   		        return "user/change-pwd";
   		    } else {
   		        return "redirect:/user/login"; 
   		    }
   		}

    	//비밀번호 변경
   		@PostMapping(value = "/check-pwd")
   		@ResponseBody
   	    public int checkPwd(Principal principal,User user, 
   	    					@RequestParam("usedPwd") String usedPwd) throws Exception {
   			String email = principal.getName();
   			System.out.println(email);
   		
   			String hashedPasswordInDB = userService.checkPwd(email);
   			System.out.println("비밀번호 체크 userPwd=" + hashedPasswordInDB);
    	
    		 	if (hashedPasswordInDB == null || !BCrypt.checkpw(usedPwd, hashedPasswordInDB)) {
    			    return 0; 
    			}
    		 		return 1;
    			}
   		


   		@PostMapping(value="/Update-pwd" )
   		public String updatePwd(@RequestParam("email") String email,  @RequestParam("newPwd") String newPwd, @RequestParam("checkPwd") String checkPwd,
   								RedirectAttributes rattr, HttpSession session){
   			userService.updatePwd(email,newPwd);
   			session.invalidate();
   			rattr.addFlashAttribute("msg", "정보 수정이 완료되었습니다. 다시 로그인해주세요.");
   			
   			return "redirect:/user/login";
   		}
 
    	
    
      //파일 저장 경로
//      @Value("${file.path}")
//         private String fileRealPath;
//      

//      
//      @RequestMapping(value= "/delete", method = RequestMethod.GET)
//         public String member_delete(String id ) {
//            
//         userservice.delete(id);
//            return "redirect:list";
//         }
//   
   //지니 끝

   @GetMapping("/confirm")
   public String confirm() {
   return "user/confirm";
   }
   
   @GetMapping("/join")
   public String join() {
   return "user/join";
   }
   
   @GetMapping("/joinProcess")
   public String joinProcess(User user) {
   return "user/joinProcess";
   }
   
   @GetMapping("/create-company-domain")
   public String createCompanyDomain() {
   return "user/create-company-domain";
   }
   
   @PostMapping("/create-company-id")
   public String createCompanyId() {
      return "user/create-company-id";
   }
   
   @GetMapping("/join-company")
   public String joinCompany() {
   return "user/join-company";
   }
   
   @GetMapping("/login")
   public String login() {
   return "user/login";
   }
   
   @PostMapping("/join-success")
   public String joinSuccess() {
      return "user/login";
   }

   
    @ResponseBody
    @PostMapping("/send-mail-auth-code")
    public Integer sendMailAuthCode(String recipientEmail,HttpSession session) throws Exception {


        // 난수(인증번호) 생성
        Random random = new Random();
        int verificationCode = 100000 + random.nextInt(900000); // 6자리 난수 생성

        // 이메일로 인증번호 전송
        String senderEmail = "wndudajt@naver.com"; //  이메일 주소
        String senderPassword = "rlawndud1234@"; //  이메일 비밀번호

        String subject = "이메일 인증 번호";
        String body = "인증 번호는 다음과 같습니다: " + verificationCode;

        try {
           Properties props = new Properties();
           props.put("mail.smtp.host", "smtp.naver.com");
           props.put("mail.smtp.port", "465");
           props.put("mail.smtp.auth", "true");
           props.put("mail.smtp.ssl.enable", "true");
           props.put("mail.smtp.ssl.trust", "smtp.naver.com");
           props.put("mail.smtp.ssl.protocols", "TLSv1.2");

            Session mailSession = Session.getInstance(props, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(senderEmail, senderPassword);
                }
            });

            Message message = new MimeMessage(mailSession);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));
            message.setSubject(subject);
            message.setText(body);

            Transport.send(message);
            
            
            session.setAttribute("verificationCode", verificationCode);
            
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return verificationCode;
    }  
    
    @ResponseBody
    @PostMapping("/chk-auth-code")
    public String chkAuthCode(User user, HttpSession session) throws Exception {
       String errMsg = "";
       int verCode = (int) session.getAttribute("verificationCode");
       int userAuthCode = user.getAuthNum();
       System.out.println("verificationCode== > " + verCode);
       System.out.println("userInputAuthNum== > " + userAuthCode);
       
       if(verCode == userAuthCode || userAuthCode == 0) {
           String encPassword = passwordEncoder.encode(user.getPassword());
             user.setPassword(encPassword);
             System.out.println(user.getPassword());

            userService.insert(user);
       }else {
          errMsg = "인증코드를 확인하세요";
       }
       
       return errMsg;
    }
    
    @ResponseBody
    @PostMapping("/chk-dupl-email")
    public String chkduplEmail(String email, HttpSession session) throws Exception {
       String errCode = "";
       System.out.println("userEMail" + email);         //입력받은 eMail;
             
        User tmpUser = userService.selectByMail(email);
        System.out.println("tmpUser" + tmpUser);               //고객 조회 (Email을 통해서)
        if(tmpUser != null) {
           errCode = "1";                                 //이미 Email로 가입한 경우
         }else {
           errCode = "0";
         }
        
        return errCode;
    }
}
