package com.semiproject.healingzoo.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semiproject.healingzoo.admin.model.vo.Show;
import com.semiproject.healingzoo.board.model.vo.Animal;
import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.Goods;
import com.semiproject.healingzoo.board.model.vo.Image;
import com.semiproject.healingzoo.board.model.vo.Link;
import com.semiproject.healingzoo.board.model.vo.PageInfo;
import com.semiproject.healingzoo.board.model.vo.Reply;

@Repository("aDAO")
public class AdminDAO {
	
	public void deleteAnimalImage(SqlSession sqlSession, int aniNO) {
		sqlSession.delete("adminMapper.deleteAnimalImage",aniNO);
	}

	
	public ArrayList<Animal> selectFamilyList(SqlSession sqlSession, PageInfo pi,Map<String, String> filters) { // + 수정 +
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return (ArrayList) sqlSession.selectList("adminMapper.selectFamilyList",filters,rowBounds);
    }

	public int getAnimalCount(SqlSession sqlSession,Map<String, String> filters) { //+수정+ return
		return sqlSession.selectOne("adminMapper.getAnimalCount",filters); 
	}


	public ArrayList<Goods> selectMascotList(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectMascotList");
	}


	public int insertAnimal(SqlSession sqlSession, Animal animal) {
		return sqlSession.insert("adminMapper.insertAnimal",animal);
	}


	public int deleteAnimal(SqlSession sqlSession, List<Integer> aniNOs) {
		return sqlSession.delete("adminMapper.deleteAnimal",aniNOs);
	}


	public Animal selectAnimal(SqlSession sqlSession, int aniNO) {
	    List<Animal> result = sqlSession.selectList("adminMapper.selectAnimal", aniNO);
	    if (result != null && !result.isEmpty()) {
	        return result.get(0);
	    }
	    return null;
	}


	public int updateAnimal(SqlSession sqlSession, Animal animal) {
		return sqlSession.update("adminMapper.updateAnimal",animal);
	}


	public List<Animal> getAllAnimals(SqlSession sqlSession) {
		return sqlSession.selectList("adminMapper.getAllAnimal");
	}

	public Goods selectGoods(SqlSession sqlSession, int goodsNo) {
		return (Goods) sqlSession.selectOne("adminMapper.selectGoods",goodsNo);
	}


	public void updateGoods(SqlSession sqlSession, Goods goods) {
	    sqlSession.update("adminMapper.updateGoods", goods);
	}

	public void deleteGoods(SqlSession sqlSession, int goodsNo) {
	    sqlSession.delete("adminMapper.deleteGoods", goodsNo);
	}
	
	//0709 +수정+
	public int insertGoods(SqlSession sqlSession, Goods goods) {
	    sqlSession.insert("adminMapper.insertGoods", goods);
	    return goods.getGoodsNo();
	}

	public void insertSingleImage(SqlSession sqlSession, Image image) {
		sqlSession.insert("adminMapper.insertSingleImage",image);
	}


	public Image selectAnimalImage(SqlSession sqlSession, int aniNO) {
		return sqlSession.selectOne("adminMapper.selectAnimalImage",aniNO);
	}


	public void deactivateOldAnimalImage(SqlSession sqlSession, int aniNO) {
		sqlSession.update("adminMapper.deactivateOldAnimalImage",aniNO);
	}


	public void updateAnimalImage(SqlSession sqlSession, Image existingImage) {
		sqlSession.update("adminMapper.updateAnimalImage",existingImage);
	}
	
	public void updateMascotImage(SqlSession sqlSession, Image image) {
	    sqlSession.update("adminMapper.updateMascotImage", image);
	}

	public void updateGoodsInfoImage(SqlSession sqlSession, Image image) {
	    sqlSession.update("adminMapper.updateGoodsInfoImage", image);
	}

	public Image getMascotImage(SqlSession sqlSession) {
	    return sqlSession.selectOne("adminMapper.getMascotImage");
	}

	public Image getGoodsInfoImage(SqlSession sqlSession) {
	    return sqlSession.selectOne("adminMapper.getGoodsInfoImage");
	}


	public List<Animal> getAnimalByClass(SqlSession sqlSession, String string) {
		return sqlSession.selectList("adminMapper.getAnimalByClass",string);
	}


	public List<Goods> getMascotGoods(SqlSession sqlSession) {
		return sqlSession.selectList("adminMapper.getMascotGoods");
	}


