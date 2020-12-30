package kosta.pro.rgmall.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import kosta.pro.rgmall.domain.FAQ;
import kosta.pro.rgmall.domain.GoodsAnswer;
import kosta.pro.rgmall.domain.GoodsQuestion;
import kosta.pro.rgmall.domain.MainCategories;
import kosta.pro.rgmall.domain.Notice;
import kosta.pro.rgmall.domain.RegisterGoods;
import kosta.pro.rgmall.domain.Review;
import kosta.pro.rgmall.domain.SubCategories;
import kosta.pro.rgmall.domain.UserList;

public interface MainService {


	/**
	 * index화면에 출력하는 내용
	 * Collection(Map)에 index에 포함되는 항목들을 넣어서 메인으로 출력한다.
	 * 1. AdGoodsList - Banner에 들어갈 항목 리스트
	 * 2. BestGoodsList - Best상품에 들어갈 항목 리스트
	 * 3. NewGoodsList - 새로운상품에 들어갈 항목 리스트
	 * 4. RecentSellList - 가장 최근에 판매된 항목 리스트
	 */
	public Map<String, Object> mainView();
	
	/**
	 * 회원가입시 - 아이디 중복체크
	 * @return - UserList가 null이면 "아이디 사용가능" 리턴
	 * 		   - UserList가 Not Null이면 "아이디 중복으로 사용불가" 리턴
	 */
	public String userIdCheck(String userId);
	
	
	/**
	 * 회원가입
	 * 사용자로부터 이름, 아이디, 비밀번호, 주소, 연락처를 입력받아 회원가입을 시도한다.
	 */
	public int userRegister(UserList userList);
	
	
	/**
	 * 회원가입 카카오API
	 * 사용자로부터 이름, 아이디, 비밀번호, 주소, 연락처를 입력받아 회원가입을 시도한다.
	 */
	public int userRegisterKakao(UserList userList);
	
	/**
	 * 회원정보 업데이트
	 * 카카오API 회원가입 후 정보 더 받기 위함
	 */
	public UserList updateUserKakao(UserList userList);
	
	/**
	 * 로그인
	 * user의 아이디와 비밀번호를 받아 일치하는 정보가 있는 경우  
	 * session정보에 userNo 등 각종 정보를 Controller단에서 저장위해서
	 * UserList를 DB에서  가져와 Controller에 리턴해준다.
	 * 
	 * 단, Spring Security를 쓸 경우 해당 기능은 사용하지 없어도 된다.
	 */
	public UserList userLogin(String userId, String userPwd);
	
	/**
	 * 아이디찾기
	 * 이름, 연락처, 이메일
	 */
	public String findUserId(UserList userList);
	
	/**
	 * 회원 email로 정보 조회
	 */
	public UserList findUserEmail(String email);
	
	/**
	 * 카카오 로그인 가입 후 버그 수정 위함
	 */
	public void deleteUserByName(String name);
	
	/**
	 * 비밀번호 찾기
	 * 아이디, 이름, 연락처, 이메일
	 * 일치할경우 비밀번호 변경 폼 출력
	 * @return 0 : 일치하는 정보가 없음
	 * 		   1 : 비밀번호 변경 폼으로(아이디 정보를 가지고 이동-Controller에서)
	 */
	public UserList findUserPwd(UserList userList);
	
	/**
	 * 비밀번호 찾기 후 비밀번호 변경하기
	 * */
	public int updatePassWord(UserList userList);
	
	/**
	 * Header의 전체상품보기 버튼을 눌렀을 때 넘어가는 페이지
	 * 카테고리(Lv1, Lv2) 상품리스트 + 페이징처리가 필요하다.
	 */
	public Page<RegisterGoods> selectAllGoods(Long mainCategoryNo, Long subCategoryNo, int sortNo,Pageable pageabe);
	
	/**
	 * 상품 검색(제목검색)
	 */
	public Page<RegisterGoods> searchGoods(String keyword,Pageable pageable);
	
	/**
	 * 상품을 눌렀을 때 상품상세정보 페이지 이동
	 * 1. RegisterGoods에 해당하는 내용 전부 가져와야함
	 * cf) JPA사용으로 인해 RegisterGoods만 가져오면 상품정보/상품후기/상품문의 전부 가져올 수 있음
	 * 
	 * 인수 : 글번호
	 */
	public RegisterGoods goodsDetail(Long regNo);
	
	/**
	 * 상품(고유번호로) 상품 정보 가져오기 
	 */
	public RegisterGoods goodsInfo(Long regNo);
	
	/**
	 * 상품 후기 보기
	 * */
	public List<Review> selectReview(Long regNo);
	
	/**
	 * 공지사항
	 */
	public List<Notice> selectAllNotice();
	
	/**
	 * FAQ
   	 */
	public List<FAQ> selectAllFAQ();
	
	/**
	 *  카테고리 목록 가져오기
	 * */
	public List<MainCategories> selectCategories();
	
	/**
	 *  메인카테고리에 해당하는 서브카테고리 목록 가져오기
	 * */
	public List<SubCategories> selectSubCategories(Long mainCateNo);

	/**
	 * 상품문의 조회
	 */
	public List<GoodsQuestion> selectGoodsQuestions(Long regNo);

	/**
	 * 상품 답변 조회
	 */
	public List<GoodsAnswer> selectGoodsAnswer(long qgoodsNo);
	
	/**
	 * 상품 답변 수정 (only 관리자)
	 */
	public int updateGoodsAnswer(GoodsAnswer goodsAnswer);
	
	/**
	 * 상품 답변 삭제 (only 관리자)
	 */
	public int deleteGoodsAnswer(long qgoodsNo);
	
	/**
	 * 상품 답변 추가 (only 관리자)
	 */
	public void insertGoodsAnswer(GoodsAnswer goodsAnswer);
	
	/**
	 * 상품 문의 추가(only 회원)
	 */
	public void insertGoodsQuestion(GoodsQuestion goodsQuestion);
	
	/**
	 * 상품 문의 삭제(only 회원)
	 */
	public void deleteGoodsQuestion(Long regNo);
	
	/**
	 * 상품 문의 수정(only 회원)
	 */
	public int updateGoodsQuestion(GoodsQuestion goodsQuestion);
	
	/**
	 * faq검색하기
	 * */
	public List<FAQ> findFAQByWord(String word);
	

}
