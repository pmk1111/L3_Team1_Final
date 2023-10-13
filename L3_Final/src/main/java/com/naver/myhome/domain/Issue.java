package com.naver.myhome.domain;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Issue {
	private int issue_id;
	private int project_id;
	private String create_user;
	private String issue_type;
	private String issue_priority;
	private String issue_subject;
	private String issue_content;
	private String issue_status;
	private String issue_reporter;
	private String issue_assigned;
	private String issue_created;
	
    private int totalcount;
    private int todocount;
    private int progresscount;
    private int resolvedcount;
    private int donecount;
    
    private List<MultipartFile> files = new ArrayList<>();    // 첨부파일 List

	@Override
	public String toString() {
		return "Issue [issue_id=" + issue_id + ", project_id=" + project_id + ", create_user=" + create_user
				+ ", issue_type=" + issue_type + ", issue_priority=" + issue_priority + ", issue_subject="
				+ issue_subject + ", issue_content=" + issue_content + ", issue_status=" + issue_status
				+ ", issue_reporter=" + issue_reporter + ", issue_assigned=" + issue_assigned
				+ ", issue_created=" + issue_created + ", files=" + files + "]";
	}

	
	
	
}
