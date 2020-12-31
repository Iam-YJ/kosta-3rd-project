package kosta.pro.rgmall.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonInclude;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Component
public class MainCategories {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "MAIN_CATEGORY_NO_SEQ")
	@SequenceGenerator(sequenceName = "MAIN_CATEGORY_NO_SEQ", name = "MAIN_CATEGORY_NO_SEQ", allocationSize = 1)
	private Long mainCategoryNo;
	
	@Column(nullable = false, length = 100)
	private String mainCategoryName;
	
	@OneToMany(mappedBy = "mainCategory")
	private List<SubCategories> subCategoryList = new ArrayList<SubCategories>();

	public MainCategories(Long mainCategoryNo) {
		this.mainCategoryNo = mainCategoryNo;
	}

	
	
}
