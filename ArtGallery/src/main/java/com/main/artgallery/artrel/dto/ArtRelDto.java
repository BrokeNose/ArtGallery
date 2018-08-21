package com.main.artgallery.artrel.dto;
/*
 * 작성자 : Son
 * 수정자 : hyung
 * 비고   : t_artrel + t_category
 */
public class ArtRelDto {
	//t_artrel
	private int cseq;
  	private int aseq;
  	private int sortseq;
  	
  	//t_category
  	private String code;		//구분 A, P, M
  	private String codeName;	//구분명 (아티스트, 화파, 재료)
  	private String name;
  	
  	public ArtRelDto() {}

	public ArtRelDto(int cseq, int aseq, int sortseq, String code, String codeName, String name) {
		super();
		this.cseq = cseq;
		this.aseq = aseq;
		this.sortseq = sortseq;
		this.code = code;
		this.codeName = codeName;
		this.name = name;
	}

	public int getCseq() {
		return cseq;
	}

	public void setCseq(int cseq) {
		this.cseq = cseq;
	}

	public int getAseq() {
		return aseq;
	}

	public void setAseq(int aseq) {
		this.aseq = aseq;
	}

	public int getSortseq() {
		return sortseq;
	}

	public void setSortseq(int sortseq) {
		this.sortseq = sortseq;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCodeName() {
		return codeName;
	}

	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
  	
}
