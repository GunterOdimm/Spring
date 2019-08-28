package study.spring.springDB.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import study.spring.springDB.helper.PageData;
import study.spring.springDB.helper.WebHelper;
import study.spring.springDB.model.Department;
import study.spring.springDB.service.DepartmentService;

@RestController
public class DepartmentApiController {

	// WebHelper 객체 주입
	@Autowired
	WebHelper webHelper;

	// Service 객체 주입
	@Autowired
	DepartmentService departmentService;

	// "/프로젝트이름" 에 해당하는 ContextPath 변수 주입
	@Value("#{servletContext.contextPath}")
	String contextPath;

	@RequestMapping(value = "/department", method = RequestMethod.GET)
	public Map<String, Object> get() {
		/** 2) 필요한 변수값 생성 */
		// 검색어
		String keyword = webHelper.getString("keyword", "");
		// 페이지 번호 (기본값 1)
		int nowPage = webHelper.getInt("page", 1);
		// 전체 게시글 수
		int totalCount = 0;
		// 한 페이지당 표시할 목록 수
		int listCount = 10;
		// 한 그룹당 표시할 페이지 번호 수
		int pageCount = 5;
		
		/** 3) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Department input = new Department();
		input.setDname(keyword);
		input.setLoc(keyword);
		// 조회결과가 저장될 객체
		List<Department> output = null;
		// 페이지 번호를 계산한 결과가 저장될 객체
		PageData pageData = null;
		
		try {
			// 전체 게시글 수 조회
			totalCount = departmentService.getDepartmentCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			Department.setOffset(pageData.getOffset());
			Department.setListCount(pageData.getListCount());
			// 데이터 조회하기
			output = departmentService.getDepartmentList(input);
		} catch (Exception e) {
			return webHelper.getJsonData(e.getLocalizedMessage());
		}
		
		/** 3) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("item", output);
		data.put("meta", pageData);
		/*
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		String viewPath = "department/list";
		*/
		return webHelper.getJsonData(data);
	}

	@RequestMapping(value = "/department/{deptno}", method = RequestMethod.GET)
	public Map<String, Object> get(@PathVariable("deptno") int deptno) {
		/** 3) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Department input = new Department();
		input.setDeptno(deptno);
		// 조회결과를 저장할 객체 선언
		Department output = null;
		
		try {
			// 데이터 조회
			output = departmentService.getDepartmentItem(input);
		} catch (Exception e) {
			return webHelper.getJsonData(e.getLocalizedMessage());
		}
		
		/** 3) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("item", output);
		/*
		model.addAttribute("output", output);
		String viewPath = "department/view";
		*/
		return webHelper.getJsonData(data);
	}

	@RequestMapping(value = "/department", method = RequestMethod.POST)
	public Map<String, Object> post() {
		/** 2) 사용자가 입력한 파라미터 수신 및 유효성 검사 */
		String dname = webHelper.getString("dname");
		String loc = webHelper.getString("loc");
		
		// 학과 이름은 필수항목이므로 입력 여부를 검사.
		// 위치는 미필수(null허용)이므로 입력 여부를 검사하지 않는다.
		if (dname == null) {
			return webHelper.getJsonData( "학과이름을 입력하세요.");
		}
		
		/** 3) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Department input = new Department();
		input.setDname(dname);
		input.setLoc(loc);
		
		// 저장된 결과를 조회하기 위한 객체
		Department output = null;
		
		try {
			// 데이터 저장
			// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			departmentService.addDepartment(input);
			
			// 데이터 조회
			output = departmentService.getDepartmentItem(input);
		} catch (Exception e) {
			return webHelper.getJsonData(e.getLocalizedMessage());
		}
		
		
		/** 3) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("item", output);

		return webHelper.getJsonData(data);
		
		
		/** 5) 결과를 확인하기 위한 페이지 이동 
		// 저장 결과를 확인하기 위해서 데이터 저장시 생성된 PK값을 상세 페이지로 전달해야 한다.
		return webHelper.redirect(contextPath + "/department/view.do?deptno=" + input.getDeptno(), "저장되었습니다.");
		
		*/
	}

	@RequestMapping(value = "/department", method = RequestMethod.PUT)
	public Map<String, Object> put() {
		/** 2) 사용자가 입력한 파라미터 수신 및 유효성 검사 */
		int deptno = webHelper.getInt("deptno");
		String dname = webHelper.getString("dname");
		String loc = webHelper.getString("loc");
		
		if (deptno == 0) {
			return webHelper.getJsonData( "학과번호가 없습니다.");
		}
		if (dname == null) {
			return webHelper.getJsonData( "학과이름을 입력하세요.");
		}
		
		/** 3) 데이터 수정하기 */
		// 수정할 값들을 Beans에 담는다.
		Department input = new Department();
		input.setDeptno(deptno);
		input.setDname(dname);
		input.setLoc(loc);
		
		// 저장된 결과를 조회하기 위한 객체
				Department output = null;
		
		try {
			// 데이터 수정
			departmentService.editDepartment(input);
			
			// 데이터 조회
			output = departmentService.getDepartmentItem(input);
		} catch (Exception e) {
			return webHelper.getJsonData(e.getLocalizedMessage());
		}
		
		/** 3) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("item", output);

		return webHelper.getJsonData(data);
		
		/** 5) 결과를 확인하기 위한 페이지 이동 
		// 수정한 대상을 상세페이지에 알려주기 위해서 PK값을 전달해야 한다.
		return webHelper.redirect(contextPath + "/department/view.do?deptno=" + input.getDeptno(), "수정되었습니다.");
		*/
	}

	@RequestMapping(value = "/department", method = RequestMethod.DELETE)
	public Map<String, Object> delete() {
		/** 2) 필요한 변수값 생성 */
		// 삭제할 대상에 대한 PK값
		int deptno = webHelper.getInt("deptno");
		
		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (deptno == 0) {
			return webHelper.getJsonData("학과번호가 없습니다.");
		}
		
		/** 3) 데이터 삭제하기 */
		// 데이터 삭제에 필요한 조건값을 Beans에 저장하기
		Department input = new Department();
		input.setDeptno(deptno);
		
		try {
			// 데이터 삭제
			departmentService.deleteDepartment(input);
		} catch (Exception e) {
			return webHelper.getJsonData(e.getLocalizedMessage());
		}
		
		/** 5) 페이지 이동 */
		// 확인할 대상이 삭제된 상태이므로 목록 페이지로 이동
		return webHelper.getJsonData("OK");
	}
}
