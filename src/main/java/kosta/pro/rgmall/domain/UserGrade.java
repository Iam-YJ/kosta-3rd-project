package kosta.pro.rgmall.domain;

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
	private String grade;
	private int lowPrice;
	private int highPrice;
	private int pointRate;
	
	
	
}//class




