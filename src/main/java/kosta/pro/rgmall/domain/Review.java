package kosta.pro.rgmall.domain;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Review {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "REVIEW_NO_SEQ")
	@SequenceGenerator(sequenceName = "REVIEW_NO_SEQ", name = "REVIEW_NO_SEQ", allocationSize = 1)
	private Long reviewNo;
	
	@Column(nullable = false, length = 3000)
	private String content;
	
	@CreationTimestamp
	private LocalDateTime regDate;
	
	@ManyToOne
	@JoinColumn(name = "userNo")
	private UserList userList;
	
	@ManyToOne
	@JoinColumn(name = "regNo")
	private RegisterGoods registerGoods;
	 
}
