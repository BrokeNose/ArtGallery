package com.main.artgallery.favorcategory.dto;

public class FavorCategoryDto {
	private String id;
	private int cseq;
	
	public FavorCategoryDto() {}

	public FavorCategoryDto(String id, int cseq) {
		super();
		this.id = id;
		this.cseq = cseq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getCseq() {
		return cseq;
	}

	public void setCseq(int cseq) {
		this.cseq = cseq;
	}
	
}
