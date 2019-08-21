package study.spring.hellospring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SessionController {
	@RequestMapping(value = "/session/write.do",method = RequestMethod.GET)
	public String sessionWrite(Model model, HttpServletRequest request)/*여기서 보낸 request값이*/ {
		log.debug("Sessioncontroller.cookieWrite() running...");

		HttpSession session = request.getSession();/*여기로 전해진다.*/
				String mySession = (String) session.getAttribute("my_session_value");
		if(mySession == null) {
			mySession = "";
		}
		
		model.addAttribute("mySession",mySession);
		return "session/write";
		
		}
	
	@RequestMapping(value = "/session/save.do", method = RequestMethod.POST)
	public String SessionSave(HttpServletRequest request, @RequestParam(value = "user_input", defaultValue="")String userInput){
		log.debug("SessionController.sessionSave(); running...");
		
		HttpSession session = request.getSession();
		
		if(!userInput.equals("")) {
			session.setAttribute("my_session_value", userInput);
		} else {
			session.removeAttribute("my_session_value");
		}
	
		return "redirect:/session/write.do";
	}

}