	public void insertGoodsImage(SqlSession sqlSession, Image image) {
	    sqlSession.insert("adminMapper.insertGoodsImage", image);
	}


	public void deactivateOldGoodsImage(SqlSession sqlSession, int goodsNo) {
		sqlSession.update("adminMapper.deactivateOldGoodsImage",goodsNo);
	}


	public Image selectGoodsImage(SqlSession sqlSession, int goodsNo) {
		return sqlSession.selectOne("adminMapper.selectGoodsImage",goodsNo);
	}


	public List<Goods> getMascotGoodsWithImages(SqlSession sqlSession) {
		return sqlSession.selectList("adminMapper.getMascotGoodsWithImages");
	}
	
	public Image checkBanner(SqlSession sqlSession, int i) {
		return sqlSession.selectOne("adminMapper.checkBanner", i);
	}



	public int updateMainImg(SqlSession sqlSession, Image image) {
		return sqlSession.update("adminMapper.updateMainImg", image);
	}



	public int insertMainImg(SqlSession sqlSession, Image image) {
		return sqlSession.insert("adminMapper.insertMainImg", image);
	}



	public ArrayList<Image> getBannerImg(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.getBannerImg");
	}



	public ArrayList<Image> getOneeyeImg(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.getOneeyeImg");
	}



	public ArrayList<Link> getBannerLink(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.getBannerLink");
	}



	public ArrayList<Link> getoneeyeLink(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.getOneeyeLink");
	}



	public void updateMainLink(SqlSession sqlSession, Link link) {
		sqlSession.update("adminMapper.updateMainLink", link);
	}


	public Image checkOneeye(SqlSession sqlSession, Integer integer) {
		return sqlSession.selectOne("adminMapper.checkOneeye", integer);
	}



