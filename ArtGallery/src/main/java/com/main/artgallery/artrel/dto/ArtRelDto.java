package com.main.artgallery.artrel.dto;

public class ArtRelDto {
	private int cseq;
  	private int saseq;
  	
  	public ArtRelDto() {}

	public ArtRelDto(int cseq, int saseq) {
		super();
		this.cseq = cseq;
		this.saseq = saseq;
	}

	public int getCseq() {
		return cseq;
	}

	public void setCseq(int cseq) {
		this.cseq = cseq;
	}

	public int getSaseq() {
		return saseq;
	}

	public void setSaseq(int saseq) {
		this.saseq = saseq;
	}
  	
}
