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

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Refund {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "refund_no_seq")
	@SequenceGenerator(sequenceName = "refund_no_seq", name = "refund_no_seq", allocationSize = 1)
	private Long refundNo;
	
	@Column(nullable = false, length = 512)
	private String refundReason;
	
	@CreationTimestamp
	private LocalDateTime refundDate;
	
	@Column(nullable = false, length = 30, columnDefinition = "varchar2(30) default '환불처리대기'")
	private String refundState;
	
	@Column(nullable = true, length = 512)
	private String refundReply;
	
	@OneToOne
	@JoinColumn(name = "userNo")
	private UserList userList;
	
	@OneToOne
	@JoinColumn(name = "orderNo")
	private Orders orders;
	

}//class






