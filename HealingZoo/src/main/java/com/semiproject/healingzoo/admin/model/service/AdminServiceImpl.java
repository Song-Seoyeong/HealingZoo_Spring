package com.semiproject.healingzoo.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semiproject.healingzoo.admin.model.dao.AdminDAO;
import com.semiproject.healingzoo.admin.model.vo.Show;
import com.semiproject.healingzoo.board.model.vo.Animal;
import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.Goods;
import com.semiproject.healingzoo.board.model.vo.Image;
import com.semiproject.healingzoo.board.model.vo.Link;
import com.semiproject.healingzoo.board.model.vo.PageInfo;
import com.semiproject.healingzoo.board.model.vo.Reply;
import com.semiproject.healingzoo.member.model.vo.Member;

@Service("aService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private AdminDAO aDAO;
	
	@Override
	public Image getGoodsImage(int goodsNo) {
		return aDAO.getGoodsImage(sqlSession,goodsNo);
	}

	@Override
	public void deleteGoodsImage(int goodsNo) {
		aDAO.deleteGoodsImage(sqlSession,goodsNo);
	}
	
	@Override
	public void deleteAnimalImage(int aniNO) {
		aDAO.deleteAnimalImage(sqlSession,aniNO);
	}
	
	@Override
	public ArrayList<Animal> selectFamilyList(PageInfo pi,Map<String, String> filters) {
		return aDAO.selectFamilyList(sqlSession,pi,filters);
	}

	@Override
	public int getAnimalCount(Map<String, String> filters) { 
		return aDAO.getAnimalCount(sqlSession,filters); 
	}

	@Override
	public ArrayList<Goods> selectMascotList() {
		return aDAO.selectMascotList(sqlSession);
	}

	@Override
	public int insertAnimal(Animal animal) {
		return aDAO.insertAnimal(sqlSession,animal);
	}

	@Override
	public int deleteAnimals(List<Integer> aniNOs) {
		return aDAO.deleteAnimal(sqlSession,aniNOs);
	}

	@Override
	public Animal selectAnimal(int aniNO) {
		return aDAO.selectAnimal(sqlSession,aniNO);
	}

	@Override
	public int updateAnimal(Animal animal) {
		return aDAO.updateAnimal(sqlSession,animal);
	}

	@Override
	public List<Animal> getAllAnimals() {
		return aDAO.getAllAnimals(sqlSession);
	}

	@Override
	public Goods selectGoods(int goodsNo) {
		return aDAO.selectGoods(sqlSession,goodsNo);
	}

	@Override
	public void updateGoods(Goods goods) {
		aDAO.updateGoods(sqlSession,goods);
	}

	@Override
	public void deleteGoods(int goodsNo) {
		aDAO.deleteGoods(sqlSession,goodsNo);
	}
	
	//0709 +수정+
	@Override
	public void insertSingleImage(Image image) {
		aDAO.insertSingleImage(sqlSession,image);
	}

	@Override
	public Image selectAnimalImage(int aniNO) {
		return aDAO.selectAnimalImage(sqlSession,aniNO);
	}

	@Override
	public void deactivateOldAnimalImage(int aniNO) {
		aDAO.deactivateOldAnimalImage(sqlSession,aniNO);
	}

	@Override
	public void updateAnimalImage(Image existingImage) {
		aDAO.updateAnimalImage(sqlSession,existingImage);
	}

	@Override
	public Image getMascotImage() {
		return aDAO.getMascotImage(sqlSession);
	}//

	@Override
	public Image getGoodsInfoImage() {
		return aDAO.getGoodsInfoImage(sqlSession);
	}

	@Override
	public void updateGoodsInfoImage(Image image) {
		aDAO.updateGoodsInfoImage(sqlSession,image);
	}

	@Override
	public void updateMascotImage(Image image) {
		aDAO.updateMascotImage(sqlSession,image);
	}

	@Override
	public List<Animal> getAnimalsByClass(String string) {
		return aDAO.getAnimalByClass(sqlSession,string);
	}

	@Override
	public List<Goods> getMascotGoods() {
		return aDAO.getMascotGoods(sqlSession);
	}

	@Override
	public int insertGoods(Goods goods) {
		return aDAO.insertGoods(sqlSession, goods);
	}

	@Override
	public void insertGoodsImage(Image image) {
	    aDAO.insertGoodsImage(sqlSession, image);
	}

	@Override
	public void deactivateOldGoodsImage(int goodsNo) {
		aDAO.deactivateOldGoodsImage(sqlSession,goodsNo);
	}

	@Override
	public Image selectGoodsImage(int goodsNo) {
		return aDAO.selectGoodsImage(sqlSession,goodsNo);
	}

	@Override
	public List<Goods> getMascotGoodsWithImages() {
		return aDAO.getMascotGoodsWithImages(sqlSession);
	}//
	
	@Override
	public Image checkBanner(int i) {
		return aDAO.checkBanner(sqlSession, i);
	}

	@Override
	public int updateMainImg(Image image) {
		return aDAO.updateMainImg(sqlSession, image);
	}


	@Override
	public int insertMainImg(Image image) {
		return aDAO.insertMainImg(sqlSession, image);
	}


	@Override
	public ArrayList<Image> getBannerImg() {
		return aDAO.getBannerImg(sqlSession);
	}


	@Override
	public ArrayList<Image> getOneeyeImg() {
		return aDAO.getOneeyeImg(sqlSession);
	}


	@Override
	public ArrayList<Link> getBannerLink() {
		return aDAO.getBannerLink(sqlSession);
	}


	@Override
	public ArrayList<Link> getOneeyeLink() {
		return aDAO.getoneeyeLink(sqlSession);
	}


	@Override
	public void updateMainLink(Link link) {
		aDAO.updateMainLink(sqlSession, link);
	}


	@Override
	public Image checkOneeye(Integer integer) {
		return aDAO.checkOneeye(sqlSession, integer);
	}


	@Override
	public int getShowListCount() {
		return aDAO.getShowListCount(sqlSession);
	}//


	@Override
	public ArrayList<Show> getShowList(PageInfo pi) {
		return aDAO.getShowList(sqlSession, pi);
	}//


	@Override
	public int insertShow(Show show) {
		return aDAO.insertShow(sqlSession, show);
	}


	@Override
	public Show getShow(int showNo) {
		return aDAO.getShow(sqlSession, showNo);
	}


	@Override
	public Image getImg(Image img) {
		return aDAO.getImg(sqlSession, img);
	}


	@Override
	public int deleteShow(int showNo) {
		return aDAO.deleteShow(sqlSession, showNo);
	}


	@Override
	public void deleteShowImg(int showNo) {
		aDAO.deleteShowImg(sqlSession, showNo);
	}


	@Override
	public ArrayList<Image> getImgList(int showNo) {
		return aDAO.getImgList(sqlSession, showNo);
	}


	@Override
	public int updateShow(Show show) {
		return aDAO.updateShow(sqlSession, show);
	}


	@Override
	public int updateShowImg(HashMap<String, Object> map) {
		return aDAO.updateShowImg(sqlSession, map);
	}
	
	// 게시글 수 조회 (페이지네이션용)
	@Override
	public int getListCount(int i) {
		return aDAO.getListCount(sqlSession, i);
	}//
	
	// 공지사항 게시글 리스트 조회
	@Override
	public ArrayList<Board> selectNoBoardList(PageInfo pi, int i) {
		return aDAO.selectNoBoardList(sqlSession, pi, i);
	}//

	// 문의사항 게시글 리스트 조회
	@Override
	public ArrayList<Board> selectQuBoardList(PageInfo pi, int i) {
		return aDAO.selectQuBoardList(sqlSession, pi, i);
	}//

	// 후기리스트 게시글 리스트 조회
	@Override
	public ArrayList<Board> selectReBoardList(PageInfo pi, int i) {
		return aDAO.selectReBoardList(sqlSession, pi, i);
	}//

	// 예약리스트 게시글 리스트 조회
	@Override
	public ArrayList<Board> selectBoBoardList(PageInfo pi, int i) {
		return aDAO.selectBoBoardList(sqlSession, pi, i);
	}//

	// 공지사항 게시글 상세 조회
	@Override
	public Board selectNoBoard(int bId, Integer userNo) {
		Board b = aDAO.seletNoBoard(sqlSession, bId);
		
		if(b != null) {
			if(userNo != null && userNo != b.getBoardWriterNo()) {
				int result = aDAO.updateCount(sqlSession, bId);
				
				if(result >0) {
					b.setBoardCount(b.getBoardCount() + 1);
				}
			}
		}
		return b;
	}

	// 이미지
	@Override
	public ArrayList<Image> selectImg(int bId) {
		return aDAO.selectImg(sqlSession, bId);
	}
	
	// 후기리스트 게시글 상세 조회
	@Override
	public Board selectReBoard(int bId, Integer userNo) {
		Board b = aDAO.selectReBoard(sqlSession, bId);
		
		if(b != null) {
			if(userNo != null && userNo != b.getBoardWriterNo()) {
				int result = aDAO.updateCount(sqlSession, bId);
				
				if(result >0) {
					b.setBoardCount(b.getBoardCount() + 1);
				}
			}
		}
		return b;
	}

	// 상세 글 보기 + 조회수 증가
	@Override
	public Board selectQuBoBoard(int bId, Integer userNo) {
		Board b = aDAO.selectQuBoBoard(sqlSession, bId);
		
		if(b != null) {
			if(userNo != null && userNo != b.getBoardWriterNo()) {
				int result = aDAO.updateCount(sqlSession, bId);
				
				if(result >0) {
					b.setBoardCount(b.getBoardCount() + 1);
				}
			}
		}
		return b;
	}

	// 말머리 필터 게시글 수 조회
	@Override
	public int listSubjectCount(String noSubject) {
		return aDAO.listSubjectCount(sqlSession, noSubject);
	}

	// 말머리 필터 게시글 리스트 조회
	@Override
	public ArrayList<Board> searchFilter(String noSubject, PageInfo pi) {
		return aDAO.searchFilter(sqlSession, noSubject, pi);
	}

	// 검색어 게시글 수 조회
	@Override
	public int listSearchCount(HashMap<String, Object> map) {
		return aDAO.listSearchCount(sqlSession, map);
	}

	// 공지사항 검색어 리스트 조회
	@Override
	public ArrayList<Board> searchNoBoard(HashMap<String, Object> map, PageInfo pi) {
		return aDAO.searchNoBoard(sqlSession, map, pi);
	}

	// 후기리스트 검색어 리스트 조회
	@Override
	public ArrayList<Board> searchReBoard(HashMap<String, Object> map, PageInfo pi) {
		return aDAO.searchReBoard(sqlSession, map, pi);
	}

	// 예약리스트/문의사항 검색어 리스트 조회
	@Override
	public ArrayList<Board> searchQuBoBoard(HashMap<String, Object> map, PageInfo pi) {
		return aDAO.searchQuBoBoard(sqlSession, map, pi);
	}

	// 상세보기에서 게시글 삭제
	@Override
	public int deleteBoard(int boardNo) {
		return aDAO.deleteBaord(sqlSession, boardNo);
	}

	// 게시글 삭제와 동시에 이미지도 삭제
	@Override
	public int updateImgStatus(int boardNo) {
		return aDAO.updateImgStatus(sqlSession, boardNo);
	}

	// 기존 이미지 삭제
	@Override
	public int deleteImg(ArrayList<String> deleteImg) {
		return aDAO.deleteImg(sqlSession, deleteImg);
	}

	// 게시글 수정 - 문의/예약 글일 경우
	@Override
	public int updateQuBo(Board b) {
		return aDAO.updateQuBo(sqlSession, b);
	}

	// 게시글 수정 - 공지사항일 경우
	@Override
	public int updateNotice(Board b) {
		return aDAO.updateNotice(sqlSession, b);
	}

	// 게시글 수정 - 게시글 정보 업데이트
	@Override
	public int updateBoard(Board b) {
		return aDAO.updateBoard(sqlSession, b);
	}

	// 게시글 수정 - 추가 이미지가 있을 때
	@Override
	public int insertImg(ArrayList<Image> list) {
		return aDAO.insertImg(sqlSession, list);
	}
	
	// 공지사항 게시글 수 조회
	@Override
	public int getNoListCount(int i) {
		return aDAO.getNoListCount(sqlSession, i);
	}

	// 글쓰기
	@Override
	public int insertBoard(Board b) {
		return aDAO.insertBoard(sqlSession, b);
	}

	// 글쓰기 - 공지사항
	@Override
	public int insertNo(Board b) {
		return aDAO.insertNo(sqlSession, b);
	}

	// 글쓰기 - 문의사항/예약
	@Override
	public int insertQuBo(Board b) {
		return aDAO.insertQuBo(sqlSession, b);
	}

	// 체크 글 삭제 - 글 상태 변경
	@Override
	public int checkDelete(int boardNo) {
        return aDAO.checkDelete(sqlSession, boardNo); 
    }
	
	// 체크 글 삭제 - 카테고리 번호 가져오기
	@Override
	public int getCategoryByBoardNo(int boardNoInt) {
		return aDAO.getCategoryByBoardNo(sqlSession, boardNoInt);
	}
	
	@Override
	public Image getOperatingImage() {
	    return aDAO.getOperatingImage(sqlSession);
	}

	@Override
	public Image getChargeImage() {
	    return aDAO.getChargeImage(sqlSession);
	}

	@Override
	public void updateOperatingImage(Image image) {
		aDAO.updateOperatingImage(sqlSession, image);
	}

	@Override
	public void updateChargeImage(Image image) {
		aDAO.updateChargeImage(sqlSession, image);
	}
	
	@Override
	public int insertGreeting(Image i) {
		return aDAO.insertGreeting(sqlSession,i);
	}

	@Override
	public int insertWay(Image i) {
		return aDAO.insertWay(sqlSession, i);
	}

	@Override
	public int updateMapLink(Link mapLink) {
		return aDAO.updateMapLink(sqlSession, mapLink);
	}

	@Override
	public int insertMapLink(Link mapLink) {
		return aDAO.insertMapLink(sqlSession, mapLink);
	}
	
	// 댓글 리스트 조회
	@Override
	public ArrayList<Reply> selectReply(int bId) {
		return aDAO.selectReply(sqlSession, bId);
	}

	// 댓글 등록
	@Override
	public int insertReply(Reply r) {
		return aDAO.insertReply(sqlSession, r);
	}

	// 댓글 삭제
	@Override
	public int deleteReply(int reId) {
		return aDAO.deleteReply(sqlSession, reId);
	}


	// 댓글 수정
	@Override
	public int updateReply(Reply r) {
		return aDAO.updateReply(sqlSession, r);
	}
	
	// 게시글 삭제 시 댓글 상태 변경
	@Override
	public int updateReplyStatus(int boardNo) {
		return aDAO.updateReplyStatus(sqlSession, boardNo);
	}

	// 상세 글 보기 - 문의/예약 게시판에서 답글이 있을 시 진행상태를  Y로 변경
	@Override
	public void updateQuBoStatusY(int bId) {
		aDAO.updateQuBoStatusY(sqlSession, bId);
	}

	// 상세 글 보기 - 문의/예약 게시판에서 답글이 있을 시 진행상태를 N으로 변경
	@Override
	public void updateQuBoStatusN(int bId) {
		aDAO.updateQuBoStatusN(sqlSession, bId);
	}

	@Override
	public ArrayList<Board> FAQView(PageInfo pi) {
		return aDAO.FAQView(sqlSession, pi);
	}

	@Override
	public int getFAQListCount() {
		return aDAO.getFAQListCount(sqlSession);
	}

	@Override
	public int deleteFAQ(int FAQNo) {
		return aDAO.deleteFAQ(sqlSession, FAQNo);
	}

	@Override
	public Board getFAQ(int faqNo) {
		return aDAO.getFAQ(sqlSession, faqNo);
	}

	@Override
	public int insertFAQ(Board b) {
		return aDAO.insertFAQ(sqlSession, b);
	}

	@Override
	public int updateFAQ(Board b) {
		return aDAO.updateFAQ(sqlSession, b);
	}
	
	@Override
	public Link getShowLink() {
		return aDAO.getShowLink(sqlSession);
	}


	@Override
	public void deleteExistingShowImage() {
		aDAO.deleteExistingShowImage(sqlSession);
	}
	
	@Override
	public int insertProtitleImg(Image i) {
		return aDAO.insertProtitleImg(sqlSession, i);
	}

	@Override
	public int updateShowLink(Link showLink) {
		return aDAO.updateShowLink(sqlSession, showLink);
	}

	@Override
	public int insertShowLink(Link showLink) {
		return aDAO.insertShowLink(sqlSession, showLink);
	}
	
	@Override
	public void deleteGreeting() {
		aDAO.deleteGreeting(sqlSession);
	}

	@Override
	public void deleteWay() {
		aDAO.deleteWay(sqlSession);
	}
	
	@Override
	public ArrayList<Reply> selectQuBoReply(int bId) {
		return aDAO.selectQuBoReply(sqlSession, bId);
	}
	//07.15
	@Override
	public int insertQuBoReply(Reply r) {
		return aDAO.insertQuBoReply(sqlSession, r);
	}
	//07.15
	@Override
	public int deleteQuBoReply(int reId) {
		return aDAO.deleteQuBoReply(sqlSession, reId);
	}
	//07.15
	@Override
	public int updateQuBoReply(Reply r) {
		return aDAO.updateQuBoReply(sqlSession, r);
	}
	
// 회원 수 조회
	@Override
	public int getMemberListCount() {
		return aDAO.getMemberListCount(sqlSession);
	}

	// 회원 리스트 조회
	@Override
	public ArrayList<Member> selectMemberList(PageInfo pi) {
		return aDAO.selectMemberList(sqlSession, pi);
	}

	// 회원 등급 말머리 필터 - 회원 수 검색
	@Override
	public int listMemGradeCount(HashMap<String, Object> map) {
		return aDAO.listMemGradeCount(sqlSession, map);
	}

	// 회원 등급 말머리 필터 - 회원 리스트 조회
	@Override
	public ArrayList<Member> memGradeFilter(HashMap<String, Object> map, PageInfo pi) {
		return aDAO.memGradeFilter(sqlSession, map, pi);
	}

	// 회원 상태 말머리 필터 - 회원 수 검색
	@Override
	public int listMemActiveCount(HashMap<String, Object> map) {
		return aDAO.listMemActiveCount(sqlSession, map);
	}

	// 회원 상태 말머리 필터 - 회원 리스트 검색
	@Override
	public ArrayList<Member> memActiveFilter(HashMap<String, Object> map, PageInfo pi) {
		return aDAO.memActiveFilter(sqlSession, map, pi);
	}

	// 비밀번호 초기화
	@Override
	public int updatePwd(List<Map<String, Object>> updateList) {
		return aDAO.updatePwd(sqlSession, updateList);
	}


	// 회원 상태 변경
	@Override
	public int statusChange(List<String> memberNos) {
		return aDAO.statusChange(sqlSession, memberNos);
	}

	// 회원 검색 - 회원 수 조회
	@Override
	public int listSearchMemberCount(HashMap<String, Object> map) {
		return aDAO.listSearchMemberCount(sqlSession, map);
	}
	// 회원 검색 - 검색어 리스트 조회
	@Override
	public ArrayList<Member> searchMember(HashMap<String, Object> map, PageInfo pi) {
		return aDAO.searchMember(sqlSession, map, pi);
	}

	// 등급 변환 07.16
   @Override
   public int changeGrade(int memNo) {
      return aDAO.changeGrade(sqlSession, memNo);
   }
   //07.16
   @Override
   public Member checkGrade(int memNo) {
      return aDAO.checkGrade(sqlSession, memNo);
   }
   //07.16
	@Override
	public int memberStatusListCount(String status) {
		return aDAO.memberStatusListCount(sqlSession, status);
	}
	//07.16
	@Override
	public ArrayList<Member> memberStatus(PageInfo pi) {
		return aDAO.memberStatus(sqlSession, pi);
	}
	//07.16
	@Override
	public int memberStatusYListCount(String status) {
		return aDAO.memberStatusY(sqlSession, status);
	}
	//07.16
	@Override
	public ArrayList<Member> memberStatusY(PageInfo pi) {
		return aDAO.memberStatusY(sqlSession, pi);
	}
	//07.16
	@Override
	public int memberGradeListCount(String memGrade) {
		return aDAO.memberGradeListCount(sqlSession, memGrade);
	}
	//07.16
	@Override
	public ArrayList<Member> memberStatGra(String memGrade, PageInfo pi) {
		return aDAO.memberStatGra(sqlSession, memGrade, pi);
	}
	//07.16
	@Override
	public int memberGradeYListCount(String memGrade) {
		return aDAO.memberGradeYListCount(sqlSession, memGrade);
	}
	//07.16
	@Override
	public ArrayList<Member> memberStatGraY(String memGrade, PageInfo pi) {
		return aDAO.memberStatGraY(sqlSession, memGrade, pi);
	}
		
}
