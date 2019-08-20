package study.spring.simplespring;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

/**
 * 프로젝트 만들 때 자동으로 생성되는 샘플 컨트롤러
 * 컨트롤러가 존재하는 패키지는 고정되어있다
 * "/src/main/webapp/WEB-INF/spring/appServlet-context.xml"에 명시되어야한다.
 */
@Slf4j		// log4j객체를 자동으로 생성하기 위한 LOMBOK옵션
@Controller	// 이 클래스를 컨트롤러 로서 지정함.

public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * 컨트롤러의 메서드는 그 자체가 하나의 웹 페이지이다.
	 * 메서드 이름은 자유롭게 지정할 수 있으며.
	 * 클래스와 메서드는 필요에 따라 얼마든지 추가할 수 있다.
	 * @RequestMapping을 통해 URL과 접근 방식을 지정한다.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		//--------------------------------------------------------//
		// 각종 Helper호출 Service 호출 등 지금까지의 모든 수업 내용을 사용한다.
		// 현재 시간을 문자열로 구함
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		//--------------------------------------------------------//	
		
		// model 객체에게 현재시각 문자열을 serverTime이라는 이름으로 전달한다.
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
}
