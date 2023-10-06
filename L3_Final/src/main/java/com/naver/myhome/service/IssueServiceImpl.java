package com.naver.myhome.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	@Override
	public int getListCount() {
		return mapper.getListCount();
	}

	@Override
	public List<Issue> getIssueList() {
		return mapper.getIssueList();
	}
	
	@Override
	public List<Issue> getFilteredIssueList(String issueType, String issuePriority) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("issueType", issueType);
		map.put("issuePriority", issuePriority);
		
		return mapper.getFilteredIssueList(map);
	}

	@Override
	public List<Issue> searchIssues(String searchText) {
		return mapper.searchIssues(searchText);
	}


}
