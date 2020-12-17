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
@AllArgsConstructor
@NoArgsConstructor
public class Pay {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "PAY_NO_SEQ")
	@SequenceGenerator(sequenceName = "PAY_NO_SEQ", name = "PAY_NO_SEQ", allocationSize = 1)
	private Long payNo;
	
	@Column(nullable = false, length = 50 )
	private String method;


}//class



