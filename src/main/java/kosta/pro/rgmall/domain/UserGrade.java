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
public class UserGrade {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO,generator = "grade_no_seq")
	@SequenceGenerator(sequenceName = "grade_no_seq",name = "grade_no_seq",allocationSize = 1)
	private Long gradeNo;
	
	@Column(nullable = false, length = 12)
	private String grade;
	
	@Column(nullable = false, length = 38)
	private int lowPrice;
	
	@Column(nullable = false, length = 38)
	private int highPrice;
	
	@Column(nullable = false)
	private double pointRate;
	
	
	
}//class









