package com.semiproject.healingzoo.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.semiproject.healingzoo.admin.model.vo.Show;
import com.semiproject.healingzoo.board.model.vo.Animal;
import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.Goods;
import com.semiproject.healingzoo.board.model.vo.Image;
import com.semiproject.healingzoo.board.model.vo.Link;
import com.semiproject.healingzoo.board.model.vo.PageInfo;
import com.semiproject.healingzoo.board.model.vo.Reply;
import com.semiproject.healingzoo.member.model.vo.Member;

public interface AdminService {
	
	//프로그램 메인 이미지
	int insertProtitleImg(Image i);
	
	//프로그램 메인 문구
	int updateShowLink(Link showLink);
	
	//프로그램 메인 문구
	int insertShowLink(Link showLink);
	
	Image getGoodsImage(int goodsNo);

	void deleteGoodsImage(int goodsNo);

	ArrayList<Animal> selectFamilyList(PageInfo pi, Map<String, String> filters);

	int getAnimalCount(Map<String, String> filters);

	ArrayList<Goods> selectMascotList();
	
	void deleteAnimalImage(int aniNO);

	int insertAnimal(Animal animal);

	int deleteAnimals(List<Integer> aniNOs);

	Animal selectAnimal(int aniNO);

	int updateAnimal(Animal animal);

	List<Animal> getAllAnimals();

	Goods selectGoods(int goodsNo);

	void updateGoods(Goods goods);

	void deleteGoods(int goodsNo);
	
	int insertGoods(Goods goods);
	
	void insertSingleImage(Image image);

	Image selectAnimalImage(int aniNO);

	void deactivateOldAnimalImage(int aniNO);

	void updateAnimalImage(Image existingImage);

	Image getMascotImage();

	Image getGoodsInfoImage();

	void updateGoodsInfoImage(Image image);

	void updateMascotImage(Image image);

	List<Animal> getAnimalsByClass(String string);

	List<Goods> getMascotGoods();

	void insertGoodsImage(Image image);

	void deactivateOldGoodsImage(int goodsNo);

	Image selectGoodsImage(int goodsNo);

	List<Goods> getMascotGoodsWithImages();
	
	Image checkBanner(int i);

	int updateMainImg(Image image);

	int insertMainImg(Image image);

	ArrayList<Image> getBannerImg();

	ArrayList<Image> getOneeyeImg();

	ArrayList<Link> getBannerLink();

	ArrayList<Link> getOneeyeLink();

	void updateMainLink(Link link);

	Image checkOneeye(Integer integer);

	int getShowListCount();

	ArrayList<Show> getShowList(PageInfo pi);

	int insertShow(Show show);

	Show getShow(int showNo);

	Image getImg(Image img);

	int deleteShow(int showNo);

	void deleteShowImg(int showNo);

	ArrayList<Image> getImgList(int showNo);

	int updateShow(Show show);

	int updateShowImg(HashMap<String, Object> map);

	// 게시글 수 조회 (페이지네이션용)
	int getListCount(int i);

	// 공지사항 게시글 리스트 조회
	ArrayList<Board> selectNoBoardList(PageInfo pi, int i);

	// 문의사항 게시글 리스트 조회
	ArrayList<Board> selectQuBoardList(PageInfo pi, int i);

	// 후기리스트 게시글 리스트 조회
	ArrayList<Board> selectReBoardList(PageInfo pi, int i);

	// 예약리스트 게시글 리스트 조회
	ArrayList<Board> selectBoBoardList(PageInfo pi, int i);

	// 공지사항 게시글 상세 조회
	Board selectNoBoard(int bId, Integer userNo);

	// 이미지 선택
	ArrayList<Image> selectImg(int bId);

	// 후기리스트 게시글 상세 조회
	Board selectReBoard(int bId, Integer userNo);

	// 문의/예약 게시글 상세 조회
	Board selectQuBoBoard(int bId, Integer userNo);

	// 말머리 필터 게시글 수 조회
	int listSubjectCount(String noSubject);

	// 말머리 필터 게시글 리스트 조회
	ArrayList<Board> searchFilter(String noSubject, PageInfo pi);

	// 검색어 게시글 수 조회
	int listSearchCount(HashMap<String, Object> map);

	// 공지사항 검색어 리스트 조회
	ArrayList<Board> searchNoBoard(HashMap<String, Object> map, PageInfo pi);

	// 후기리스트 검색어 리스트 조회
	ArrayList<Board> searchReBoard(HashMap<String, Object> map, PageInfo pi);

	// 예약리스트/문의사항 검색어 리스트 조회
	ArrayList<Board> searchQuBoBoard(HashMap<String, Object> map, PageInfo pi);

	// 상세보기에서 게시글 삭제
	int deleteBoard(int boardNo);

