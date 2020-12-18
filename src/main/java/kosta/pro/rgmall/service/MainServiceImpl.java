package kosta.pro.rgmall.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.pro.rgmall.dao.MainDAO;
import kosta.pro.rgmall.domain.FAQ;
import kosta.pro.rgmall.domain.MainCategories;
import kosta.pro.rgmall.domain.Notice;
import kosta.pro.rgmall.domain.RegisterGoods;
import kosta.pro.rgmall.domain.UserList;
import kosta.pro.rgmall.repository.AdminRepository;
import kosta.pro.rgmall.repository.CartRepository;
import kosta.pro.rgmall.repository.DonationRepository;
import kosta.pro.rgmall.repository.FAQRepository;
import kosta.pro.rgmall.repository.GoodsAnswerRepository;
import kosta.pro.rgmall.repository.GoodsQuestionRepository;
import kosta.pro.rgmall.repository.MainCategoriesRepository;
import kosta.pro.rgmall.repository.NoticeRepository;
import kosta.pro.rgmall.repository.OrderLineRepository;
import kosta.pro.rgmall.repository.OrdersRepository;
import kosta.pro.rgmall.repository.PayRepository;
import kosta.pro.rgmall.repository.RefundRepository;
import kosta.pro.rgmall.repository.RegisterGoodsRepository;
import kosta.pro.rgmall.repository.ReviewRepository;
import kosta.pro.rgmall.repository.SubCategoriesRepository;
import kosta.pro.rgmall.repository.UserGradeRepository;
import kosta.pro.rgmall.repository.UserListRepository;
import kosta.pro.rgmall.repository.WishListRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class MainServiceImpl implements MainService {

	private final AdminRepository adminRep;
	private final CartRepository cartRep;
	private final DonationRepository donationRep;
	private final FAQRepository FAQRep;
	private final GoodsAnswerRepository goodsAnswerRep;
	private final GoodsQuestionRepository goodsQuestionRep;
	private final MainCategoriesRepository mainCategoriesRep;
	private final SubCategoriesRepository subCategoriesRep;
	private final NoticeRepository noticeRep;
	private final OrderLineRepository orderLineRep;
	private final OrdersRepository ordersRep;
	private final PayRepository payRep;
	private final RefundRepository refundRep;
	private final RegisterGoodsRepository registerGoodsRep;
	private final ReviewRepository reviewRep;
	private final UserGradeRepository userGradeRep;
	private final UserListRepository userListRep;
	private final WishListRepository wishListRep;
	
	private final MainDAO mainDAO;
	
	
	@Override
	public Map<String, Object> mainView() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String userIdCheck(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int userRegister(UserList userList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserList userLogin(String userId, String userPwd) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String findUserId(UserList userList) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int findUserPwd(UserList userList) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * Header의 전체상품보기 버튼을 눌렀을 때 넘어가는 페이지
	 * 카테고리(Lv1, Lv2) 상품리스트 + 페이징처리가 필요하다.
	 */
	@Override
	public List<RegisterGoods> selectAllGoods(int mainCategoryNo, int subCategoryNo, int sortNo) {

		List<RegisterGoods> list =  registerGoodsRep.findAll();
		
		return list;
	}
	
	public List<MainCategories> selectAllMainCategories(){
		
		List<MainCategories> list = mainCategoriesRep.findAll();
		return list;
	}
	
//	public List<SubCategories> selectAllSubCategories(Long subCategoryNo){
//		
//		return null;
//	}

	@Override
	public List<RegisterGoods> searchGoods(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RegisterGoods goodsDetail(Long regNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Notice> selectAllNotice() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FAQ> selectAllFAQ() {
		// TODO Auto-generated method stub
		return null;
	}

}
