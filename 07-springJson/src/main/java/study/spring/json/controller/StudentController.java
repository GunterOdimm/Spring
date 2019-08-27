package study.spring.json.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import study.spring.json.helper.WebHelper;
import study.spring.json.service.StudentService;
import study.spring.json.helper.PageData;
import study.spring.json.model.Student;
@Controller
public class StudentController {
	@Autowired
	WebHelper webHelper;
	@Autowired
	StudentService StudentService;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	@RequestMapping(value = "/student/list.do", method = RequestMethod.GET)
	public ModelAndView list(Model model) {
		String keyword = webHelper.getString("keyword", "");
		int keynum = webHelper.getInt("keynum");
		int nowPage = webHelper.getInt("page", 1);
		int totalCount = 0;
		int listCount = 10;
		int pageCount = 5;

		Student input = new Student();
		input.setName(keyword);
		input.setUserid(keyword);

		List<Student> output = null;

		PageData pageData = null;

		try {
			totalCount = StudentService.getStudentCount(input);
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			Student.setOffset(pageData.getOffset());
			Student.setListCount(pageData.getListCount());

			output = StudentService.getStudentList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("keyword", keyword);
		model.addAttribute("keynum",keynum);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);

		String viewPath = "student/list";
		return new ModelAndView(viewPath);
	}

	@RequestMapping(value = "/student/view.do", method = RequestMethod.GET)
	public ModelAndView view(Model model) {
		int studno = webHelper.getInt("studno");
		if (studno == 0) {
			return webHelper.redirect(null, "학생번호가 없습니다.");
		}
		Student input = new Student();
		input.setStudno(studno);

		Student output = null;

		try {
			output = StudentService.getStudentItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		model.addAttribute("output", output);

		String viewPath = "student/view";
		return new ModelAndView(viewPath);
	}

	@RequestMapping(value = "/student/add.do", method = RequestMethod.GET)
	public String add(Model model) {
		return "student/add";
	}

	@RequestMapping(value = "/student/add_ok.do", method = RequestMethod.POST)
	public ModelAndView add_ok(Model model) {
		String name = webHelper.getString("name");
		String userid = webHelper.getString("userid");
		int grade = webHelper.getInt("grade");
		String idnum = webHelper.getString("idnum");
		String birthdate = webHelper.getString("birthdate");
		String tel = webHelper.getString("tel");
		int height = webHelper.getInt("height");
		int weight = webHelper.getInt("weight");
		int deptno = webHelper.getInt("deptno");
		int profno = webHelper.getInt("profno");
		if (name == null) {
			return webHelper.redirect(null, "학생이름을 입력하세요.");
		}

		Student input = new Student();
		input.setName(name);
		input.setUserid(userid);
		input.setGrade(grade);
		input.setIdnum(idnum);
		input.setBirthdate(birthdate);
		input.setTel(tel);
		input.setHeight(height);
		input.setWeight(weight);
		input.setDeptno(deptno);
		input.setProfno(profno);
		
		try {
			StudentService.addStudent(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		return webHelper.redirect(contextPath + "/student/view.do?studno=" + input.getStudno(), "저장되었습니다.");
	}

	@RequestMapping(value = "/student/edit.do", method = RequestMethod.GET)
	public ModelAndView edit(Model model) {

		int studno = webHelper.getInt("studno");

		if (studno == 0) {
			return webHelper.redirect(null, "학생번호가 없습니다.");
		}

		Student input = new Student();
		input.setStudno(studno);

		Student output = null;
		try {

			output = StudentService.getStudentItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		model.addAttribute("output", output);
		String viewPath = "student/edit";
		return new ModelAndView(viewPath);
	}

	@RequestMapping(value = "/student/edit_ok.do", method = RequestMethod.POST)
	public ModelAndView edit_ok(Model model) {
		
		int studno = webHelper.getInt("studno");
		String name = webHelper.getString("name");
		String userid = webHelper.getString("userid");
		String idnum = webHelper.getString("idnum");
		String birthdate = webHelper.getString("birthdate");
		String tel = webHelper.getString("tel");

		if (studno == 0) {
			return webHelper.redirect(null, "학생번호가 없습니다.");
		}
		if (name == null) {
			return webHelper.redirect(null, "학생이름을 입력하세요.");
		}

		Student input = new Student();
		input.setStudno(studno);
		input.setName(name);
		input.setUserid(userid);
		input.setIdnum(idnum);
		input.setBirthdate(birthdate);
		input.setTel(tel);
		
		try {
			StudentService.editStudent(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		return webHelper.redirect(contextPath + "/student/view.do?studno=" + input.getStudno(), "수정되었습니다.");
	}

	@RequestMapping(value = "/student/delete_ok.do", method = RequestMethod.GET)
	public ModelAndView delete_ok(Model model) {
		int studno = webHelper.getInt("studno");
		if (studno == 0) {
			return webHelper.redirect(null, "학생번호가 없습니다.");
		}
		Student input = new Student();
		input.setStudno(studno);
		try {
			StudentService.deleteStudent(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		return webHelper.redirect(contextPath + "/student/list.do", "삭제되었습니다.");
	}
}
