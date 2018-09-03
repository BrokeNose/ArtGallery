package com.main.artgallery.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.art.dao.ArtDao;
import com.main.artgallery.art.dto.ArtDto;
import com.main.artgallery.art.dto.ArtRelDto;
import com.main.artgallery.category.dao.CategoryDao;
import com.main.artgallery.category.dto.CategoryDto;
import com.main.artgallery.config.dto.ConfigDto;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDao dao;
	
	@Autowired
	private ArtDao aDao;

	@Autowired
	private ConfigService cfService;	
	
	private ConfigDto configDto=null;
	
	@Override
	public void getList(HttpServletRequest request, ModelAndView mView) {
		String categoryType = (String)request.getParameter("categorytype");
		String queryType = (String)request.getParameter("searchCondition");
		String queryValue = (String)request.getParameter("searchKeyword");
		String pgNum = (String)request.getParameter("pageNum");
		
		CategoryDto dto = new CategoryDto();
		if(categoryType == null) {
			String dtoCode = dto.getCode();
			if(dtoCode == null) {
				categoryType = "A";
				dto.setCode(categoryType);
			} else {
				categoryType = dtoCode;
			}
		} else {
			dto.setCode(categoryType);
		}
		
		String s = "name";
		if(queryType != null) {
			if(queryValue != null) {
				if(queryType.equals("name")) {
					dto.setName(queryValue);
				} else {
					s = "remark";
					dto.setRemark(queryValue);
				}
			}
		}
		
		int pageNum = 1;
		if(pgNum != null) {
			pageNum = Integer.parseInt(pgNum);
		}
		
		//T_config 환경변수 가져오기
		getConfig(request);
		//mView.addObject("configDto", configDto); - ConfigService에서 set 함.
		
		//보여줄 페이지의 번호
//		int pageNum=dto.getPageNum();	// null인 경우 0 이 됨.
//		if(pageNum == 0){
//			pageNum=1;
//		}
		
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*configDto.getPagerow();
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*configDto.getPagerow();
		
		//전체 row 의 갯수를 읽어온다.
		int totalRow=dao.getCount(dto);
		
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
		
		System.out.println("StartPageNum: "+startPageNum);
		System.out.println("totalPageCount: "+totalPageCount);
		System.out.println("endPageNum: "+endPageNum);
		
		
		// 위에서 만든 CafeDto 에 추가 정보를 담는다. 
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);		
		
		List<CategoryDto> listDto = dao.getListCategory(dto);
		System.out.println("검색건수: "+listDto.size());
		
		mView.addObject("list", listDto);
		
		//mView.addObject("list", dao.getListCategory(dto));
		mView.addObject("categoryType", categoryType);
		// 페이징 처리에 관련된 값도 request 에 담기 
		mView.addObject("pageNum", pageNum);
		mView.addObject("startPageNum", startPageNum);
		mView.addObject("endPageNum", endPageNum);
		mView.addObject("totalPageCount", totalPageCount);
		// 전체 row 의 갯수도 전달하기
		mView.addObject("totalRow", totalRow);
	}
	
	//son
	//카테고리별 리스트 불러오기 메소드
	@Override
	public void SonGetList(HttpServletRequest request, ModelAndView mView) {
		//T_config 환경변수 가져오기
		getConfig(request);
		mView.addObject("configDto", configDto);
		String SonCategoryType=(String)request.getParameter("soncategorytype");
		
		if (SonCategoryType==null) {
			SonCategoryType="A";
		}
		mView.addObject("list",dao.getList(SonCategoryType));
		mView.addObject("SonCategoryType", SonCategoryType);
		
	}
	
	//카테고리에서 타고 detail 보여주는 메소드
	@Override
	public void SonGetData(HttpServletRequest request, ModelAndView mView) {
		//T_config 환경변수 가져오기
		getConfig(request);
		
		
		//파라미터로 전달되는 글번호 읽어오기
		int seq=Integer.parseInt(request.getParameter("seq"));
		int cseq=Integer.parseInt(request.getParameter("seq"));
		
		CategoryDto dto= new CategoryDto();
		ArtDto aDto= new ArtDto();
		ArtRelDto arDto= new ArtRelDto();
		
		/*int getCseq=aDto.getCseq();*/
		
		aDto.setSeq(seq);
		aDto.setCseq(cseq);
		arDto.setCseq(cseq);
		dao.addViewCount(seq);
		
		
		//작품 리스트 출력
		mView.addObject("artlist",aDao.getArtList(aDto));
		
		//카테고리 리스트 출력  아티스트,재료,화파
		arDto.setCode("A");
		mView.addObject("ARellist",dao.getListRelation(arDto));
		arDto.setCode("M");
		mView.addObject("MRellist",dao.getListRelation(arDto));
		arDto.setCode("P");
		mView.addObject("PRellist",dao.getListRelation(arDto));
		
		
		dto=dao.getAData(seq);
		
		mView.addObject("configDto", configDto);
		mView.addObject("dto", dto);
	}

	//--------------------------------------------------
	@Override
	public void getSearchList(HttpServletRequest request, ModelAndView mView) {
		//T_config 환경변수 가져오기
		getConfig(request);
				
		CategoryDto dto=new CategoryDto();
		dto.setCode(request.getParameter("code"));
		if (request.getParameter("keyword") != null ){
			dto.setName(request.getParameter("keyword"));
		}
		//request에 담아야 controller에서 읽어서 json 처리 할 수 있음
		request.setAttribute("list",  dao.getSearchList(dto));	
	}

	@Override
	public void insertForm(HttpServletRequest request, ModelAndView mView) {
		String categoryType = (String)request.getParameter("categoryType");
		mView.addObject("categoryType", categoryType);
	}

	@Override
	public void getConfig(HttpServletRequest request) {
		// ConfigService 에서 가져오면 request에 담겨져 있으므로 다시 가져온다.
		cfService.getData(request, "1");
		configDto=(ConfigDto)request.getAttribute("configDto");		
	}

	@Override
	public void delete(HttpServletRequest request, ModelAndView mView) {
		// TODO Auto-generated method stub
		int seq = Integer.parseInt((String)request.getParameter("seq"));
		dao.delete(seq);
		String categoryType = (String)request.getParameter("categoryType");
		mView.addObject("categoryType", categoryType);
		mView.addObject("seq", seq);
	}

	public void insert(HttpServletRequest request, CategoryDto dto) {
		//T_config 환경변수 가져오기
		getConfig(request);
		
		//파일 등록 처리
		//파일을 저장할 폴더의 절대 경로를 얻어온다.
		String realPath=configDto.getRealPath();		
		
		//FileDto 에 담긴 MultipartFile 객체의 참조값을 얻어온다. - servlet-context.xml에 beans 기술해야함.
		MultipartFile mFile=dto.getFile();
		
		//원본 파일명
		String orgFileName=mFile.getOriginalFilename();
		//저장할 파일의 상세 경로 - upload/seq 조합 번호
		String dir = dto.getCode();
		
		String filePath=realPath+configDto.FileSeparator+dir+configDto.FileSeparator;
		System.out.println(filePath);
		
		//디렉토리를 만들 파일 객체 생성
		File file=new File(filePath);
		if(!file.exists()){//디렉토리가 존재하지 않는다면
			file.mkdir();//디렉토리를 만든다.
		}
		String exps[]=orgFileName.split("\\.");
		String exp=exps[exps.length-1];
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddhhmmss");
		String saveFileName = dateFormat.format(cal.getTime())+"."+exp;		
		
		try{
			//upload 폴더에 파일을 저장한다.
			mFile.transferTo(new File(filePath+saveFileName));
		}catch(Exception e){
			e.printStackTrace();
		}
		
		//FileDto 객체에 추가 정보를 담는다.
		//dto.setImagepath(uploadDir+File.separator+dir+File.separator+saveFileName);
		
		String imgPath = configDto.getUploadRoot()+configDto.FileSeparator+dir+configDto.FileSeparator+saveFileName;
		
		System.out.println("Save ImagePath: " + imgPath);
		
		dto.setImagepath(imgPath);
		
		dao.insert(dto);
	}

	@Override
	public void updateForm(HttpServletRequest request, ModelAndView mView) {
		// TODO Auto-generated method stub
		String categoryType = (String)request.getParameter("categoryType");
		int seq = Integer.parseInt((String)request.getParameter("seq"));
		CategoryDto dto = dao.getDataSeq(seq);
		
		mView.addObject("categoryType", categoryType);
		mView.addObject("dto", dto);
	}

	@Override
	public void update(HttpServletRequest request, CategoryDto dto) {
		// TODO Auto-generated method stub
		getConfig(request);
		
		//파일 등록 처리
		String realPath=configDto.getRealPath();		
		//System.out.println(realPath);
		
		//MultipartFile 객체의 참조값 얻어오기		
		//FileDto 에 담긴 MultipartFile 객체의 참조값을 얻어온다. - servlet-context.xml에 beans 기술해야함.
		MultipartFile mFile=dto.getFile();	
		
		//원본 파일명
		String orgFileName=mFile.getOriginalFilename();
		//System.out.println(orgFileName + "==== 파일명");
		if ( orgFileName != null && !orgFileName.equals("")) {	//첨부파일 등록시
			//기존 등록파일 삭제
			if( dto.getImagepath() != null && !dto.getImagepath().equals("")) {
				fileDelete(realPath, dto.getImagepath());
			}
			
			String dir = dto.getCode();
			
			String filePath=realPath+configDto.FileSeparator+dir+configDto.FileSeparator;
			System.out.println(filePath);
			
			//디렉토리를 만들 파일 객체 생성
			File file=new File(filePath);
			if(!file.exists()){//디렉토리가 존재하지 않는다면
				file.mkdir();//디렉토리를 만든다.
			}
			String exps[]=orgFileName.split("\\.");
			String exp=exps[exps.length-1];
			
			Calendar cal = Calendar.getInstance();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddhhmmss");
			String saveFileName = dateFormat.format(cal.getTime())+"."+exp;		
			
			try{
				//upload 폴더에 파일을 저장한다.
				mFile.transferTo(new File(filePath+saveFileName));
			}catch(Exception e){
				e.printStackTrace();
			}
			
			//FileDto 객체에 추가 정보를 담는다.
			//dto.setImagepath(uploadDir+File.separator+dir+File.separator+saveFileName);
			
			String imgPath = configDto.getUploadRoot()+configDto.FileSeparator+dir+configDto.FileSeparator+saveFileName;
			
			System.out.println("Save ImagePath: " + imgPath);
			
			dto.setImagepath(imgPath);
		}		
		
		dao.update(dto);
	}
	
	@Override
	public void fileDelete(String realPath, String imagePath) {
		// TODO Auto-generated method stub
		String path=realPath + imagePath.substring(configDto.getUploadRoot().length());

		//System.out.println(imagePath.substring(dto.getUploadRoot().length()));
		//System.out.println(path);
		
		try{
			//System.out.println(path+" file 삭제");
			new File(path).delete();
		}catch(Exception e){}
		
	}
}
