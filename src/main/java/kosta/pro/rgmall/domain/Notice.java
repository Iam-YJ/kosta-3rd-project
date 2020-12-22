package kosta.pro.rgmall.domain;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Notice {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "notice_no_seq")
	@SequenceGenerator(sequenceName = "notice_no_seq", name = "notice_no_seq", allocationSize = 1)
	private Long noticeNo;
	
	@Column(nullable = false,length = 512)
	private String title;
	
	@Column(nullable = false,length = 3000)
	private String content;
	@CreationTimestamp
	private LocalDateTime regdate;
	
	
}//class




