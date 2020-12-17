package kosta.pro.rgmall.domain;

import java.time.LocalDateTime;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class GoodsQuestion {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "QGOODS_NO_SEQ")
	@SequenceGenerator(sequenceName = "QGOODS_NO_SEQ", name = "QGOODS_NO_SEQ", allocationSize = 1)
	private Long qgoodsNo;
	
	@Column(nullable = false, length = 3000)
	private String content;
	
	@CreationTimestamp
	private LocalDateTime regDate;
	
	@ManyToOne
	@JoinColumn(name = "userNo")
	private UserList userList;
	
	@ManyToOne
	@JoinColumn(name = "regNo")
	private RegisterGoods registerGoods;
	
	@OneToOne(mappedBy = "goodsQuestion",cascade = CascadeType.ALL)
	private GoodsAnswer goodsAnswer;
	
}
