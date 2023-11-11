package com.naver.myhome.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.Issue;
import com.naver.myhome.mybatis.mapper.IssueMapper;

@Service
public class IssueServiceImpl implements IssueService{
	
	private IssueMapper mapper;
	
	@Autowired
	public IssueServiceImpl(IssueMapper mapper) {
		this.mapper = mapper;
	}
	

//	@Cacheable(value = "issuelistCache", key = "#projectId")
	@Override
	public List<Issue> getIssueList(int projectId) {
		return mapper.getIssueList(projectId);
	}
	
	@Override
	public List<Issue> getIssueListWithPaging(int projectId, int page, int pageSize) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * pageSize + 1;
		int endrow = startrow + pageSize - 1;
		map.put("projectId", projectId);
		map.put("start", startrow);
		map.put("end", endrow);
		return mapper.getIssueListWithPaging(map);
	}
	
	
//	@CacheEvict(value = "issuelistCache", allEntries = true)
	@Override
	public void createIssue(Issue issue) {
		mapper.createIssue(issue);
	}
	
	@Override
	public int getIssueId() {
		return mapper.getIssueId();
	}
	
	@Override
	public int getListCount(int projectId) {
		return mapper.getListCount(projectId);
	}
	
	@Override
	public List<Issue> getStatusCount(int employeeId, int userId) {
		return mapper.getStatusCount(employeeId, userId);
	}
	
//	@Cacheable(value = "myworklistCache", key = "#status + '-' + #userId")
	@Override
	public List<Issue> getMyWork(String status, int userId) {
		return mapper.getMyWork(status, userId);
	}
	
	@Override
	public List<Issue> getFilteredIssueList(String issueStatus, String issuePriority, 
											int projectId, int page, int pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
	    int start = (page - 1) * pageSize + 1;
	    int end = start + pageSize - 1;
		map.put("issueStatus", issueStatus);
		map.put("issuePriority", issuePriority);
		map.put("projectId", projectId);
		map.put("start", start);
		map.put("end", end);
		
		return mapper.getFilteredIssueList(map);
	}
	
	@Override
	public List<Issue> searchIssues(String searchText, int projectId) {
		return mapper.searchIssues(searchText, projectId);
	}

	@Override
	public Issue getIssueDetail(int num) {
		return mapper.getIssueDetail(num);
	}
	
	@Override
	public int updateStatus(int issueId, String status, String selectedUserId, int sessionId) {
		return mapper.updateStatus(issueId, status, selectedUserId, sessionId);
		
	}
	
	@Override
	public int issueUpdate(Issue issue) {
		return mapper.issueUpdate(issue);
	}

	@Override
	public int issueDelete(int issueId) {
		return mapper.issueDelete(issueId);
	}



}
