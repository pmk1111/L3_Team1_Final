package com.naver.myhome.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.naver.myhome.domain.Issue;

@Mapper
@Repository
public interface IssueMapper {
	public int getIssueId();
	
	public int getListCount(int projectId); 
	
	public List<Issue> getIssueList(int projectId);
	
	public List<Issue> getStatusCount();
	
	public List<Issue> getMyWork(String status);
	
	public List<Issue> getFilteredIssueList(Map<String, String> map);
	
	public List<Issue> searchIssues(String searchText);

//	public List<Project> getMyProjectList(String userId);
	
	public void createIssue(Issue issue);

	public Issue getIssueDetail(int num);
	
	public int updateStatus(int issueId, String status, String selectedUserId);
	
	public int issueUpdate(Issue issue);

	public int issueDelete(int issueId);

}
