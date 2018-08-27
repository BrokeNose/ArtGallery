package com.main.artgallery.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.art.dao.ArtDao;
import com.main.artgallery.art.dto.ArtDto;
import com.main.artgallery.art.dao.ArtRelDao;
import com.main.artgallery.art.dto.ArtRelDto;
import com.main.artgallery.config.dao.ConfigDao;
import com.main.artgallery.config.dto.ConfigDto;

/*
 * 작성자 : hyung
 * 비고 : 
 */

@Service
public class ArtServiceImpl implements ArtService {
	@Autowired
	private ArtDao artDao;
	
	@Autowired
	private ArtRelDao artRelDao;

	@Autowired
	private ConfigDao configDao;

	private ConfigDto configDto;
	
	private String c_section3;	// configDto.section2의 특수문자 처리한 문자열
	
	@Override
	public void getList(ModelAndView mView, ArtDto dto) {
		/*
		 *  request 에 검색 keyword 가 전달 될수도 있고 안될수도 있다.
		 *  1. 전달 안되는 경우 : home 에서 목록보기를 누른경우
		 *  2. 전달 되는 경우 : list.do 에서 검색어를 입력후 form 전송한
		 *     경우. 
		 *  3. 전달 되는 경우 : 이미 검색을 한 상태에서 페이지 링크를 
		 *     누른경우
		 */
		//검색과 관련된 파라미터들도 dto에 선언되어 있음
		String keyword=dto.getSearchKeyword();
		String condition=dto.getSearchCondition();		
		
		if(keyword != null) {//검색어가 전달된 경우 
			if(condition.equals("titleRemark")) {//제목+비고
				dto.setTitle(keyword);
				dto.setRemark(keyword);
			}else if(condition.equals("title")) {//제목
				dto.setTitle(keyword);
			}else if(condition.equals("remark")) {//비고
				dto.setRemark(keyword);
			}else if(condition.equals("artist")) {//아티스트
				dto.setArtist(keyword);
			}else if(condition.equals("painter")) {//화파
				dto.setPainter(keyword);
			}else if(condition.equals("material")) {//작성자 검색
				dto.setMaterial(keyword);
			}
			//list.jsp 에서 필요한 내용 담기
			mView.addObject("searchCondition", condition);
			mView.addObject("searchKeyword", keyword);
		}
		
		//T_config 환경변수 가져오기
		//보여줄 페이지의 번호
		int pageNum=dto.getPageNum();	// null인 경우 0 이 됨.
		if(pageNum == 0){
			pageNum=1;
		}
		
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*configDto.getPagerow();
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*configDto.getPagerow();
		
		//전체 row 의 갯수를 읽어온다.
		int totalRow=artDao.getCount(dto);
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)configDto.getPagerow());
		//시작 페이지 번호
		int startPageNum=
			1+((pageNum-1)/configDto.getDisplayrow())*configDto.getDisplayrow();
		//끝 페이지 번호
		int endPageNum=startPageNum+configDto.getDisplayrow()-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}
		
		// 위에서 만든 CafeDto 에 추가 정보를 담는다. 
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		//1. FileDto 객체를 전달해서 파일 목록을 불러온다 
		List<ArtDto> list=artDao.getList(dto);
		
		//2. request 에 담고
		mView.addObject("list", list);
		
		// 페이징 처리에 관련된 값도 request 에 담기 
		mView.addObject("pageNum", pageNum);
		mView.addObject("startPageNum", startPageNum);
		mView.addObject("endPageNum", endPageNum);
		mView.addObject("totalPageCount", totalPageCount);
		// 전체 row 의 갯수도 전달하기
		mView.addObject("totalRow", totalRow);
	}

	@Override
	public void getData(ModelAndView mView, ArtDto dto) {
		//작품정보 가져오기
		ArtDto resultDto=artDao.getData(dto);
		
		//연계정보 가져오기
		ArtRelDto relDto=new ArtRelDto();
		relDto.setAseq(dto.getSeq());
		
		relDto.setCode("A");;
		List<ArtRelDto> aList=artRelDao.getList(relDto);
		
		relDto.setCode("M");;
		List<ArtRelDto> mList=artRelDao.getList(relDto);

		relDto.setCode("P");;
		List<ArtRelDto> pList=artRelDao.getList(relDto);
		
		// 연계정보 text 만들기
		String code="";
		String text="";
		for(ArtRelDto rDto : aList) {
			code += configDto.getSection1()+rDto.getCseq()+configDto.getSection2()+rDto.getName();
			text += ","+rDto.getName();
		}
		if (!code.equals("")) {
			code=code.substring(configDto.getSection1().length(), code.length());
			text=text.substring(1, text.length());
		}
		resultDto.setArtist(code);
		mView.addObject("artistTxt", text);
		
		code="";
		text="";
		for(ArtRelDto rDto : mList) {
			code += configDto.getSection1()+rDto.getCseq()+configDto.getSection2()+rDto.getName();
			text += ","+rDto.getName();
		}
		if (!code.equals("")) {
			code=code.substring(configDto.getSection1().length(), code.length());
			text=text.substring(1, text.length());
		}
		resultDto.setMaterial(code);
		mView.addObject("materialTxt", text);

		code="";
		text="";
		for(ArtRelDto rDto : pList) {
			code += configDto.getSection1()+rDto.getCseq()+configDto.getSection2()+rDto.getName();
			text += ","+rDto.getName();
		}
		if (!code.equals("")) {
			code=code.substring(configDto.getSection1().length(), code.length());
			text=text.substring(1, text.length());
		}
		resultDto.setPainter(code);
		mView.addObject("painterTxt", text);

		// request에 담기
		mView.addObject("dto", resultDto);		// 작품 정보
		mView.addObject("aList", aList);	// 아티스트 연계
		mView.addObject("mList", mList);	// 재료 연계
		mView.addObject("pList", pList);	// 화파 연계
		
	}
	
	@Transactional
	@Override
	public void insert(HttpServletRequest request, ArtDto dto) {
		//sequence 가져와서 t_art 작품정보 등록하기
		int seq=getSequence();
		dto.setSeq(seq);
		
		//파일 등록 처리
		//파일을 저장할 폴더의 절대 경로를 얻어온다.
		// local 경로
		//String realPath=request.getSession().getServletContext().getRealPath(dto.getUploadRoot());
		// server 경로
		String realPath="\\\\"+configDto.getIp()+"\\" + configDto.getUploadRoot();
		
		//System.out.println(realPath);
		//MultipartFile 객체의 참조값 얻어오기
		
		//FileDto 에 담긴 MultipartFile 객체의 참조값을 얻어온다. - servlet-context.xml에 beans 기술해야함.
		MultipartFile mFile=dto.getFile();
		
		//원본 파일명
		String orgFileName=mFile.getOriginalFilename();
		//저장할 파일의 상세 경로 - upload/seq 조합 번호
		String dir=String.format("%08d", seq);
		dir=dir.substring(0,6);
		String filePath=realPath+File.separator+dir+File.separator;
		System.out.println(filePath);
		
		//디렉토리를 만들 파일 객체 생성
		File file=new File(filePath);
		if(!file.exists()){//디렉토리가 존재하지 않는다면
			file.mkdir();//디렉토리를 만든다.
		}
		//파일 시스템에 저장할 파일명을 만든다. seq 8자리로 만들어서 파일명 생성함.(겹치치 않게)
		String exps[]=orgFileName.split("\\.");
		//System.out.println(orgFileName);
		//System.out.println(exps.length);
		String exp=exps[exps.length-1];
		String saveFileName=String.format("%08d", seq)+"."+exp;
		//System.out.println(saveFileName);
		
		try{
			//upload 폴더에 파일을 저장한다.
			mFile.transferTo(new File(filePath+saveFileName));
		}catch(Exception e){
			e.printStackTrace();
		}
		//FileDto 객체에 추가 정보를 담는다.
		dto.setImagepath(configDto.getUploadRoot()+File.separator+dir+File.separator+saveFileName);
				
		// DB 에 저장하기
		artDao.insert(dto);

		//아티스트 연계 자료 처리
		if ( dto.getArtist() != null && !dto.getArtist().equals("")) {
			insertRel(dto.getSeq(), dto.getArtist());
		}
		//재료 연계 자료 처리
		if ( dto.getMaterial() != null && !dto.getMaterial().equals("")) {
			insertRel(dto.getSeq(), dto.getMaterial());
		}
		//화파 연계 자료 처리
		if ( dto.getPainter() != null && !dto.getPainter().equals("")) {
			insertRel(dto.getSeq(), dto.getPainter());
		}
	}

	@Transactional
	@Override
	public void update(HttpServletRequest request, ArtDto dto) {
		
		//파일 등록 처리
		//파일을 저장할 폴더의 절대 경로를 얻어온다.
		// local 경로
		//String realPath=request.getSession().getServletContext().getRealPath(dto.getUploadRoot());
		// server 경로
		String realPath="\\\\"+configDto.getIp()+"\\" + configDto.getUploadRoot();

		//MultipartFile 객체의 참조값 얻어오기
		//Dto 에 담긴 MultipartFile 객체의 참조값을 얻어온다. - servlet-context.xml에 beans 기술해야함.
		MultipartFile mFile=dto.getFile();
		
		// 등록번호
		int seq=dto.getSeq();
		
		//원본 파일명
		String orgFileName=mFile.getOriginalFilename();
		//System.out.println(orgFileName + "==== 파일명");
		if ( orgFileName != null && !orgFileName.equals("")) {	//첨부파일 등록시
			//기존 등록파일 삭제
			if( dto.getImagepath() != null && !dto.getImagepath().equals("")) {
				fileDelete(realPath, dto.getImagepath());
			}
			
			//저장할 파일의 상세 경로 - upload/seq 조합 번호
			String dir=String.format("%08d", seq);
			dir=dir.substring(0,6);
			String filePath=realPath+File.separator+dir+File.separator;
			
			//디렉토리를 만들 파일 객체 생성
			File file=new File(filePath);
			if(!file.exists()){//디렉토리가 존재하지 않는다면
				file.mkdir();//디렉토리를 만든다.
			}
			//파일 시스템에 저장할 파일명을 만든다. (겹치치 않게)
			//String saveFileName=System.currentTimeMillis()+orgFileName;
			String exps[]=orgFileName.split("\\.");
			//System.out.println(orgFileName);
			//System.out.println(exps.length);
			String exp=exps[exps.length-1];
			String saveFileName=String.format("%08d", seq)+"."+exp;
			//System.out.println(saveFileName);
			
			try{
				//upload 폴더에 파일을 저장한다.
				mFile.transferTo(new File(filePath+saveFileName));
			}catch(Exception e){
				e.printStackTrace();
			}
			//FileDto 객체에 추가 정보를 담는다.
			dto.setImagepath(configDto.getUploadRoot()+File.separator+dir+File.separator+saveFileName);
		}
		
		//작품 정보 수정
		artDao.update(dto);
				
		//기존 연계자료 삭제
		artRelDao.delete(dto.getSeq());

		//아티스트 연계 자료 처리
		if ( dto.getArtist() != null && !dto.getArtist().equals("")) {
			insertRel(dto.getSeq(), dto.getArtist());
		}
		//재료 연계 자료 처리
		if ( dto.getMaterial() != null && !dto.getMaterial().equals("")) {
			insertRel(dto.getSeq(), dto.getMaterial());
		}
		//화파 연계 자료 처리
		if ( dto.getPainter() != null && !dto.getPainter().equals("")) {
			insertRel(dto.getSeq(), dto.getPainter());
		}
	
	}
	
	@Transactional
	@Override
	public void delete(HttpServletRequest request, int seq) {
		// 파일삭제

		// local 경로
		//String realPath=request.getSession().getServletContext().getRealPath(dto.getUploadRoot());
		// server 경로
		String realPath="\\\\"+configDto.getIp()+"\\" + configDto.getUploadRoot();
		
		ArtDto dto=new ArtDto();
		dto.setSeq(seq);
		dto=artDao.getData(dto);
		
		//기존 등록파일 삭제
		if( dto.getImagepath() != null && !dto.getImagepath().equals("")) {
			fileDelete(realPath, dto.getImagepath());
		}
		
//		//2. DB 에서 파일정보 삭제
		artDao.delete(seq);
		artRelDao.delete(seq);
		//artCommentDao.delete(seq); // 댓글정보 삭제 - 구현해야함
		
	}

	@Override
	public int getSequence() {
		return artDao.getSequence();
	}
	
	// 연계자료  문자열 분리해서 연계정보에 insert하기
	@Override
	public void insertRel(int seq, String relData) {
		ArtRelDto dto=new ArtRelDto();
		dto.setAseq(seq);
		String[] arr=relData.split(configDto.getSection1());
		//System.out.println(relData);
		for(int i=0; i<arr.length; i++) {
			String cSeqTmp=arr[i].trim();
			//System.out.println(cSeqTmp);
			String[] cSeqs=cSeqTmp.split(c_section3);
			int cSeq=Integer.parseInt(cSeqs[0]);
			dto.setCseq(cSeq);
			dto.setSortseq(i+1);
			//System.out.println(seq + "=" + cSeq + "=" + i);
			artRelDao.insert(dto);
		}
	}

	@Override
	public void fileDelete(String realPath, String imagePath) {

		//System.out.println("fileDelete ");
		
		//1. 파일 시스템에서 파일 삭제
		String path=realPath + imagePath.substring(configDto.getUploadRoot().length());

		//System.out.println(imagePath.substring(dto.getUploadRoot().length()));
		//System.out.println(path);
		
		try{
			System.out.println(path+" file 삭제");
			new File(path).delete();
		}catch(Exception e){}
	}

	@Override
	public void getConfig(HttpServletRequest request) {
		if(configDto==null) {
			configDto=(ConfigDto)request.getAttribute("configDto");
			if(configDto==null) {
				configDto=configDao.getData("1");
				request.setAttribute("configDto", configDto);
			}
		}
		c_section3= "\\" + configDto.getSection2().substring(0, 1)
				+ "\\" + configDto.getSection2().substring(1, 2)
				+ "\\" + configDto.getSection2().substring(2, 3);
		
	}	
}
