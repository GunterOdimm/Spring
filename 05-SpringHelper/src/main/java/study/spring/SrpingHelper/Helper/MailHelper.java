package study.spring.SrpingHelper.Helper;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import lombok.extern.slf4j.Slf4j;


@Slf4j
public class MailHelper {
	
	JavaMailSender mailSender;
	
	
	public MailHelper(JavaMailSender sender) {
		this.mailSender =sender;
	}
	/**
	 * 메일을 발송한다.
	 * @param sender - 발송자 메일 주소
	 * @param receiver - 수신자 메일 주소
	 * @param subject - 제목
	 * @param content - 내용
	 * @throws MessagingException
	 */
	// --> import javax.mail.MessagingException;
	public void sendMail(/* String sender, */String receiver, String subject, String content) 
			throws MessagingException {
		
		log.debug(String.format("----------------------------------------------------"));
		log.debug(String.format("To: %s", receiver));
		log.debug(String.format("Subject: %s", subject));
		log.debug(String.format("Content: %s", content));
		log.debug(String.format("----------------------------------------------------"));
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		helper.setSubject(subject);
		helper.setText(content, true);
		helper.setTo(new InternetAddress(receiver));
		mailSender.send(message);
	}
}
