package com.naver.myhome.domain;

import java.util.List;

import lombok.Data;

@Data
public class MyIssue {
    private String SUBJECT;
    private int ASSIGNED;
    private String STATUS;
    private String type;
    private String PRIORITY;
    private int PROJECT_ID;

}
