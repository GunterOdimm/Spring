package study.spring.SpringHelper.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import study.spring.SpringHelper.Helper.MailHelper;
import study.spring.SpringHelper.Helper.RegexHelper;
import study.spring.SpringHelper.Helper.WebHelper;

@Controller
public class MailController {

	@Autowired
	WebHelper webHelper;

	@Autowired
	RegexHelper regexHelper;

	@Autowired
	MailHelper mailHelper;

	@RequestMapping(value = "/mail/write.do", method = RequestMethod.GET)
	public String write(Model model) {
		/* public ModelAndView write(Model model){ */
		webHelper.init();

		return "mail/write";
	}

	@RequestMapping(value = "/mail/send.do", method = RequestMethod.POST)
	public ModelAndView send(Model model) { // 모델 엔 뷰는 String이 안됬으나 3.0부터는 가능해짐.
		// webHelper로 페이지 강제 이동할경우 ModelAndView를 사용해야한다.
		// 헬퍼에서 리스폰스 리퀘스트 모두 자동화 시켜서 가능해짐

		// 사용자의 입력값 받기
		String to = webHelper.getString("to");
		String subject = webHelper.getString("subject");
		String content = webHelper.getString("content");

		// 입력여부 검사 후, 입력되지 않은 경우 이전 페이지로 보내기
		// 받는 메일 주소 검사하기
		if (!regexHelper.isValue(to)) {
			return webHelper.redirect(null, "받는 사람의 이메일 주소를 입력하세요.");
		}
		if (!regexHelper.isEmail(to)) {
			return webHelper.redirect(null, "받는 사람의 이메일 주소가 잘못되었습니다.");
		}
		// 메일 제목 -> null체크도 입력 여부를 확인할 수 있다.
		if (subject == null) {
			return webHelper.redirect(null, "메일 제목을 입력하세요.");
		}
		// 메일 내용 -> null체크도 입력 여부를 확인할 수 있다.
		if (content == null) {
			return webHelper.redirect(null, "메일의 내용을 입력하세요.");
		}

		// 메일 발송 처리
		try {
			// sendMail() 메서드 선언시 throws를 정의했기 때문에 예외처리가 요구된다.
			mailHelper.sendMail(to, subject, content);
		} catch (Exception e) {
			e.printStackTrace();
			return webHelper.redirect(null, "메일발송에 실패했습니다.");
		}

		return webHelper.redirect("write.do", "메일 방송에 성공했습니다.");

	}

}
