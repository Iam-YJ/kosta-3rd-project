package kosta.pro.rgmall.domain;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
public class OrderLine {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "orderLine_no_seq")
	@SequenceGenerator(sequenceName = "orderLine_no_seq", name = "orderLine_no_seq", allocationSize = 1)
	private Long orderLineNo;
	
	@Column(nullable = false, length = 38)
	private int quntity;
	
	@Column(nullable = false, length = 38)
	private int unitPrice;
	
	@Column(nullable = false, length = 38)
	private int totalPrice;
	
	@ManyToOne
	@JoinColumn(name = "orderNo")
	private Orders orders;
	
	@OneToOne
	@JoinColumn(name = "regNo")
	private RegisterGoods registerGoods;
	

}//class





