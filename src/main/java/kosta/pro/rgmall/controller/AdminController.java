package kosta.pro.rgmall.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kosta.pro.rgmall.domain.FAQ;
import kosta.pro.rgmall.domain.MainCategories;
import kosta.pro.rgmall.domain.Notice;
import kosta.pro.rgmall.domain.RegisterGoods;
import kosta.pro.rgmall.domain.SubCategories;
import kosta.pro.rgmall.service.AdminService;
import kosta.pro.rgmall.service.MainService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
	
	private final AdminService adminService;
	private final MainService mainService;
	private final MainCategories mainCategories;
	private final SubCategories subCategories;
	
	/**
	 * 전체 검색
	 */
	@RequestMapping("/cs/list")
	public String faqList(Model model) {
		List<FAQ> list = adminService.selectAllFAQ();
		/*
		 * for(FAQ f : list) { System.out.println(f); }
		 */
		model.addAttribute("list", list);
		/*
		 * page처리 Pageable pageable = PageRequest.of(nowPage, 10, Direction.DESC,
		 * "faqNo"); Page<FAQ> pageList = service.selectAll(pageable);
		 * 
		 * //pageList.getNumber() model.addAttribute("pageList" , pageList);
		 */
		return "main/cs/faq";
	}
	
	/**
	 * 공지사항 등록하기 폼
	 */
	@RequestMapping("/writeNotice")
	public String writeNotice() {
		
		return "main/cs/writeNotice";
	}
	
	/**
	 *	공지사항 등록하기
	 */
	@RequestMapping("/insert")
	public String insertNotice(Notice notice) {
		//content에 스크립트 요소(태그)를 문자로 교체
		String content = notice.getContent().replace("<", "&lt;");
		notice.setContent(content);
		
		adminService.insertNotice(notice);
		
		return "redirect:/main/notice";
	}
	
	/**
	 * 공지사항 수정등록 폼
	 */
	@RequestMapping("/updateNoticeForm")
	public ModelAndView updateNoticeForm(Long noticeNo) {
		Notice notice = adminService.selectByNotice(noticeNo);
		return new ModelAndView("main/cs/updateNoticeForm","notice", notice);
	}
	
	/**
	 * 공지사항 수정완료
	 */
	@RequestMapping("/updateNotice")
	public String updateNotice(Notice notice) {
		adminService.updateNotice(notice);
		return "redirect:/admin/readNotice/"+ notice.getNoticeNo();
	}
	
	/** 
	 *  공지사항 상세보기
	 * */
	@RequestMapping("/readNotice/{noticeNo}")
	public ModelAndView readNotice(@PathVariable Long noticeNo) {
		
		Notice notice= adminService.selectByNotice(noticeNo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main/cs/readNotice"); // /WEB-INF/views/read.jsp
		mv.addObject("notice", notice);
		
		return mv;
	}
	
	/**
	 * 삭제하기
	 */
	@RequestMapping("/deleteNotice")
	public String deleteNotice(Long noticeNo) {
		adminService.deleteNotice(noticeNo);
		return "redirect:/main/notice";
	}
	
	/*
	 * faq 수정등록 폼
	 */
	@RequestMapping("/updateForm")
	public ModelAndView faqUpdateForm(Long faqNo) {
		FAQ faq = adminService.selectByFaq(faqNo);
		System.out.println(faq);
		return new ModelAndView("main/cs/updateFAQForm","faq", faq);
	}
	/*
	 * 수정완료하기
	 */
	@RequestMapping("/update")
	public String faqUpdate(FAQ faq) {
		adminService.updateFAQ(faq);

		return "redirect:/admin/read/"+faq.getFaqNo();// controller에서 controller 로 찾아 가는데 기존에 가지고있는 것은 버리고
	}

	/*
	 * 삭제하기
	 */
	@RequestMapping("/delete")
	public String faqDelete(FAQ faq) {
		adminService.deleteFAQ(faq);

		return "redirect:/admin/cs/list";
	}
	
	/* 
	 *  FAQ 상세보기
	 * */
	@RequestMapping("/read/{faqNo}")
	public ModelAndView read(@PathVariable Long faqNo) {
		
		FAQ faq = adminService.selectByFaq(faqNo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main/cs/readFAQ"); // /WEB-INF/views/read.jsp
		mv.addObject("faq", faq);
		
		return mv;
	}
	
	/**
	 *  FAQ 등록하기 폼
	 * */
	@RequestMapping("/writeFAQ")
	public String write() {
		return "main/cs/writeFAQ";
	}
	
	/**
	 *  FAQ 등록하기
	 * */
	@RequestMapping("/insertFAQ")
	public String insert(String question, String answer) {
		
		FAQ faq = new FAQ(null,question,answer);
		adminService.insertFAQ(faq);
		
		return "redirect:/admin/cs/list";
	}

	@RequestMapping("myPage/main")
	public void adminMyPage() {
	};

	@RequestMapping("myPage/insertGoodsForm")
	public void insertGoodsForm(Model model) {
		model.addAttribute("list", mainService.selectCategories());
	}// insertGoodsForm

	@PostMapping(value = "/subcategories")
	@ResponseBody
	public List<SubCategories> subCate(Long mainCateNo) {
		/*
		 * for(SubCategories s :mainService.selectSubCategories(mainCateNo)) {
		 * System.out.println(s.getSubCategoryName()); }
		 */
		return mainService.selectSubCategories(mainCateNo);
	}// subCate

	@PostMapping("myPage/insertGoods")
	public ModelAndView insertGoods(RegisterGoods registerGoods, Long mainCateNo, Long subCateNo,
			@RequestParam("tfile") MultipartFile tfile, @RequestParam("adfile") MultipartFile adfile) {

		String path = "C:\\Edu\\Spring\\SpringWork\\RGMALL\\src\\main\\webapp\\WEB-INF\\adimg";
		String tfileName = tfile.getOriginalFilename();
		String adfileName = adfile.getOriginalFilename();

		System.out.println("tfileName = " + tfileName);
		System.out.println("adfileName = " + adfileName);
		mainCategories.setMainCategoryNo(mainCateNo);
		subCategories.setSubCategoryNo(subCateNo);
		registerGoods.setSubCategories(subCategories);
		registerGoods.setMainCategories(mainCategories);
		registerGoods.setThumbnailImg(tfileName);
		registerGoods.setAdImg(adfileName);

		try {
			// 파일을 저장
			tfile.transferTo(new File(path + "/" + tfileName));
			adfile.transferTo(new File(path + "/" + adfileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

		adminService.insertGoods(registerGoods);

		return new ModelAndView("redirect:/admin/myPage/insertGoodsForm", "registerGoods", registerGoods);

	}// insertGoods
	
	/**
	 *  회원정보 검색
	 * */
	@RequestMapping("/myPage/main/userCheck")
	public String userList() {
		//List<UserList> userList = adminService.searchAllUser(grade, keyword);
		
		return "admin/myPage/userCheck";
	}

	//카테고리 수정 폼 띄우기
	@RequestMapping("/myPage/modiCategories")
	public ModelAndView modiCategories() {
		List<MainCategories> mainList = mainService.selectCategories();
		return new ModelAndView("admin/myPage/modiCategories", "list", mainList);
	}
	
	@RequestMapping("/myPage/insertMainCategory")
	public ModelAndView  insertMainCategory(MainCategories mainCategories) {
		 adminService.insertMainCategory(mainCategories);
		 List<MainCategories>mainList = mainService.selectCategories();
		 return new ModelAndView("admin/myPage/modiCategories", "list", mainList);
	}//insertMainCategory
	
	@RequestMapping("/myPage/insertSubCategory")
	public int insertSubCategory(SubCategories subCategories) {
		subCategories.getMainCategory();
		return adminService.insertSubCategory(subCategories);
	}//insertSubCategory
	
	@RequestMapping("/myPage/updateMainCategory")
	public int updateMainCategory(MainCategories mainCategories) {
		return adminService.updateMainCategory(mainCategories);
	}//updateMainCategory
	
	@RequestMapping("/myPage/updateSubCategory")
	public int updateSubCategory(SubCategories subCategories) {
		return adminService.updateSubCategory(subCategories);
	}//updateSubCategory
}// class
