package com.naver.myhome.mybatis.mapper;


import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.Access;
import com.naver.myhome.domain.Company;
import com.naver.myhome.domain.Employee;
import com.naver.myhome.domain.User;

@Mapper
public interface AdminMapper {
   

   
      
      public List<Employee> findEmployee(int companyId);

      public int countEmployee(int companyId);

      public List<Employee> stopEmployee(int companyId);

      public int countStopEmployee(int companyId);

      public int stopEmployeeStatus(int employeeId);

      public int noMoreAuth(int employeeId);

      public int addAuth(int employeeId);

      public int useEmployeeStatus(int employeeId);

      public int addEmployee(int userId, int companyId);

      Company companyInfo(int companyId);
      
      public int updateName(int companyId,String companyName);

      public int updateDomain(int companyId,String companyDomain);

      public String companyName(int companyId);

      public String companyDomain(int companyId);

      public List<Access> getAccesslist();

		public List<Access> getAccesslist();

		

		public List<Access> getDayCount();

		public List<Access> getMonthCount();


   }
