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

import com.main.artgallery.category.dao.CategoryDao;
import com.main.artgallery.category.dto.CategoryDto;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDao dao;
	
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
	@Override
	public void SonGetList(HttpServletRequest request, ModelAndView mView) {
		String SonCategoryType=(String)request.getParameter("soncategorytype");
		
		if (SonCategoryType==null) {
			mView.addObject("list",dao.getAList());
			mView.addObject("SonCategoryType", "A");
		}else if(SonCategoryType.equals("A")) {
			mView.addObject("list",dao.getAList());
			mView.addObject("SonCategoryType", "A");
		}else if(SonCategoryType.equals("M")) {
			mView.addObject("list",dao.getMList());
			mView.addObject("SonCategoryType", "M");
		}else if(SonCategoryType.equals("P")) {
			mView.addObject("list",dao.getPList());
			mView.addObject("SonCategorytype","P");
		}
	}
	
	@Override
	public void SonGetData(HttpServletRequest request, ModelAndView mView) {
		//파라미터로 전달되는 글번호 읽어오기
		int seq=Integer.parseInt(request.getParameter("seq"));
		
		CategoryDto dto= new CategoryDto();
		dto=dao.getAData(seq);
		mView.addObject("dto", dto);
	}

	
	@Override
	public void getSearchList(HttpServletRequest request, ModelAndView mView) {
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
	public void insert(HttpServletRequest request, CategoryDto dto) {
		String uploadDir = "/upload";
		//파일 등록 처리
		//파일을 저장할 폴더의 절대 경로를 얻어온다.
		String realPath=request.getSession().getServletContext().getRealPath(uploadDir);
		//System.out.println(realPath);
		//MultipartFile 객체의 참조값 얻어오기
		
		//FileDto 에 담긴 MultipartFile 객체의 참조값을 얻어온다. - servlet-context.xml에 beans 기술해야함.
		MultipartFile mFile=dto.getFile();
		
		//원본 파일명
		String orgFileName=mFile.getOriginalFilename();
		//저장할 파일의 상세 경로 - upload/seq 조합 번호
		String dir = dto.getCode();
		
		System.out.println("code: " + dir);
		
		String filePath=realPath+File.separator+dir+File.separator;
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
		
		String ss = uploadDir+File.separator+dir+File.separator+saveFileName;
		
		System.out.println("imagePath: " + ss);
		
		//FileDto 객체에 추가 정보를 담는다.
		dto.setImagepath(uploadDir+File.separator+dir+File.separator+saveFileName);
		
		String bd = dto.getDdate();
		String dd = dto.getDdate();
		
		System.out.println("bd: " + bd);
		System.out.println("dd: " + dd);
		
		
		dao.insert(dto);
		
//		// DB 에 저장하기
//		artDao.insert(dto);
//
//		//아티스트 연계 자료 처리
//		if ( dto.getArtist() != null && !dto.getArtist().equals("")) {
//			insertRel(dto.getSeq(), dto.getArtist());
//		}
//		//재료 연계 자료 처리
//		if ( dto.getMaterial() != null && !dto.getMaterial().equals("")) {
//			insertRel(dto.getSeq(), dto.getMaterial());
//		}
//		//화파 연계 자료 처리
//		if ( dto.getPainter() != null && !dto.getPainter().equals("")) {
//			insertRel(dto.getSeq(), dto.getPainter());
//		}		
	}
}

	
