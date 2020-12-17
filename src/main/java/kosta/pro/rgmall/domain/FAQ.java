package kosta.pro.rgmall.domain;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class FAQ {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "faq_no_seq")
	@SequenceGenerator(sequenceName = "faq_no_seq", name = "faq_no_seq", allocationSize = 1)
	private Long faqNo;
	@Column(nullable = false,length = 3000)
	private String question;
	@Column(nullable = false,length = 3000)
	private String answer;

}//class
