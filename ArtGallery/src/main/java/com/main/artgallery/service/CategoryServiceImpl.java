package com.main.artgallery.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

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
import com.main.artgallery.config.dao.ConfigDao;
import com.main.artgallery.config.dto.ConfigDto;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDao dao;
	
	@Autowired
	private ConfigDao configDao;
	
	@Autowired
	private ArtDao aDao;

	private ConfigDto configDto=null;
	
	@Override
	public void getList(HttpServletRequest request, ModelAndView mView) {
		String categoryType = (String)request.getParameter("categorytype");
		String queryType = (String)request.getParameter("searchCondition");
		String queryValue = (String)request.getParameter("searchKeyword");
		
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
		
		if(queryType != null) {
			if(queryValue != null) {
				if(queryType.equals("name")) {
					dto.setName(queryValue);
				} else {
					dto.setRemark(queryValue);
				}
			}
		}
		
		
		mView.addObject("list", dao.getListCategory(dto));
		mView.addObject("categoryType", categoryType);
	}
	
	//son
	//카테고리별 리스트 불러오기 메소드
	@Override
	public void SonGetList(HttpServletRequest request, ModelAndView mView) {
		//T_config 환경변수 가져오기
		getConfig();
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
		getConfig();
		
		
		//파라미터로 전달되는 글번호 읽어오기
		int seq=Integer.parseInt(request.getParameter("seq"));
		int cseq=Integer.parseInt(request.getParameter("seq"));
		String code=(String)request.getParameter("code");
		
		CategoryDto dto= new CategoryDto();
		ArtDto aDto= new ArtDto();
		ArtRelDto arDto= new ArtRelDto();
		
		int getCseq=aDto.getCseq();
		
		System.out.println(cseq + "=" + code);
		aDto.setSeq(seq);
		aDto.setCseq(cseq);
		arDto.setCseq(cseq);
		
		
		
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
		getConfig();
				
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
	public void getConfig() {
		configDto=configDao.getData("1");
	}


	public void insert(HttpServletRequest request, CategoryDto dto) {
//		String uploadDir = "/upload";
//		//파일 등록 처리
//		//파일을 저장할 폴더의 절대 경로를 얻어온다.
//		String realPath=request.getSession().getServletContext().getRealPath(uploadDir);
		//System.out.println(realPath);
		//MultipartFile 객체의 참조값 얻어오기
		String FileSep = "/";
		
		getConfig();
		String realPath="\\\\"+configDto.getIp()+"\\" + configDto.getUploadRoot();
		
		//FileDto 에 담긴 MultipartFile 객체의 참조값을 얻어온다. - servlet-context.xml에 beans 기술해야함.
		MultipartFile mFile=dto.getFile();
		
		//원본 파일명
		String orgFileName=mFile.getOriginalFilename();
		//저장할 파일의 상세 경로 - upload/seq 조합 번호
		String dir = dto.getCode();
		
		String filePath=realPath+FileSep+dir+FileSep;
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
		
		String imgPath = configDto.getUploadRoot()+FileSep+dir+FileSep+saveFileName;
		
		System.out.println("Save ImagePath: " + imgPath);
		
		dto.setImagepath(imgPath);
		
		dao.insert(dto);
	}
}

	
