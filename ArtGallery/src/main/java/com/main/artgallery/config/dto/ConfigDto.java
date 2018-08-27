package com.main.artgallery.config.dto;

public class ConfigDto {
	private char code;
    private int pagerow;
    private int displayrow;
    private String section1;
    private String section2;
    private String ip;				// db, upload server IP
    private String uploadRoot;
    
    public ConfigDto() {}

	public ConfigDto(char code, int pagerow, int displayrow, String section1, String section2, String ip,
			String uploadRoot) {
		super();
		this.code = code;
		this.pagerow = pagerow;
		this.displayrow = displayrow;
		this.section1 = section1;
		this.section2 = section2;
		this.ip = ip;
		this.uploadRoot = uploadRoot;
	}

	public char getCode() {
		return code;
	}

	public void setCode(char code) {
		this.code = code;
	}

	public int getPagerow() {
		return pagerow;
	}

	public void setPagerow(int pagerow) {
		this.pagerow = pagerow;
	}

	public int getDisplayrow() {
		return displayrow;
	}

	public void setDisplayrow(int displayrow) {
		this.displayrow = displayrow;
	}

	public String getSection1() {
		return section1;
	}

	public void setSection1(String section1) {
		this.section1 = section1;
	}

	public String getSection2() {
		return section2;
	}

	public void setSection2(String section2) {
		this.section2 = section2;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getUploadRoot() {
		return uploadRoot;
	}

	public void setUploadRoot(String uploadRoot) {
		this.uploadRoot = uploadRoot;
	}
}
