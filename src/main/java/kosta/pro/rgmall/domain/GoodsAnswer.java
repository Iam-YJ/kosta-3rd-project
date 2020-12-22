package kosta.pro.rgmall.domain;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class GoodsAnswer {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "AGOODS_NO_SEQ")
	@SequenceGenerator(sequenceName = "AGOODS_NO_SEQ", name = "AGOODS_NO_SEQ", allocationSize = 1)
	private Long agoodsNo;
	
	@Column(nullable = false, length = 3000)
	private String content;
	
	@CreationTimestamp
	private LocalDateTime regDate;
	
	@ManyToOne
	@JoinColumn(name = "qgoodsNo")
	private GoodsQuestion goodsQuestion;

	public GoodsAnswer(String content, GoodsQuestion goodsQuestion) {
		super();
		this.content = content;
		this.goodsQuestion = goodsQuestion;
	}
	
	
	
}
