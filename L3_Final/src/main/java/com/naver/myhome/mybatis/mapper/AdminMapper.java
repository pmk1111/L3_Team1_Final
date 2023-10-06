package com.naver.myhome.mybatis.mapper;


import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.naver.myhome.domain.User;

@Mapper
public interface AdminMapper {
	

		public User isId(String id);

		public int insert(User m);

		public int update(User m);

		public void delete(String id);

		public int getSearchListCount(Map<String, String> map);

		public List<User> getSearchList(Map<String, Object> map);

	}

