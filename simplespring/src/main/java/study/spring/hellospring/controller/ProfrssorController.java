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

public class ProfrssorController {
	@Autowired
	private SchoolService professorService;

	@RequestMapping(value = "/service/professor.do", method = RequestMethod.GET)
	public String professor(Model model) {

		log.debug("SchoolControoler.professor() running");

		model.addAttribute("add", professorService.addDate());
		model.addAttribute("getItem", professorService.getDateItem());
		model.addAttribute("getList", professorService.getDateList());
		model.addAttribute("edit", professorService.editDate());
		model.addAttribute("delete", professorService.deleteDate());

		return "service/professor";
	}
}
