package study.spring.hellospring.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class cookieController {
	@RequestMapping(value ="/cookie/write.do", method = RequestMethod.GET)
	public String fristPage(Model model,
		@CookieValue(value="my_cookie", defaultValue="")String myCooike) {
		log.debug("CookieController.home() running");
		
		try {
			myCooike = URLDecoder.decode(myCooike,"utf-8");
		} catch (UnsupportedEncodingException e){
			e.printStackTrace();
		}
		
		model.addAttribute("my_cookie", myCooike);
		
		return "cookie/write";
	}

	@RequestMapping(value="/cookie/save.do",method = RequestMethod.POST)
	public String cookieSave(HttpServletResponse response, @RequestParam(value = "user_input", defaultValue="")String memo) {
		if (!memo.equals("")) {
			try {
				memo = URLEncoder.encode(memo, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		
		Cookie cookie = new Cookie("my_cookie",memo);
		cookie.setPath("/");
		cookie.setDomain("localhost");
		
		if(memo.equals("")) {
			cookie.setMaxAge(0);
		}else {
			cookie.setMaxAge(60);
		}
		
		response.addCookie(cookie);
		
		return "redirect:/cookie/write.do";
		// TODO Auto-generated constructor stub
	}
}
