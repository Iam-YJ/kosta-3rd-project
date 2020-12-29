package kosta.pro.rgmall.domain;

import java.time.LocalDateTime;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

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

	public UserList(Long userNo) {
		this.userNo = userNo;
	}
	
	public UserList(String email) {
		this.email = email;
	}

	public UserList(Long userNo, String name, String userId, String passWord, String addr, String phone, String email,
			int points, String authority, UserGrade userGrade) {
		super();
		this.userNo = userNo;
		this.name = name;
		this.userId = userId;
		this.passWord = passWord;
		this.addr = addr;
		this.phone = phone;
		this.email = email;
		this.points = points;
		this.authority = authority;
		this.usergrade = userGrade;
	}


	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "USER_NO_SEQ")
	@SequenceGenerator(sequenceName = "USER_NO_SEQ", name = "USER_NO_SEQ", allocationSize = 1)
	private Long userNo;
	
	@Column(nullable = false, length = 30)
	private String name;
	
	@Column(nullable = false, length = 30, unique = true)
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

	@Column(nullable = false, length = 9, columnDefinition = "varchar2(9 char) default 'ROLE_USER'")
	private String authority;
	
	@OneToOne//(cascade = CascadeType.ALL)
	@JoinColumn(name = "gradeNo")
	private UserGrade usergrade;

	
	
	
	
}//class




