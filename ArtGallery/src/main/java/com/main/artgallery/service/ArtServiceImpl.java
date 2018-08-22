package com.main.artgallery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.art.dao.ArtDao;
import com.main.artgallery.art.dto.ArtDto;
import com.main.artgallery.artrel.dao.ArtRelDao;

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

	/** T_config에서 갖고 오는 로직으로 변경해야함 **/
	//한 페이지에 나타낼 로우의 갯수
	private static final int PAGE_ROW_COUNT=10;
	//하단 디스플레이 페이지 갯수
	private static final int PAGE_DISPLAY_COUNT=10;	

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
		
		//보여줄 페이지의 번호
		int pageNum=dto.getPageNum();	// null인 경우 0 이 됨.
		if(pageNum == 0){
			pageNum=1;
		}
		
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		//전체 row 의 갯수를 읽어온다.
		int totalRow=artDao.getCount(dto);
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
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
	public void getData(ModelAndView mView, int seq) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insert(ModelAndView mView, ArtDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(ModelAndView mView, ArtDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(ModelAndView mView, int seq) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getSequence() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
}
