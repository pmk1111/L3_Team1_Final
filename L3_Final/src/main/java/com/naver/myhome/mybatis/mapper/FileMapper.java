package com.naver.myhome.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.naver.myhome.domain.Files;

@Mapper
public interface FileMapper {
	public void uploadFile(List<Files> files);
	
	public List<Files> getFileList(int num);
	
	public void deleteFile(int fileId);
}
