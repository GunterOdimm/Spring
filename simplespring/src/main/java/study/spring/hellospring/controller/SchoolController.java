package study.spring.hellospring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import study.spring.hellospring.service.SchoolService;
import study.spring.hellospring.service.impl.professorServiceimpl;

@Slf4j
@Controller
public class SchoolController {
	
	@Autowired
	@Qualifier("professor")
	//aopa 객체의존성 주입 이게 있으면 일부러 번거롭게 다 바꿔줄 필요가 없다.
	//뒤에 이름만 바꿔주면 다된다.
	private SchoolService schoolService;

	@RequestMapping(value = "/service/school.do", method = RequestMethod.GET)
	public String student(Model model) {

		log.debug("SchoolControoler.school() running");

		model.addAttribute("add", schoolService.addDate());
		model.addAttribute("getItem", schoolService.getDateItem());
		model.addAttribute("getList", schoolService.getDateList());
		model.addAttribute("edit", schoolService.editDate());
		model.addAttribute("delete", schoolService.deleteDate());
		
		String viewPath = null;
		
		if(schoolService instanceof professorServiceimpl) {
			viewPath = "service/professor";
		} else {
			viewPath = "service/student";
			
		}
		return viewPath;
	}
}
