package com.naver.myhome.domain;

import java.sql.Date;

public class Notify {


	  private int ID; // INT 대문자로 변경
	    private String NAME; // 대문자
	    private String EMAIL; // 대문자
	    private String CONTENT; // 대문자
	    private Integer MENTIONED_ID; // INT 대문자로 변경
	    private int POST_ID; // INT 대문자로 변경
	    private int COMMENT_ID; // INT 대문자로 변경
	    private Date NOTIFY_TIME; // 대문자
		public int getID() {
			return ID;
		}
		public void setID(int iD) {
			ID = iD;
		}
		public String getNAME() {
			return NAME;
		}
		public void setNAME(String nAME) {
			NAME = nAME;
		}
		public String getEMAIL() {
			return EMAIL;
		}
		public void setEMAIL(String eMAIL) {
			EMAIL = eMAIL;
		}
		public String getCONTENT() {
			return CONTENT;
		}
		public void setCONTENT(String cONTENT) {
			CONTENT = cONTENT;
		}
		public Integer getMENTIONED_ID() {
			return MENTIONED_ID;
		}
		public void setMENTIONED_ID(Integer mENTIONED_ID) {
			MENTIONED_ID = mENTIONED_ID;
		}
		public int getPOST_ID() {
			return POST_ID;
		}
		public void setPOST_ID(int pOST_ID) {
			POST_ID = pOST_ID;
		}
		public int getCOMMENT_ID() {
			return COMMENT_ID;
		}
		public void setCOMMENT_ID(int cOMMENT_ID) {
			COMMENT_ID = cOMMENT_ID;
		}
		public Date getNOTIFY_TIME() {
			return NOTIFY_TIME;
		}
		public void setNOTIFY_TIME(Date nOTIFY_TIME) {
			NOTIFY_TIME = nOTIFY_TIME;
		}
	
}
