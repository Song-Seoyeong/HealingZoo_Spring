package com.semiproject.healingzoo.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semiproject.healingzoo.board.model.vo.Animal;
import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.Goods;
import com.semiproject.healingzoo.board.model.vo.Image;
import com.semiproject.healingzoo.board.model.vo.PageInfo;
import com.semiproject.healingzoo.board.model.vo.Reply;

@Repository
public class BoardDAO {

	// 페이지네이션용
	public int getListCount(SqlSession sqlSession, int i) {
		return sqlSession.selectOne("boardMapper.getListCount", i);
	}

	
	// 문의/예약 게시글 리스트 조회
	public ArrayList<Board> selectAllQueBookList(SqlSession sqlSession, PageInfo pi, int i) {
	int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
	RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
									// 건너뛸 게시글 수, 선택할 게시글 수
		return (ArrayList)sqlSession.selectList("boardMapper.selectAllQueBookList", i, rowBounds);
	}


	public int insertBoard(SqlSession sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}


	public int insertImg(SqlSession sqlSession, ArrayList<Image> list) {
		return sqlSession.insert("boardMapper.insertImg", list);
	}


	public int insertQuBo(SqlSession sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertQuBo", b);
	}


	public Board seletBoard(SqlSession sqlSession, int bId) {
		return sqlSession.selectOne("boardMapper.selectBoard", bId);
	}


	public int updateCount(SqlSession sqlSession, int bId) {
		return sqlSession.update("boardMapper.updateCount", bId);
	}


	public ArrayList<Image> selectImg(SqlSession sqlSession, int bId) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectImg", bId);
	}


	public int deleteBaord(SqlSession sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.deleteBoard", boardNo);
	}


	public int updateImgStatus(SqlSession sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.updateImgStatus", boardNo);
	}


	public int deleteImg(SqlSession sqlSession, ArrayList<String> deleteImg) {
		return sqlSession.delete("boardMapper.deleteImg", deleteImg);
	}


	public int updateBoard(SqlSession sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateBoard", b);
	}


	public int updateQuBo(SqlSession sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateQuBo", b);
	}
	
	public ArrayList<Board> selectNoBoardList(SqlSession sqlSession, PageInfo pi, int i) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectNoBoardList", i, rowBounds);
	}

	public ArrayList<Board> selectBoardList(SqlSession sqlSession, PageInfo pi, int i) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoardList", i, rowBounds);
	}

	public ArrayList<Board> selectReBoardList(SqlSession sqlSession, PageInfo pi, int i) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectReBoardList", i, rowBounds);
	}

	public Board seletNoBoard(SqlSession sqlSession, int bId) {
		return sqlSession.selectOne("boardMapper.selectNoBoard", bId);
	}


	public Board seletReBoard(SqlSession sqlSession, int bId) {
		return sqlSession.selectOne("boardMapper.selectReBoard", bId);
	}


	public ArrayList<Board> selectQuBoardList(SqlSession sqlSession, PageInfo pi, int i) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectAllQueBookList", i, rowBounds);
	}


	public ArrayList<Board> selectReMenuList(SqlSession sqlSession, PageInfo pi, int i) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectReBoardList", i, rowBounds);
	}


	public int checkPwdBoard(SqlSession sqlSession, Board b) {
		return sqlSession.selectOne("boardMapper.checkPwdBoard", b);
	}

	public int listSubjectCount(SqlSession sqlSession, String noSubject) {
		return sqlSession.selectOne("boardMapper.listSubjectCount", noSubject);
	}

	public ArrayList<Board> searchFilter(SqlSession sqlSession, String noSubject, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.searchFilter", noSubject, rowBounds);
	}

	public int listSearchCount(SqlSession sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("boardMapper.listSearchCount", map);
	}

	public ArrayList<Board> searchNoReBoard(SqlSession sqlSession, HashMap<String, Object> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.searchNoReBoard", map, rowBounds);
	}


	public int listSearchQuBoCount(SqlSession sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("boardMapper.listSearchQuBoCount", map);
	}


	public ArrayList<Board> searchQuBoBoard(SqlSession sqlSession, HashMap<String, Object> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.searchQuBoBoard", map, rowBounds);
	}


	public ArrayList<Reply> selectReply(SqlSession sqlSession, int bId) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectReply", bId);
	}


	public void insertNotice(SqlSession sqlSession, Board b) {
		sqlSession.insert("boardMapper.insertNotice", b);
	}


	public int updateNotice(SqlSession sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateNotice", b);
	}


	public int insertReply(SqlSession sqlSession, Reply r) {
		return sqlSession.insert("boardMapper.insertReply", r);
	}


	public int deleteReply(SqlSession sqlSession, int reId) {
		return sqlSession.delete("boardMapper.deleteReply", reId);
	}


	public int updateReplyStatus(SqlSession sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.updateReplyStatus", boardNo);
	}


	public int updateReply(SqlSession sqlSession, Reply r) {
		return sqlSession.update("boardMapper.updateReply", r);
	}


	public Image checkBanner(SqlSession sqlSession, int i) {
		return sqlSession.selectOne("boardMapper.checkBanner", i);
	}

	public ArrayList<Board> searchReBoard(SqlSession sqlSession, HashMap<String, Object> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.searchReBoard", map, rowBounds);
	}

	public ArrayList<Animal> selectFamilyList(SqlSession sqlSession, PageInfo pi) { // + 수정 +
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return (ArrayList) sqlSession.selectList("boardMapper.selectFamilyList",rowBounds);
    }


	
	public int getAnimalCount(SqlSession sqlSession) { //+수정+ return
		return sqlSession.selectOne("boardMapper.getAnimalCount"); 
	}


	public ArrayList<Goods> selectMascotList(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectMascotList");
	}


	public int insertAnimal(SqlSession sqlSession, Animal animal) {
		return sqlSession.insert("boardMapper.insertAnimal",animal);
	}


	public int deleteAnimal(SqlSession sqlSession, List<Integer> aniNOs) {
		return sqlSession.delete("boardMapper.deleteAnimal",aniNOs);
	}


	public Animal selectAnimal(SqlSession sqlSession, int aniNO) {
	    List<Animal> result = sqlSession.selectList("boardMapper.selectAnimal", aniNO);
	    if (result != null && !result.isEmpty()) {
	        return result.get(0);
	    }
	    return null;
	}


	public int updateAnimal(SqlSession sqlSession, Animal animal) {
		return sqlSession.update("boardMapper.updateAnimal",animal);
	}


	public List<Animal> getAllAnimals(SqlSession sqlSession) {
		return sqlSession.selectList("boardMapper.getAllAnimal");
	}

	public Goods selectGoods(SqlSession sqlSession, int goodsNo) {
		return (Goods) sqlSession.selectOne("boardMapper.selectGoods",goodsNo);
	}


	public void updateGoods(SqlSession sqlSession, Goods goods) {
	    sqlSession.update("boardMapper.updateGoods", goods);
	}

	public void deleteGoods(SqlSession sqlSession, int goodsNo) {
	    sqlSession.delete("boardMapper.deleteGoods", goodsNo);
	}

	public void insertGoods(SqlSession sqlSession, Goods goods) {
	    sqlSession.insert("boardMapper.insertGoods", goods);
	}

}
