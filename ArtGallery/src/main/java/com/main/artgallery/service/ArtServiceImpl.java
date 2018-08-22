package com.main.artgallery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.art.dao.ArtDao;
import com.main.artgallery.art.dto.ArtDto;
import com.main.artgallery.art.dao.ArtRelDao;
import com.main.artgallery.art.dto.ArtRelDto;

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
	private static final int PAGE_DISPLAY_COUNT=5;	

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
		//작품정보 가져오기
		ArtDto dto=artDao.getData(seq);
		
		//연계정보 가져오기
		ArtRelDto relDto=new ArtRelDto();
		relDto.setAseq(seq);
		
		relDto.setCode("A");;
		List<ArtRelDto> aList=artRelDao.getList(relDto);
		
		relDto.setCode("M");;
		List<ArtRelDto> mList=artRelDao.getList(relDto);

		relDto.setCode("P");;
		List<ArtRelDto> pList=artRelDao.getList(relDto);
		
		// request에 담기
		mView.addObject("dto", dto);		// 작품 정보
		mView.addObject("aList", aList);	// 아티스트 연계
		mView.addObject("mList", mList);	// 재료 연계
		mView.addObject("pList", pList);	// 화파 연계
		
	}

	@Override
	public void insert(ArtDto dto) {
		//sequence 가져와서 t_art 작품정보 등록하기
		int seq=getSequence();
		dto.setSeq(seq);
		artDao.insert(dto);
		
		//파일 등록 처리
		
		
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

	@Override
	public void update(ArtDto dto) {
		//파일 구현
		
		//작품 정보 수정
		artDao.update(dto);
		
		//아티스트 연계 자료 처리
		if ( dto.getArtist() != null && !dto.getArtist().equals("")) {
			insertRel(dto.getSeq(), dto.getArtist());
		}
		
		//기존 자료 삭제
		artRelDao.delete(dto.getSeq());

		//재료 연계 자료 처리
		if ( dto.getMaterial() != null && !dto.getMaterial().equals("")) {
			insertRel(dto.getSeq(), dto.getMaterial());
		}
		//화파 연계 자료 처리
		if ( dto.getPainter() != null && !dto.getPainter().equals("")) {
			insertRel(dto.getSeq(), dto.getPainter());
		}
	}

	@Override
	public void delete(int seq) {
		// 파일삭제
		
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
		String[] arr=relData.split(",");
		for(int i=0; i<arr.length; i++) {
			String cSeqTmp=arr[i].trim();
			int cSeq=Integer.parseInt(cSeqTmp);
			dto.setCseq(cSeq);
			dto.setSortseq(i+1);
			artRelDao.insert(dto);
		}
	}	
}
