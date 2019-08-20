package study.spring.hellospring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;


// log4j객체를 자동으로 생성하기위한 Lombok옵션
@Slf4j
// 이 클래스를 컨트롤러로서 지정함
@Controller

public class paramsController {
	//첫페이지 역할을 하는 메서드입니다 이름은 상관없습니다
	// 이메서드를 어찌 화면에 출력시키는가
	@RequestMapping(value="/params/fristPage.do" , method=RequestMethod.GET)
	public String firstPage() {
		log.debug("firstPage() 메서드가 실행되었습니다.");
		// 화면에 표시할 view의 이름을 리턴한다.
		return "params/firstPage";
	}
	
	@RequestMapping(value="/params/get.do", method=RequestMethod.GET)
	public String anynamecanuse(Model model, @RequestParam(value="answer", defaultValue="0") int ans) {
		
		String result = null;
		
		if(ans == 300) {
			result = "정답입니다.";
		} else {
			result = "오답입니다.";
		}

		model.addAttribute("ans",ans);
		model.addAttribute("result",result);
		
		return "params/get";
	}
	
	@RequestMapping(value="/params/post.do", method = RequestMethod.POST)
	public String post(Model model,@RequestParam(value="user_name", defaultValue="") String name,
								   @RequestParam(value="user_age", defaultValue="0") int age) {
		

		model.addAttribute("name",name);
		model.addAttribute("age",age);
		
		return "params/post";
	}
}
