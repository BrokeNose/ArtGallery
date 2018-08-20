package com.main.artgallery.config.dto;

public class ConfigDto {
	private char code;
    private int pagerow;
    private int displayrow;
    
    public ConfigDto() {}

	public ConfigDto(char code, int pagerow, int displayrow) {
		super();
		this.code = code;
		this.pagerow = pagerow;
		this.displayrow = displayrow;
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
    
    
}
