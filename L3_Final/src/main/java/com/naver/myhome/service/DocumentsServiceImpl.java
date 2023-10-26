package com.naver.myhome.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.myhome.mybatis.mapper.DocumentsMapper;

@Service
public class DocumentsServiceImpl implements DocumentsService {
	
	private DocumentsMapper dao;

	   
	   @Autowired
	   public DocumentsServiceImpl(DocumentsMapper dao) {
	      this.dao = dao;
	   }
	
}
