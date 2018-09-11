package com.main.artgallery.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.art.dao.ArtCommentDao;
import com.main.artgallery.art.dao.ArtDao;
import com.main.artgallery.art.dto.ArtCommentDto;
import com.main.artgallery.art.dto.ArtDto;
import com.main.artgallery.art.dao.ArtRelDao;
import com.main.artgallery.art.dto.ArtRelDto;
import com.main.artgallery.category.dto.CategoryDto;
import com.main.artgallery.config.dto.ConfigDto;
import com.main.artgallery.favorart.dao.FavorArtDao;
import com.main.artgallery.favorart.dto.FavorArtDto;

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
	private ArtCommentDao artCommentDao;
	
	@Autowired
	private FavorArtDao favorArtDao;

	@Autowired
	private ConfigService cfService;	
	private ConfigDto configDto=null;
	
	@Override
	public void getList(HttpServletRequest request, ModelAndView mView, ArtDto dto) {
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
		getConfig(request);
		//mView.addObject("configDto", configDto); - ConfigService에서 set 함.
		
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
		
		// 위에서 만든 Dto 에 추가 정보를 담는다. 
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
	public void getData(HttpServletRequest request, ModelAndView mView, ArtDto dto) {
		//검색과 관련된 파라미터들도 dto에 선언되어 있음
		String keyword=dto.getSearchKeyword();
		String condition=dto.getSearchCondition();		
		String adminMode=(String)request.getAttribute("adminMode");	// controller에서 setting
		String listMode=(String)request.getAttribute("listMode");	// controller에서 setting, favorite, search
		if(adminMode==null) {
			adminMode="N";
		}
		if(listMode==null) {
			listMode="";
		}
		
		
		int seq = dto.getSeq();
		
		if(keyword != null) {//검색어가 전달된 경우 
			if ( condition == null) {
			}else if(condition.equals("titleRemark")) {//제목+비고
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
		getConfig(request);
		//mView.addObject("configDto", configDto); - ConfigService에서 set 함.

		//작품정보 가져오기
		ArtDto resultDto=null;
		if (listMode != null && listMode.equals("favorite")) {	// 관심작품
			String id=(String)request.getSession().getAttribute("id");
			FavorArtDto fDto=new FavorArtDto();
			fDto.setId(id);
			fDto.setAseq(dto.getSeq());
			resultDto= favorArtDao.getDataPrevNext(fDto);	
		}else if (listMode != null && listMode.equals("search")) {	// 통합검색
			resultDto=artDao.getSearchData(dto);
		}else {
			resultDto=artDao.getData(dto);
		}

		if (resultDto.getRemark() != null) {
			int idx=resultDto.getRemark().indexOf(":");
			//System.out.println("idx : " + idx + "=" + resultDto.getRemark().length());
			if ( idx < 0) {	// -1 return 포함 안함.
				request.setAttribute("multiStage", true);
			} else {
				request.setAttribute("multiStage", false);			
			}
		} else {
			request.setAttribute("multiStage", false);
		}
		//연계정보 가져오기
		ArtRelDto relDto=new ArtRelDto();
		relDto.setAseq(seq);
		
		relDto.setCode("A");;
		List<ArtRelDto> aList=artRelDao.getList(relDto);
		
		relDto.setCode("M");;
		List<ArtRelDto> mList=artRelDao.getList(relDto);

		relDto.setCode("P");;
		List<ArtRelDto> pList=artRelDao.getList(relDto);
		
		// 관리자 모드 - 연계정보 text 만들기
		if(adminMode.equals("Y")) {
			String[] rtn=artRelTextMerge(aList);
			resultDto.setArtist(rtn[0]);
			mView.addObject("artistTxt", rtn[1]);
			
			rtn=artRelTextMerge(mList);
			resultDto.setMaterial(rtn[0]);
			mView.addObject("materialTxt", rtn[1]);
	
			rtn=artRelTextMerge(pList);
			resultDto.setPainter(rtn[0]);
			mView.addObject("painterTxt", rtn[1]);		
		} else {
			//조회수 증가
			artDao.addViewCount(seq);
			
			// 관심작품 등록 여부
			String id=(String)request.getSession().getAttribute("id");
			String isFavorArt="N";
			if ( id != null && !(id.equals(""))) {
				FavorArtDto fDto=new FavorArtDto();
				fDto.setAseq(seq);
				fDto.setId(id);
				FavorArtDto fDto2=favorArtDao.getData(fDto);
				if ( fDto2 != null && fDto2.getId() != null ) {
					isFavorArt="Y";
				}
			}
			mView.addObject("isFavorArt", isFavorArt);
			
			// 댓글 목록 가져오기
			getCommentList(request, mView);
			
		}
		
		// request에 담기		
		mView.addObject("dto", resultDto);	// 작품 정보
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
		
		//T_config 환경변수 가져오기
		getConfig(request);
		
		//파일 등록 처리
		String realPath=configDto.getRealPath();		
		//System.out.println(realPath);
		
		//MultipartFile 객체의 참조값 얻어오기		
		//FileDto 에 담긴 MultipartFile 객체의 참조값을 얻어온다. - servlet-context.xml에 beans 기술해야함.
		MultipartFile mFile=dto.getFile();
		
		//원본 파일명
		String orgFileName=mFile.getOriginalFilename();
		//저장할 파일의 상세 경로 - upload/seq 조합 번호
		String dir=String.format("%08d", seq);
		dir=dir.substring(0,6);
		String filePath=realPath+configDto.FileSeparator+dir+configDto.FileSeparator;
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
		dto.setImagepath(configDto.getUploadRoot()+configDto.FileSeparator+dir+configDto.FileSeparator+saveFileName);
				
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
		
		//T_config 환경변수 가져오기
		getConfig(request);
		
		//파일 등록 처리
		String realPath=configDto.getRealPath();		
		//System.out.println(realPath);
		
		//MultipartFile 객체의 참조값 얻어오기		
		//FileDto 에 담긴 MultipartFile 객체의 참조값을 얻어온다. - servlet-context.xml에 beans 기술해야함.
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
			String filePath=realPath+configDto.FileSeparator+dir+configDto.FileSeparator;
			
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
			dto.setImagepath(configDto.getUploadRoot()+configDto.FileSeparator+dir+configDto.FileSeparator+saveFileName);
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
		//T_config 환경변수 가져오기
		getConfig(request);
		
		//파일 등록 처리
		String realPath=configDto.getRealPath();		
		//System.out.println(realPath);
				
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
		String[] arr=relData.split(configDto.Separator1);
		for(int i=0; i<arr.length; i++) {
			String cSeqTmp=arr[i].trim();
			String[] cSeqs=cSeqTmp.split(configDto.Separator3);
			int cSeq=Integer.parseInt(cSeqs[0]);
			dto.setCseq(cSeq);
			dto.setSortseq(i+1);
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
			//System.out.println(path+" file 삭제");
			new File(path).delete();
		}catch(Exception e){}
	}

	@Override
	public void getConfig(HttpServletRequest request) {
		// ConfigService 에서 가져오면 request에 담겨져 있으므로 다시 가져온다.
		cfService.getData(request, "1");
		configDto=(ConfigDto)request.getAttribute("configDto");		
		//System.out.println(configDto.getRealPath() + "-" + configDto.getHttpPath());
	}

	@Override
	public String[] artRelTextMerge(List<ArtRelDto> list) {
		String code="";
		String text="";
		String[] result= {"",""};
		for(ArtRelDto rDto : list) {
			code += configDto.Separator1+rDto.getCseq()+configDto.Separator2+rDto.getName();
			text += ","+rDto.getName();
		}
		if (!code.equals("")) {
			code=code.substring(configDto.Separator1.length(), code.length());
			text=text.substring(1, text.length());
		}
		result[0]=code;
		result[1]=text;
		return result;
	}

	// service에서 호출하는 댓글 목록
	@Override
	public void getCommentList(HttpServletRequest request, ModelAndView mView) {		
		ArtCommentDto dto=new ArtCommentDto();
		
		// 작품번호
		if(request.getParameter("seq") != null && !request.getParameter("seq").equals("")) {
			dto.setSeq(Integer.parseInt(request.getParameter("seq")));
		}
	
		//검색어
		String keyword=request.getParameter("searchCommentKeyword");
		String condition=request.getParameter("searchCommentCondition");		
		dto.setSearchCommentKeyword(keyword);
		dto.setSearchCommentCondition(condition);
				
		//보여줄 페이지의 번호
		String pageNum=request.getParameter("commentPageNum");
		if(pageNum == null){
			dto.setCommentPageNum(1);
		} else {
			dto.setCommentPageNum(Integer.parseInt(pageNum));
		}
		
		getCommentList(request, mView, dto);
	}

	// controller에서 호출하는 댓글 목록
	@Override
	public void getCommentList(HttpServletRequest request, ModelAndView mView, ArtCommentDto dto) {

		String keyword=dto.getSearchCommentKeyword();
		String condition=dto.getSearchCommentCondition();		
		
		if(keyword != null) {//검색어가 전달된 경우 
			if(condition.equals("content")) {// 내용
				dto.setContent(keyword);
			}else if(condition.equals("writer")) {// 작성자
				dto.setWriter(keyword);
			}
			//list.jsp 에서 필요한 내용 담기
			mView.addObject("searchCommentKeyword", condition);
			mView.addObject("searchKeyword", keyword);
		}
		
		//보여줄 페이지의 번호
		int pageNum=dto.getCommentPageNum();	// null인 경우 0 이 됨.
		if(pageNum == 0){
			pageNum=1;
		}
		
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int pageRow=3;
		int startRowNum=1+(pageNum-1)*pageRow;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*pageRow;
		
		//전체 row 의 갯수를 읽어온다.
		int totalRow=artCommentDao.getCount(dto);
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)pageRow);
		
		// 위에서 만든 Dto 에 추가 정보를 담는다. 
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		//1. FileDto 객체를 전달해서 파일 목록을 불러온다 
		List<ArtCommentDto> commentList=artCommentDao.getList(dto);
		
		//System.out.println("commentList : " + commentList +"=" +  pageNum + "=" + totalPageCount);
		//2. request 에 담고
		request.setAttribute("commentList", commentList);
		
		// 페이징 처리에 관련된 값도 request 에 담기 
		mView.addObject("commentPageNum", pageNum);
		mView.addObject("totalPageCount", totalPageCount);
		// 전체 row 의 갯수도 전달하기
		mView.addObject("totalRow", totalRow);
	}

	@Override
	public void commentInsert(HttpServletRequest request, ArtCommentDto dto) {
		//저장할 댓글의 번호를 미리 얻어낸다.
		int seq=artCommentDao.getSequence();
		//댓글을 DB 에 저장
		dto.setNum(seq);
		//댓글의 그룹 번호를 읽어온다. ( 0 or 다른 숫자가 들어있다 )
		if(dto.getComment_group()==0) {//원글의 댓글인 경우
			dto.setComment_group(seq);
		}
		//새 댓글을 저장한다.		
		artCommentDao.insert(dto);
	}

	@Override
	public void commentDelete(HttpServletRequest request, int num) {
		artCommentDao.delete(num);
	}	
	
	@Override
	public void getSearchList(HttpServletRequest request, ModelAndView mView) {
		
		String json=(String)request.getAttribute("json");
		if(json==null) {
			json="";
		}
		
		//T_config 환경변수 가져오기
		getConfig(request);
		mView.addObject("configDto", configDto);
		
		String SearchKeyword=(String)request.getParameter("searchKeyword");
		if ( !json.equals("Y") ) {			//카테고리 검색
			
			CategoryDto cDto = artDao.getSearchCategory(SearchKeyword);
			if ( cDto !=null && cDto.getSeq() > 0 ) {	//결과가 있으면
				ArtDto aDto =new ArtDto(); 
				
				aDto.setCseq(cDto.getSeq());
				aDto.setSortField("3");		// viewcount sort
				aDto.setStartRowNum(1);
				aDto.setEndRowNum(3);
				
				List<ArtDto> list2=artDao.getList(aDto);
				mView.addObject("artResult",list2);
			}
			mView.addObject("cateDto",cDto);
		}
		
		ArtDto dto =new ArtDto(); 
		dto.setSearchKeyword(SearchKeyword);

		//보여줄 페이지의 번호
		int pageNum=1;
		
		if(request.getParameter("pageNum") != null && !request.getParameter("pageNum").equals("")){
			pageNum=Integer.parseInt(request.getParameter("pageNum"));;
		}
		
		int pageBasicRow=12;
		int pageRow=pageBasicRow;
		if ( pageNum==1) {
			pageRow=pageBasicRow*2;
		}
		
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*pageRow;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*pageRow;
		if ( pageNum > 1 ) {
			endRowNum=endRowNum+pageBasicRow;
			startRowNum=startRowNum+pageBasicRow;
		}
		System.out.println("pageNum : " + pageNum + " startRowNum : "+ startRowNum + " = endRowNum : "+endRowNum);
		
		//전체 row 의 갯수를 읽어온다.
		int totalRow=artDao.getSearchCount(dto);
		//전체 페이지의 갯수 구하기
		int totalPageCount=(int)Math.ceil(totalRow/(double)pageRow);
		//시작 페이지 번호
		int startPageNum=
			1+((pageNum-1)/configDto.getDisplayrow())*configDto.getDisplayrow();
		//끝 페이지 번호
		int endPageNum=startPageNum+configDto.getDisplayrow()-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}
		
		// 위에서 만든 Dto 에 추가 정보를 담는다. 
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		//작품 LIST
		request.setAttribute("list",artDao.getSearchList(dto));
		
		mView.addObject("searchKeyword",SearchKeyword);
		mView.addObject("pageNum", pageNum);
		mView.addObject("totalPageCount", totalPageCount);
		// 전체 row 의 갯수도 전달하기
		mView.addObject("totalRow", totalRow);

	}
}
