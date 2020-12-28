package kosta.pro.rgmall.domain;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
public class Orders {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "order_no_seq")
	@SequenceGenerator(sequenceName = "order_no_seq", name = "order_no_seq", allocationSize = 1)
	private Long orderNo;

	@Column(nullable = false, length = 512)
	private String addr;

	@Column(nullable = false, length = 38)
	private int totalPrice;

	@CreationTimestamp
	private LocalDateTime orderdate;

	@Column(nullable = false, length = 20, columnDefinition = "varchar2(20) default '배송준비중'")
	private String delState;

	@Column(nullable = false, length = 38)
	private int realpay;

	@ManyToOne
	@JoinColumn(name = "userNo")
	private UserList userList;

	@OneToOne
	@JoinColumn(name = "payNo")
	private Pay pay;

	@OneToMany(mappedBy = "orders", cascade = CascadeType.ALL)
	private List<OrderLine> list = new ArrayList<OrderLine>();

	
	public Orders(Long orderNo, String addr, int totalPrice, LocalDateTime orderdate, String delState, int realpay,
			UserList userList, Pay pay) {
		this.orderNo = orderNo;
		this.addr = addr;
		this.totalPrice = totalPrice;
		this.orderdate = orderdate;
		this.delState = delState;
		this.realpay = realpay;
		this.userList = userList;
		this.pay = pay;
	}

	
	
	
}// class