	public int getShowListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.getShowListCount");
	}



	public ArrayList<Show> getShowList(SqlSession sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.getShowList", pi, rowBounds);
	}



	public int insertShow(SqlSession sqlSession, Show show) {
		return sqlSession.insert("adminMapper.insertShow", show);
	}



	public Show getShow(SqlSession sqlSession, int showNo) {
		return sqlSession.selectOne("adminMapper.getShow", showNo);
	}



	public Image getImg(SqlSession sqlSession, Image img) {
		return sqlSession.selectOne("adminMapper.getImg", img);
	}



	public int deleteShow(SqlSession sqlSession, int showNo) {
		return sqlSession.delete("adminMapper.deleteShow", showNo);
	}



	public void deleteShowImg(SqlSession sqlSession, int showNo) {
		sqlSession.delete("adminMapper.deleteShowImg", showNo);
	}



	public ArrayList<Image> getImgList(SqlSession sqlSession, int showNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.getImgList", showNo);
	}



	public int updateShow(SqlSession sqlSession, Show show) {
		return sqlSession.update("adminMapper.updateShow", show);
	}



	public int updateShowImg(SqlSession sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("adminMapper.updateShowImg", map);
	}
	
	// 게시글 수 조회 (페이지네이션용)
	public int getListCount(SqlSession sqlSession, int i) {
		return sqlSession.selectOne("adminMapper.getListCount", i);
	}
	
	
	// 공지사항 게시글 리스트 조회
	public ArrayList<Board> selectNoBoardList(SqlSession sqlSession, PageInfo pi, int i) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectNoBoardList", i, rowBounds);
	}

	// 문의사항 게시글 리스트 조회
	public ArrayList<Board> selectQuBoardList(SqlSession sqlSession, PageInfo pi, int i) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectAllQueBookList", i, rowBounds);
	}


	// 후기리스트 게시글 리스트 조회
	public ArrayList<Board> selectReBoardList(SqlSession sqlSession, PageInfo pi, int i) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectReBoardList", i, rowBounds);
	}


	// 예약리스트 게시글 리스트 조회
	public ArrayList<Board> selectBoBoardList(SqlSession sqlSession, PageInfo pi, int i) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectAllQueBookList", i, rowBounds);
	}


	// 공지사항 게시글 상세 조회
	public Board seletNoBoard(SqlSession sqlSession, int bId) {
		return sqlSession.selectOne("adminMapper.selectNoBoard", bId);
	}

	// 조회수 증가용
	public int updateCount(SqlSession sqlSession, int bId) {
		return sqlSession.update("adminMapper.updateCount", bId);
	}

	// 이미지
	public ArrayList<Image> selectImg(SqlSession sqlSession, int bId) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectImg", bId);
	}
	
	// 후기리스트 게시글 상세 조회
	public Board selectReBoard(SqlSession sqlSession, int bId) {
		return sqlSession.selectOne("adminMapper.selectReBoard", bId);
	}

	// 상세 글 보기 + 조회수 증가
	public Board selectQuBoBoard(SqlSession sqlSession, int bId) {
		return sqlSession.selectOne("adminMapper.selectQuBoBoard", bId);
	}

	// 말머리 필터 게시글 수 조회
	public int listSubjectCount(SqlSession sqlSession, String noSubject) {
		return sqlSession.selectOne("adminMapper.listSubjectCount", noSubject);
	}

	// 말머리 필터 게시글 리스트 조회
	public ArrayList<Board> searchFilter(SqlSession sqlSession, String noSubject, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.searchFilter", noSubject, rowBounds);
	}

	// 검색어 게시글 수 조회
	public int listSearchCount(SqlSession sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("adminMapper.listSearchCount", map);
	}

	// 공지사항 검색어 리스트 조회
	public ArrayList<Board> searchNoBoard(SqlSession sqlSession, HashMap<String, Object> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.searchNoBoard", map, rowBounds);
	}

	// 후기리스트 검색어 리스트 조회
	public ArrayList<Board> searchReBoard(SqlSession sqlSession, HashMap<String, Object> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.searchReBoard", map, rowBounds);
	}

	// 예약리스트/문의사항 검색어 리스트 조회
	public ArrayList<Board> searchQuBoBoard(SqlSession sqlSession, HashMap<String, Object> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.searchQuBoBoard", map, rowBounds);
	}


	// 상세보기에서 게사글 삭제
	public int deleteBaord(SqlSession sqlSession, int boardNo) {
		return sqlSession.update("adminMapper.deleteBoard", boardNo);
	}
	
	// 게시글 삭제와 동시에 이미지도 삭제
	public int updateImgStatus(SqlSession sqlSession, int boardNo) {
		return sqlSession.update("adminMapper.updateImgStatus", boardNo);
	}

	// 기존 이미지 삭제
	public int deleteImg(SqlSession sqlSession, ArrayList<String> deleteImg) {
		return sqlSession.delete("adminMapper.deleteImg", deleteImg);
	}

	// 게시글 수정 - 문의/예약 글일 경우
	public int updateQuBo(SqlSession sqlSession, Board b) {
		return sqlSession.update("adminMapper.updateQuBo", b);
	}


	// 게시글 수정 - 공지사항일 경우
	public int updateNotice(SqlSession sqlSession, Board b) {
		return sqlSession.update("adminMapper.updateNotice", b);
	}


	// 게시글 수정 - 게시글 정보 업데이트
	public int updateBoard(SqlSession sqlSession, Board b) {
		return sqlSession.update("adminMapper.updateBoard", b);
	}


	// 게시글 수정 - 추가 이미지가 있을 때
	public int insertImg(SqlSession sqlSession, ArrayList<Image> list) {
		return sqlSession.insert("adminMapper.insertImg", list);
	}

	// 공지사항 게시글 수 조회
	public int getNoListCount(SqlSession sqlSession, int i) {
		return sqlSession.selectOne("adminMapper.getNoListCount", i);
	}


	// 글쓰기
	public int insertBoard(SqlSession sqlSession, Board b) {
		return sqlSession.insert("adminMapper.insertBoard", b);
	}

	// 글쓰기 - 공지사항
	public int insertNo(SqlSession sqlSession, Board b) {
		return sqlSession.insert("adminMapper.insertNo", b);
	}

	// 글쓰기 - 문의사항/예약
	public int insertQuBo(SqlSession sqlSession, Board b) {
		return sqlSession.insert("adminMapper.insertQuBo", b);
	}


	// 체크 삭제 - 글 상태 변경
	public int checkDelete(SqlSession sqlSession, int boardNo) {
		return sqlSession.update("adminMapper.checkDelete", boardNo);
	}

	// 체크 삭제 - 카테고리 번호 가져오기
	public int getCategoryByBoardNo(SqlSession sqlSession, int boardNoInt) {
		return sqlSession.selectOne("adminMapper.getCategoryByBoardNo", boardNoInt);
	}
	
	public Image getOperatingImage(SqlSession sqlSession) {
	    return sqlSession.selectOne("adminMapper.getOperatingImage");
	}

	public Image getChargeImage(SqlSession sqlSession) {
	    return sqlSession.selectOne("adminMapper.getChargeImage");
	}

	public void updateOperatingImage(SqlSession sqlSession, Image image) {
	    sqlSession.update("adminMapper.updateOperatingImage", image);
	}

	public void updateChargeImage(SqlSession sqlSession, Image image) {
	    sqlSession.update("adminMapper.updateChargeImage", image);
	}
	
	public int insertGreeting(SqlSession sqlSession, Image i) {
		return sqlSession.insert("adminMapper.insertGreeting", i);
	}

	public int insertWay(SqlSession sqlSession, Image i) {
		return sqlSession.insert("adminMapper.insertWay", i);
	}

	public int insertMapLink(SqlSession sqlSession, Link mapLink) {
		return sqlSession.insert("adminMapper.insertMapLink", mapLink);
	}

	public int updateMapLink(SqlSession sqlSession, Link mapLink) {
		return sqlSession.update("adminMapper.updateMapLink", mapLink);
	}
	
	// 댓글 리스트 조회
	public ArrayList<Reply> selectReply(SqlSession sqlSession, int bId) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectReply", bId);
	}


	// 댓글 등록
	public int insertReply(SqlSession sqlSession, Reply r) {
		return sqlSession.insert("adminMapper.insertReply", r);
	}

	// 댓글 삭제
	public int deleteReply(SqlSession sqlSession, int reId) {
		return sqlSession.delete("adminMapper.deleteReply", reId);
	}

	// 댓글 수정
	public int updateReply(SqlSession sqlSession, Reply r) {
		return sqlSession.update("adminMapper.updateReply", r);
	}

	// 게시글 삭제 시 댓글 상태 변경
	public int updateReplyStatus(SqlSession sqlSession, int boardNo) {
		return sqlSession.update("adminMapper.updateReplyStatus", boardNo);
	}

	// 상세 글 보기 - 문의/예약 게시판에서 답글이 있을 시 진행상태를  Y로 변경
	public void updateQuBoStatusY(SqlSession sqlSession, int bId) {
		 sqlSession.update("adminMapper.updateQuBoStatusY", bId);
	}

	// 상세 글 보기 - 문의/예약 게시판에서 답글이 있을 시 진행상태를 N으로 변경
	public void updateQuBoStatusN(SqlSession sqlSession, int bId) {
		sqlSession.update("adminMapper.updateQuBoStatusN", bId);
	}

	public ArrayList<Board> FAQView(SqlSession sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.FAQView", rowBounds);
	}

	public int getFAQListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.getFAQListCount");
	}

	public int deleteFAQ(SqlSession sqlSession, int faqNo) {
		return sqlSession.delete("adminMapper.deleteFAQ", faqNo);
	}

	public Board getFAQ(SqlSession sqlSession, int faqNo) {
		return sqlSession.selectOne("adminMapper.getFAQ", faqNo);
	}

	public int insertFAQ(SqlSession sqlSession, Board b) {
		return sqlSession.insert("adminMapper.insertFAQ", b);
	}

	public int updateFAQ(SqlSession sqlSession, Board b) {
		return sqlSession.update("adminMapper.updateFAQ", b);
	}
	
	public Link getShowLink(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.getShowLink");
	}

	public void deleteExistingShowImage(SqlSession sqlSession) {
		sqlSession.delete("adminMapper.deleteExistingShowImage");
	}
	
	public Image getGoodsImage(SqlSession sqlSession,int goodsNo) {
		return sqlSession.selectOne("adminMapper.getGoodsImage", goodsNo);
	}

	public void deleteGoodsImage(SqlSession sqlSession,int goodsNo) {
        sqlSession.delete("adminMapper.deleteGoodsImage", goodsNo);
    }
	
	public int insertProtitleImg(SqlSession sqlSession, Image i) {
		return sqlSession.insert("adminMapper.insertProtitleImg", i);
	}



	public int updateShowLink(SqlSession sqlSession, Link showLink) {
		return sqlSession.update("adminMapper.updateShowLink", showLink);
	}



	public int insertShowLink(SqlSession sqlSession, Link showLink) {
		return sqlSession.insert("adminMapper.insertShowLink", showLink);
	}
	
	
}
