package kosta.pro.rgmall.domain;

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
public class Admin {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO,generator = "admin_no_seq")
	@SequenceGenerator(sequenceName = "admin_no_seq",name = "admin_no_seq",allocationSize = 1)
	private Long adminNo;
	@Column(nullable = false,length =30)
	private String name;
	@Column(nullable = false,length =30)
	private String adminId;
	@Column(nullable = false,length =50)
	private String password;
	@Column(nullable = false,length =10)
	private String authority;
}//class




