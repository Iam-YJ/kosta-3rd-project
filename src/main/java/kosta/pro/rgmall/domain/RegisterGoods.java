package kosta.pro.rgmall.domain;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.servlet.annotation.MultipartConfig;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@ToString
public class RegisterGoods {
	
	public RegisterGoods(Long regNo) {
		this.regNo = regNo;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "REG_NO_SEQ")
	@SequenceGenerator(sequenceName = "REG_NO_SEQ", name = "REG_NO_SEQ", allocationSize = 1)
	private Long regNo;

	@Column(nullable = false, length = 512)
	private String title;
	
	@Column(nullable = true, length = 3000)
	private String detail;
	
	@Column(nullable = false, length = 3000)
	private String thumbnailImg;
	
	@Column(nullable = true, length = 3000)
	private String adImg;
	
	@Column(nullable = false, length = 100)
	private String name;
	
	@Column(nullable = false, length = 512)
	private String options; 
	
	@Column(nullable = false, length = 512)
	private String area;
	
	@Column(nullable = false, length = 512)
	private String method;
	
	@Column(nullable = false)
	private int stock;
	
	@Column(nullable = false)
	private int price;
	
	@Column(nullable = false, columnDefinition = "int default 0")
	private int sellcount;
	
	@Column(nullable = false, length = 1)
	private int ad;
	
	@CreationTimestamp
	private LocalDateTime regDate;
	
	@OneToOne
	@JoinColumn(name = "mainCategoryNo")
	private MainCategories mainCategories;

	
	@OneToOne
	@JoinColumn(name = "subCategoryNo")
	private SubCategories subCategories;
	
	@JsonIgnore
	@OneToMany(mappedBy = "registerGoods") 
	private List<Review> reviewList = new ArrayList<Review>();
	

}//class