	// 게시글 삭제와 동시에 이미지도 삭제
	int updateImgStatus(int boardNo);

	// 기존 이미지 삭제
	int deleteImg(ArrayList<String> deleteImg);

	// 게시글 수정 - 문의/예약 글일 경우
	int updateQuBo(Board b);

	// 게시글 수정 - 공지사항인 경우
	int updateNotice(Board b);

	// 게시글 수정 - 게시글 정보 업데이트
	int updateBoard(Board b);

	// 게시글 수정 - 추가 이미지가 있을 때
	int insertImg(ArrayList<Image> imgList);
	
	// 공지사항 게시글 수 조회
	int getNoListCount(int i);

	// 글쓰기
	int insertBoard(Board b);

	// 글쓰기 - 공지사항
	int insertNo(Board b);

	// 글쓰기 - 문의사항/예약
	int insertQuBo(Board b);

	// 체크 글 삭제 - 글 상태 변경
	int checkDelete(int boardNoInt);

	// 체크 글 삭제 - 카테고리 번호 가져오기
	int getCategoryByBoardNo(int boardNoInt);
	
	Image getOperatingImage();
	
	Image getChargeImage();
	
	void updateOperatingImage(Image image);
	
	void updateChargeImage(Image image);
	
	int insertGreeting(Image i);

	int insertWay(Image i);

	int updateMapLink(Link mapLink);

	int insertMapLink(Link mapLink);
	
	ArrayList<Reply> selectReply(int bId);

	// 댓글 등록
	int insertReply(Reply r);

	// 댓글 삭제
	int deleteReply(int reId);

	// 댓글 수정
	int updateReply(Reply r);

	// 게시글 삭제 시 댓글 상태 변경
	int updateReplyStatus(int boardNo);

	// 상세 글 보기 - 문의/예약 게시판에서 답글이 있을 시 진행상태를  Y로 변경
	void updateQuBoStatusY(int bId);

	// 상세 글 보기 - 문의/예약 게시판에서 답글이 없을 시 진행상태를  N로 변경
	void updateQuBoStatusN(int bId);

	ArrayList<Board> FAQView(PageInfo pi);

	int getFAQListCount();

	int deleteFAQ(int FAQNo);

	Board getFAQ(int faqNo);

	int insertFAQ(Board b);

	int updateFAQ(Board b);
	
	Link getShowLink();

	void deleteExistingShowImage();
	
	void deleteGreeting();

	void deleteWay();

	ArrayList<Reply> selectQuBoReply(int bId);
	//07.15
	int insertQuBoReply(Reply r);
	//07.15
	int deleteQuBoReply(int reId);
	//07.15
	int updateQuBoReply(Reply r);
	
// 회원 수 조회
	int getMemberListCount();
	
	// 회원 리스트 조회
	ArrayList<Member> selectMemberList(PageInfo pi);

	// 회원 등급 말머리 필터 - 회원 수 검색
	int listMemGradeCount(HashMap<String, Object> map);

	// 회원 등급 말머리 필터 - 회원 리스트 조회
//		ArrayList<Member> memGradeFilter(String memGrade, PageInfo pi);
	ArrayList<Member> memGradeFilter(HashMap<String, Object> map, PageInfo pi);

	// 회원 상태 말머리 필터 - 회원 수 검색
	int listMemActiveCount(HashMap<String, Object> map);

	// 회원 상태 말머리 필터 - 회원 리스트 조회
//		ArrayList<Member> memActiveFilter(String memActive, PageInfo pi);
	ArrayList<Member> memActiveFilter(HashMap<String, Object> map, PageInfo pi);

	// 비밀번호 초기화
	int updatePwd(List<Map<String, Object>> updateList);

	// 회원 상태 변경
	int statusChange(List<String> memberNos);

	// 회원 검색
	int listSearchMemberCount(HashMap<String, Object> map);

	ArrayList<Member> searchMember(HashMap<String, Object> map, PageInfo pi);

	//07.16 등급변환
    int changeGrade(int memNo);
   
    //07.16 관리자 확인
    Member checkGrade(int memNo);
    //07.16 상태에따른 멤머 리스트 조회
	int memberStatusListCount(String status);
	//07.16
	ArrayList<Member> memberStatus(PageInfo pi);
	//07.16
	int memberStatusYListCount(String status);
	//07.16
	ArrayList<Member> memberStatusY(PageInfo pi);
	//07.16
	int memberGradeListCount(String memGrade);
	//07.16
	ArrayList<Member> memberStatGra(String memGrade, PageInfo pi);
	//07.16
	int memberGradeYListCount(String memGrade);
	//07.16
	ArrayList<Member> memberStatGraY(String memGrade, PageInfo pi);
}
