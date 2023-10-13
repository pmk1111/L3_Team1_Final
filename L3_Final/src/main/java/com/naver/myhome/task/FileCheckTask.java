//package com.naver.myhome.task;
//
//import java.io.File;
//import java.util.List;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.stereotype.Service;
//
//import com.naver.myhome.service.FileService;
//
//@Service
//public class FileCheckTask {
//	private static final Logger logger = LoggerFactory.getLogger(FileCheckTask.class);
//	
//	@Value("${file.upload.path}")
//	private String saveFolder;
//	
//	@Autowired
//	private FileService fileService;
//	public FileCheckTask(FileService fileService) {
//		this.fileService = fileService;
//	}
//	
//	@Scheduled(cron="0 55 * * * *")
//	public void checkFiles() throws Exception {
//		logger.info("checkFiles");
//		
//		List<String> deleteFileList = fileService.getDeleteFileList();
//		
//		for (int i = 0; i < deleteFileList.size(); i++) {
//			String filename = deleteFileList.get(i);
//			File file = new File(saveFolder + filename);
//			
//			if (file.exists()) {
//				if (file.delete()) {
//					logger.info(file.getPath() + "삭제");
//					fileService.deleteFileList(filename);
//				}
//			}else {
//				logger.info(file.getPath() + "파일이 없습니다.");
//			}
//		}
//	}
//	
//}
//
