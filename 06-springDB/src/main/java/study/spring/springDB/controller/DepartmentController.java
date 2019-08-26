package study.spring.springDB.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import study.spring.springDB.helper.PageData;
import study.spring.springDB.helper.WebHelper;
import study.spring.springDB.model.Department;
import study.spring.springDB.service.DepartmentService;

@Controller
public class DepartmentController {
	@Autowired
	WebHelper webHelper;
	@Autowired
	DepartmentService departmentService;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	@RequestMapping(value = "/department/list.do", method = RequestMethod.GET)
	public ModelAndView list(Model model) {
		String keyword = webHelper.getString("keyword", "");
		int nowPage = webHelper.getInt("page", 1);
		int totalCount = 0;
		int listCount = 10;
		int pageCount = 5;

		Department input = new Department();
		input.setDname(keyword);
		input.setLoc(keyword);

		List<Department> output = null;

		PageData pageData = null;

		try {
			totalCount = departmentService.getDepartmentCount(input);
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			Department.setOffset(pageData.getOffset());
			Department.setListCount(pageData.getListCount());

			output = departmentService.getDepartmentList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);

		String viewPath = "department/list";
		return new ModelAndView(viewPath);
	}

	@RequestMapping(value = "/department/view.do", method = RequestMethod.GET)
	public ModelAndView view(Model model) {
		int deptno = webHelper.getInt("deptno");
		if (deptno == 0) {
			return webHelper.redirect(null, "학과번호가 없습니다.");
		}
		Department input = new Department();
		input.setDeptno(deptno);

		Department output = null;

		try {
			output = departmentService.getDepartmentItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		model.addAttribute("output", output);

		String viewPath = "department/view";
		return new ModelAndView(viewPath);
	}

	@RequestMapping(value = "/department/add.do", method = RequestMethod.GET)
	public String add(Model model) {
		return "department/add";
	}

	@RequestMapping(value = "/department/add_ok.do", method = RequestMethod.POST)
	public ModelAndView add_ok(Model model) {
		String dname = webHelper.getString("dname");
		String loc = webHelper.getString("loc");

		if (dname == null) {
			return webHelper.redirect(null, "학과이름을 입력하세요.");
		}

		Department input = new Department();
		input.setDname(dname);
		input.setLoc(loc);
		try {
			departmentService.addDepartment(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		return webHelper.redirect(contextPath + "/department/view.do?deptno=" + input.getDeptno(), "저장되었습니다.");
	}

	@RequestMapping(value = "/department/edit.do", method = RequestMethod.GET)
	public ModelAndView edit(Model model) {

		int deptno = webHelper.getInt("deptno");

		if (deptno == 0) {
			return webHelper.redirect(null, "학과번호가 없습니다.");
		}

		Department input = new Department();
		input.setDeptno(deptno);

		Department output = null;
		try {

			output = departmentService.getDepartmentItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		model.addAttribute("output", output);

		String viewPath = "department/edit";
		return new ModelAndView(viewPath);
	}

	@RequestMapping(value = "/department/edit_ok.do", method = RequestMethod.POST)
	public ModelAndView edit_ok(Model model) {

		int deptno = webHelper.getInt("deptno");
		String dname = webHelper.getString("dname");
		String loc = webHelper.getString("loc");

		if (deptno == 0) {
			return webHelper.redirect(null, "학과번호가 없습니다.");
		}
		if (dname == null) {
			return webHelper.redirect(null, "학과이름을 입력하세요.");
		}

		Department input = new Department();
		input.setDeptno(deptno);
		input.setDname(dname);
		input.setLoc(loc);
		try {
			departmentService.editDepartment(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		return webHelper.redirect(contextPath + "/department/view.do?deptno=" + input.getDeptno(), "수정되었습니다.");
	}

	@RequestMapping(value = "/department/delete_ok.do", method = RequestMethod.GET)
	public ModelAndView delete_ok(Model model) {
		int deptno = webHelper.getInt("deptno");
		if (deptno == 0) {
			return webHelper.redirect(null, "학과번호가 없습니다.");
		}
		Department input = new Department();
		input.setDeptno(deptno);
		try {
			departmentService.deleteDepartment(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		return webHelper.redirect(contextPath + "/department/list.do", "삭제되었습니다.");
	}
}