package com.main.artgallery.config.dto;

public class ConfigDto {
	private char code;
    private int pagerow;
    private int displayrow;
    private String ip;				// db, upload server IP
    private String uploadRoot;
    private String realPath;		// uploadRoot의 realPath
    private String httpPath;		// uploadRoot의 http 서비스 경로

    // 관리자 작품관리에서 사용 - Separator1 ~ 3
    public static final String Separator1="@@@";
    public static final String Separator2="|||";
    public static final String Separator3="\\|\\|\\|";

    // 파일 upload시 폴더 구분자로 사용
    public static final String FileSeparator="/";
    
    public ConfigDto() {}

	public ConfigDto(char code, int pagerow, int displayrow, String ip,
			String uploadRoot, String realPath, String httpPath) {
		super();
		this.code = code;
		this.pagerow = pagerow;
		this.displayrow = displayrow;
		this.ip = ip;
		this.uploadRoot = uploadRoot;
		this.realPath = realPath;
		this.httpPath = httpPath;
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

	public String getRealPath() {
		return realPath;
	}

	public void setRealPath(String realPath) {
		this.realPath = realPath;
	}

	public String getHttpPath() {
		return httpPath;
	}

	public void setHttpPath(String httpPath) {
		this.httpPath = httpPath;
	}

}
