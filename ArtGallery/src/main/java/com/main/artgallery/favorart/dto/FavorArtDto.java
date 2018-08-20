package com.main.artgallery.favorart.dto;

public class FavorArtDto {
	private String id;
	private int aseq;
	private String regdate;
	
	public FavorArtDto() {}

	public FavorArtDto(String id, int aseq, String regdate) {
		super();
		this.id = id;
		this.aseq = aseq;
		this.regdate = regdate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getAseq() {
		return aseq;
	}

	public void setAseq(int aseq) {
		this.aseq = aseq;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
}
