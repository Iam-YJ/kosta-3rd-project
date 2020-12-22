package kosta.pro.rgmall.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

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
public class Cart {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "cart_no_seq")
	@SequenceGenerator(sequenceName = "cart_no_seq", name = "cart_no_seq", allocationSize = 1)
	private Long cartNo;
	
	@Column(nullable = false,length = 38)
	private int quantity;
	
	@OneToOne
	@JoinColumn(name = "userNo")
	private UserList userList;
	
	@OneToOne
	@JoinColumn(name = "regNo")
	private RegisterGoods registerGoods;

}//class


