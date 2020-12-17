package kosta.pro.rgmall.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
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
public class WishList {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "wish_no_seq")
	@SequenceGenerator(sequenceName = "wish_no_seq", name = "wish_no_seq", allocationSize = 1)
	private Long wishNo;
	
	@OneToOne
	@JoinColumn(name = "userNo")
	private UserList userList;
	
	@OneToOne
	@JoinColumn(name = "regNo")
	private RegisterGoods registerGoods;
	
}//class



