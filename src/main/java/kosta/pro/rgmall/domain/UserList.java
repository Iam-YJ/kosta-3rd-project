package kosta.pro.rgmall.domain;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class UserList {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "USER_NO_SEQ")
	@SequenceGenerator(sequenceName = "USER_NO_SEQ", name = "USER_NO_SEQ", allocationSize = 1)
	private Long userNo;
	
	@Column(nullable = false, length = 30)
	private String name;
	
	@Column(nullable = false, length = 30)
	private String userId;
	
	@Column(nullable = false, length = 50)
	private String passWord;
	
	@Column(nullable = false, length = 512)
	private String addr;
	
	@Column(nullable = false, length = 13)
	private String phone;
	
	@Column(nullable = false, length = 50)
	private String email;
	
	@Column(nullable = false, length = 10, columnDefinition = "int default 0")
	private int points;

	@CreationTimestamp
	private LocalDateTime regDate;
	
	@UpdateTimestamp
	private LocalDateTime updateDate;

	@Column(nullable = false, length = 9)
	private String authority;
	
	@OneToOne
	@JoinColumn(name = "gradeNo")
	private UserGrade usergrade;
	
	
	
	
}//class




