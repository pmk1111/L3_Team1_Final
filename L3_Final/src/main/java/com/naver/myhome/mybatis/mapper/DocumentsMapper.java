package com.naver.myhome.mybatis.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.Documents;

@Mapper
public interface DocumentsMapper {
	
	List<Documents> getDocumentDetails();

}