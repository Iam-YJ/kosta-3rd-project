package kosta.pro.rgmall.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kosta.pro.rgmall.domain.FAQ;
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

	@Override
	public Map<String, Object> mainView() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String userIdCheck(String userId) {
		String result = "아이디사용불가";
		if (userListRep.findByUserId(userId).size() == 0) {
			// System.out.println(userListRep.findByUserId(userId).size());
			result = "아이디 사용가능";
		}
		return result;
	}

	/**
	 * 회원가입 사용자로부터 이름, 아이디, 비밀번호, 주소, 연락처를 입력받아 회원가입을 시도한다.
	 */
	@Override
	public int userRegisterKakao(UserList userList) { //이거는 수정해야함(userGrade 테이블 수정해야함)
		userList.setUsergrade(userGradeRep.findById(3L).orElse(null));
		userList.setAuthority("ROLE_USER");
		UserList userListResult = userListRep.save(userList);
		if (userListResult == null) {
			System.out.println("등록안됨");
		} else {
			System.out.println("등록됨");
		}
		return 0;
	}

	// 소은이꺼

	@Override
	public int userRegister(UserList userList) {
		userList.setUsergrade(userGradeRep.findById(3L).orElse(null));
		userList.setAuthority("ROLE_USER");
		userListRep.save(userList);

		return 1;
	}

	/**
	 * 회원정보 업데이트 카카오API 회원가입 후 정보 더 받기 위함
	 */
	@Override
	public int updateUserKakao(UserList userList) {
		String name = userList.getName();
		String userId = userList.getUserId();
		String passWord = userList.getPassWord();
		String addr = userList.getAddr();
		String phone = userList.getPhone();
		String email = userList.getEmail();

		userListRep.updateUserKakao(name, userId, passWord, addr, phone, email);
		return 0;
	}

	@Override
	public UserList userLogin(String userId, String userPwd) {
		return userListRep.login(userId, userPwd);
	}

	@Override
	public String findUserId(UserList userList) {
		String name = userList.getName();
		String phone = userList.getPhone();
		String email = userList.getEmail();
		UserList user = userListRep.findUserId(name, phone, email);
		return user.getUserId();
	}

	@Override
	public int findUserPwd(UserList userList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<RegisterGoods> selectAllGoods(int mainCategoryNo, int subCategoryNo, int sortNo) {
		// TODO Auto-generated method stub
		return null;
	}

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
