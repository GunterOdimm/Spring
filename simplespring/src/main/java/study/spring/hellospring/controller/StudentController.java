package study.spring.hellospring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import study.spring.hellospring.service.SchoolService;

@Slf4j
@Controller

public class StudentController {
	@Autowired

	private SchoolService studentService;

	@RequestMapping(value = "/service/student.do", method = RequestMethod.GET)
	public String student(Model model) {

		log.debug("SchoolControoler.professor() running");

		model.addAttribute("add", studentService.addDate());
		model.addAttribute("getItem", studentService.getDateItem());
		model.addAttribute("getList", studentService.getDateList());
		model.addAttribute("edit", studentService.editDate());
		model.addAttribute("delete", studentService.deleteDate());

		return "service/student";
	}
}
