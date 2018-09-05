package com.main.artgallery.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.config.dto.ConfigDto;
import com.main.artgallery.user.dao.UserDao;
import com.main.artgallery.user.dto.UserDto;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao dao;
	
	@Autowired
	private ConfigService cfService;	
	private ConfigDto configDto=null;
	
	@Override
	public void getList(HttpServletRequest request, ModelAndView mView, UserDto dto) {
		String keyword=request.getParameter("searchKeyword");
		String condition=request.getParameter("searchCondition");
		if(keyword!=null) {
			if(condition.equals("id")) {
				dto.setId(keyword);
			} else if(condition.equals("email")) {
				dto.setEmail(keyword);
			}
			mView.addObject("searchKeyword", keyword);
			mView.addObject("searchCondition", condition);
		}
		
		//T_config 환경변수 가져오기
		getConfig(request);

		//보여줄 페이지의 번호
		int pageNum=dto.getPageNum();	// null인 경우 0 이 됨.
		if(pageNum == 0){
			pageNum=1;
		}
		
		//유저가 3개씩 출력
		configDto.setPagerow(3);
		
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
		
		// 위에서 만든 userDto 에 추가 정보를 담는다. 
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);	
		
		List<UserDto> list=dao.getList(dto);
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
	public boolean canUseId(String id) {
		return dao.canUseId(id);
	}	
	@Override
	public boolean signUp(UserDto dto) {
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		String encodedPwd=encoder.encode(dto.getPwd());
		dto.setPwd(encodedPwd);
		return dao.insert(dto);
	}
	@Override
	public void signIn(ModelAndView mView, UserDto dto, HttpSession session) {
		UserDto resultDto=dao.getData(dto.getId());
		boolean isSigninSuccess=false;
		if(resultDto!=null) {
			isSigninSuccess=BCrypt.checkpw(dto.getPwd(), resultDto.getPwd());
		}
		if(isSigninSuccess) {
			session.setAttribute("id", dto.getId());
			session.setAttribute("roll", resultDto.getRoll());
		}
		mView.addObject("isSigninSuccess", isSigninSuccess);
	}
	@Override
	public void info(ModelAndView mView, HttpSession session) {
		String id=(String)session.getAttribute("id");
		UserDto dto=dao.getData(id);
		mView.addObject("dto", dto);
	}
	@Override
	public void updateForm(ModelAndView mView, HttpSession session) {
		String id=(String)session.getAttribute("id");
		UserDto dto=dao.getData(id);
		mView.addObject("dto", dto);
	}
	@Override
	public void update(UserDto dto) {
		dao.update(dto);
	}
	@Override
	public boolean isValidPwd(String inputPwd, HttpSession session) {
		String id=(String)session.getAttribute("id");
		UserDto dto=dao.getData(id);
		boolean isValid=BCrypt.checkpw(inputPwd, dto.getPwd());
		return isValid;
	}
	@Override
	public void changePwd(String pwd, HttpSession session) {
		String id=(String)session.getAttribute("id");
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		String encodedPwd=encoder.encode(pwd);
		UserDto dto=new UserDto();
		dto.setId(id);
		dto.setPwd(encodedPwd);
		dao.changePwd(dto);
	}
	@Override
	public void leave(ModelAndView mView, HttpSession session) {
		String id=(String)session.getAttribute("id");
		dao.leave(id);
		session.invalidate();
		mView.addObject("msg", id+" 회원님 탈퇴됐습니다.");
	}
	@Override
	public void delete(ModelAndView mView, HttpSession session) {
		String id=(String)session.getAttribute("id");
		dao.delete(id);
	}
	@Override
	public void getConfig(HttpServletRequest request) {
		// ConfigService 에서 가져오면 request에 담겨져 있으므로 다시 가져온다.
		cfService.getData(request, "1");
		configDto=(ConfigDto)request.getAttribute("configDto");		
		//System.out.println(configDto.getRealPath() + "-" + configDto.getHttpPath());
	}
}
