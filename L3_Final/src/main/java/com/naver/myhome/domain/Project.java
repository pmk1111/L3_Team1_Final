package com.naver.myhome.domain;

import java.util.Date;

public class Project {
	private int ID;
    private String TITLE;
    private String SUBTITLE;
    private String COLOR;
    private Date CREATE_AT;
    private Date UPDATE_AT;
    private String CURRENTTIME;
    private int TEAMCOUNT;
    
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	public String getSUBTITLE() {
		return SUBTITLE;
	}
	public void setSUBTITLE(String sUBTITLE) {
		SUBTITLE = sUBTITLE;
	}
	public String getCOLOR() {
		return COLOR;
	}
	public void setCOLOR(String cOLOR) {
		COLOR = cOLOR;
	}
	public Date getCREATE_AT() {
		return CREATE_AT;
	}
	public void setCREATE_AT(Date cREATE_AT) {
		CREATE_AT = cREATE_AT;
	}
	public Date getUPDATE_AT() {
		return UPDATE_AT;
	}
	public void setUPDATE_AT(Date uPDATE_AT) {
		UPDATE_AT = uPDATE_AT;
	}
	public String getCURRENTTIME() {
		return CURRENTTIME;
	}
	public void setCURRENTTIME(String cURRENTTIME) {
		CURRENTTIME = cURRENTTIME;
	}
	public int getTEAMCOUNT() {
		return TEAMCOUNT;
	}
	public void setTEAMCOUNT(int tEAMCOUNT) {
		TEAMCOUNT = tEAMCOUNT;
	}
	
	
}