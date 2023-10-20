package com.naver.myhome.domain;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;

@Data
public class Company implements UserDetails  {
	private int id;
	private String password;
	private String name;
	private String email;
	private String domain;
	private int eid;
	private Date created_at;
	private String security;
	
	 @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
       ArrayList<GrantedAuthority> list = new ArrayList<GrantedAuthority>();
       list.add(new SimpleGrantedAuthority(security));
       return list;
    }
 
 //계정의 아이디를 리턴합니다.
 @Override
 public String getUsername() {
    // TODO Auto-generated method stub
    return email;
 }
 
 //계정이 만료되지 않았는지를 리턴합니다. (true:만료되지 않음)
  @Override
   public boolean isAccountNonExpired() {
      return true;
   }
   
  
  //계정이 잠겨있지 않은지 리턴합니다. (true:잠겨있지 않음)
   @Override
   public boolean isAccountNonLocked() {
      return true;
   }
   
   
   //계정의 패스워드가 만료되지 않았는지 리턴합니다.(true:만료되지 않음)
   @Override
   public boolean isCredentialsNonExpired() {
      return true;
   }
   
   //계정이 사용가능한지를 리턴합니다.(true:사용가능)
   @Override
   public boolean isEnabled() {
      return true;
   }
}
