package study.spring.hellospring.service.impl;

import study.spring.hellospring.service.SchoolService;

public class studentServiceimpl implements SchoolService{

	@Override
	public String addDate() {
		// TODO Auto-generated method stub
		return "학생 데이터를 추가합니다.";
	}

	@Override
	public String getDateItem() {
		// TODO Auto-generated method stub
		return "학생 정보를 상세 조회합니다.";
	}

	@Override
	public String getDateList() {
		// TODO Auto-generated method stub
		return "학생 목록을 조회합니다.";
	}

	@Override
	public String editDate() {
		// TODO Auto-generated method stub
		return "학생 정보를 수정합니다.";
	}

	@Override
	public String deleteDate() {
		// TODO Auto-generated method stub
		return "학생 정보를 삭제합니다.";
	}

}
