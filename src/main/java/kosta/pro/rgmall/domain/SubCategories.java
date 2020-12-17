package kosta.pro.rgmall.domain;
import java.util.ArrayList;

import java.util.List;

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

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class SubCategories {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "SUB_CATEGORY_NO_SEQ")
	@SequenceGenerator(sequenceName = "SUB_CATEGORY_NO_SEQ", name = "SUB_CATEGORY_NO_SEQ", allocationSize = 1)
	private Long subCategoryNo;

	@Column(nullable = false, length = 100)
	private String subCategoryName;
	
	@OneToOne
	@JoinColumn(name = "mainCategoryNo")
	private MainCategories mainCategory;
	
	
}
