package kosta.pro.rgmall.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mail")
public class MailController {
	private final JavaMailSender mailSender;
	
	private final Environment env;
	
	@RequestMapping("/a")
	public boolean sendMail() {
		String sendTo = "a9552449@naver.com";
		String mailTitle = "안녕하세요 RGMALL 입니다";
		String mailContent = "하이방가";
			
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
				
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper message = new MimeMessageHelper(mimeMessage,true,"UTF-8");

				message.setTo(sendTo);
				message.setFrom(env.getProperty("spring.mail.username"));	//env.getProperty("spring.mail.username")
				message.setSubject(mailTitle);
				message.setText(mailContent, true); //ture : html 형식 사용
					
				//Mail에 img 삽입
				//ClassPathResource resource = new ClassPathResource("img 주소/img 이름.png");
				//message.addInline("img", resource.getFile());
			}
		};
			
		try{
			mailSender.send(preparator);
		} catch (MailException e){
			return false;
		}
		return true;
	}
	

}//class
