package study.spring.hellospring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import study.spring.hellospring.vo.Calc1;
import study.spring.hellospring.vo.Calc2;
import study.spring.hellospring.vo.Calc3;
import study.spring.hellospring.vo.Calc4;

@Slf4j
@Controller
public class VoVontroller {
	
	//import org.springframework.beans.factory.annotation.Autowired;
	@Autowired
	private Calc1 c1;		//autowired는 root-context.xml에서 정의한 변수를 호출한다.
	
	@Autowired
	private Calc2 c2;
	
	@Autowired
	private Calc3 c3;
	
	@Autowired
	private Calc4 c4;
	
	@RequestMapping(value = "/vo/calc.do", method=RequestMethod.GET)
	public String calc(Model model) {
		log.debug("VoController.vo() running...");

		int value1 = c1.sum();
		int value2 = c2.sum();
		int value3 = c3.sum();
		int value4 = c4.sum();

		model.addAttribute("value1", value1);
		model.addAttribute("value2", value2);
		model.addAttribute("value3", value3);
		model.addAttribute("value4", value4);
		
		return "vo/calc";
	}
	

}
