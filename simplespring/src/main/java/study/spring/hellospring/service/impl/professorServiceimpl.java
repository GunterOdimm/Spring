package study.spring.hellospring.service.impl;

import org.springframework.stereotype.Service;

import study.spring.hellospring.service.SchoolService;
@Service
public class professorServiceimpl implements SchoolService{

	@Override
	public String addDate() {
		// TODO Auto-generated method stub
		return "교수데이터를 추가합니다";
	}

	@Override
	public String getDateItem() {
		// TODO Auto-generated method stub
		return "교수데이터 상세정보를 조회합니다.";
	}

	@Override
	public String getDateList() {
		// TODO Auto-generated method stub
		return "교수 목록을 조회합니다.";
	}

	@Override
	public String editDate() {
		// TODO Auto-generated method stub
		return "교수 데이터를 수정합니다";
	}

	@Override
	public String deleteDate() {
		// TODO Auto-generated method stub
		return "교수 데이터를 삭제합니다.";
	}

}
