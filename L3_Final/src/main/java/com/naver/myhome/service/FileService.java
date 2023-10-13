package com.naver.myhome.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.Files;

@Mapper
public interface FileService {
	public List<Files> uploadFile(List<Files> files);
	
	public List<Files> getFileList(int num);
	
	public void deleteFile(int fileId);
}
