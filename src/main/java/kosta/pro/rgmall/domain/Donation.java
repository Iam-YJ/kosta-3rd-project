package kosta.pro.rgmall.domain;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.UpdateTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Donation {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO,generator = "dona_no_seq")
	@SequenceGenerator(sequenceName = "dona_no_seq",name = "dona_no_seq",allocationSize = 1)
	private Long donaNo;
	@Column(nullable = false,length = 38)
	private int donaPoint;
	@UpdateTimestamp
	private LocalDateTime donaDate;
	
	@OneToOne
	@JoinColumn(name="userNo")
	private UserList userList;
}//class




