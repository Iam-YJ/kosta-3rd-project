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
public class MailController {
	private final JavaMailSender mailSender;
	private final Environment env;
	
	public boolean sendMail(String email, String title,String content) {
		String sendTo = email;
		String mailTitle = title;
		String mailContent = content;
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper message = new MimeMessageHelper(mimeMessage,true,"UTF-8");
				message.setTo(sendTo);
				message.setFrom(env.getProperty("spring.mail.username"));	//env.getProperty("spring.mail.username")
				message.setSubject(mailTitle);
				message.setText(mailContent, true); //ture : html 형식 사용
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
