package com.semiproject.healingzoo.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semiproject.healingzoo.admin.model.vo.Show;
import com.semiproject.healingzoo.board.model.dao.BoardDAO;
import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.Image;
import com.semiproject.healingzoo.board.model.vo.PageInfo;
import com.semiproject.healingzoo.board.model.vo.Reply;

@Service("bService")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private BoardDAO bDAO;

	@Override
	public int getListCount(int i) {
		return bDAO.getListCount(sqlSession, i);
	}//

	@Override
	public ArrayList<Board> selectAllQueBookList(PageInfo pi, int i) {
		return bDAO.selectAllQueBookList(sqlSession, pi, i);
	}//

	@Override
	public int insertBoard(Board b) {
		return bDAO.insertBoard(sqlSession, b);
	}//

	@Override
	public int insertImg(ArrayList<Image> list) {
		return bDAO.insertImg(sqlSession, list);
	}//

	@Override
	public int insertQuBo(Board b) {
		return bDAO.insertQuBo(sqlSession, b);
	}//

	@Override
	public Board selectBoard(int bId, Integer userNo) {
		Board b = bDAO.seletBoard(sqlSession, bId);
		
		if(b != null) {
			if(userNo != null && userNo != b.getBoardWriterNo()) {
				int result = bDAO.updateCount(sqlSession, bId);
				
				if(result >0) {
					b.setBoardCount(b.getBoardCount() + 1);
				}
			}
		}
		return b;
	}//

	@Override
	public ArrayList<Image> selectImg(int bId) {
		return bDAO.selectImg(sqlSession, bId);
	}//

	@Override
	public int deleteBoard(int boardNo) {
		return bDAO.deleteBaord(sqlSession, boardNo);
	}//

	@Override
	public int updateImgStatus(int boardNo) {
		return bDAO.updateImgStatus(sqlSession, boardNo);
	}//

	@Override
	public int deleteImg(ArrayList<String> deleteImg) {
		return bDAO.deleteImg(sqlSession, deleteImg);
	}//

	@Override
	public int updateBoard(Board b) {
		return bDAO.updateBoard(sqlSession, b);
	}//

	@Override
	public int updateQuBo(Board b) {
		return bDAO.updateQuBo(sqlSession, b);
	}//
	
	@Override
	public ArrayList<Board> selectNoBoardList(PageInfo pi, int i) {
		return bDAO.selectNoBoardList(sqlSession, pi, i);
	}

	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi, int i) {
		return bDAO.selectBoardList(sqlSession, pi, i);
	}

	@Override
	public ArrayList<Board> selectReBoardList(PageInfo pi, int i) {
		return bDAO.selectReBoardList(sqlSession, pi, i);
	}
	
	
	@Override
	public Board selectNoBoard(int bId, Integer userNo) {
		Board b = bDAO.seletNoBoard(sqlSession, bId);
		
		if(b != null) {
			if(userNo != null && userNo != b.getBoardWriterNo()) {
				int result = bDAO.updateCount(sqlSession, bId);
				
				if(result >0) {
					b.setBoardCount(b.getBoardCount() + 1);
				}
			}
		}
		return b;
	}//

	@Override
	public Board selectReBoard(int bId, Integer userNo) {
		Board b = bDAO.seletReBoard(sqlSession, bId);
		
		if(b != null) {
			if(userNo != null && userNo != b.getBoardWriterNo()) {
				int result = bDAO.updateCount(sqlSession, bId);
				
				if(result >0) {
					b.setBoardCount(b.getBoardCount() + 1);
				}
			}
		}
		return b;
	}//

	@Override
	public ArrayList<Board> selectQuBoardList(PageInfo pi, int i) {
		return bDAO.selectQuBoardList(sqlSession, pi, i);
	}

	@Override
	public ArrayList<Board> selectReMenuList(PageInfo pi, int i) {
		return bDAO.selectReMenuList(sqlSession, pi, i);
	}

	@Override
	public int checkPwdBoard(Board b) {
		return bDAO.checkPwdBoard(sqlSession, b);
	}//

	@Override
	public int listSubjectCount(String noSubject) {
		return bDAO.listSubjectCount(sqlSession, noSubject);
	}//

	@Override
	public ArrayList<Board> searchFilter(String noSubject, PageInfo pi) {
		return bDAO.searchFilter(sqlSession, noSubject, pi);
	}//


	@Override
	public int listSearchCount(HashMap<String, Object> map) {
		return bDAO.listSearchCount(sqlSession, map);
	}//

	@Override
	public ArrayList<Board> searchNoReBoard(HashMap<String, Object> map, PageInfo pi) {
		return bDAO.searchNoReBoard(sqlSession, map, pi);
	}//

	@Override
	public int listSearchQuBoCount(HashMap<String, Object> map) {
		return bDAO.listSearchQuBoCount(sqlSession, map);
	}//

	@Override
	public ArrayList<Board> searchQuBoBoard(HashMap<String, Object> map, PageInfo pi) {
		return bDAO.searchQuBoBoard(sqlSession, map, pi);
	}//

	@Override
	public ArrayList<Reply> selectReply(int bId) {
		return bDAO.selectReply(sqlSession, bId);
	}//

	@Override
	public void insertNotice(Board b) {
		bDAO.insertNotice(sqlSession, b);
	}//

	@Override
	public int updateNotice(Board b) {
		return bDAO.updateNotice(sqlSession, b);
	}//

	@Override
	public int insertReply(Reply r) {
		return bDAO.insertReply(sqlSession, r);
	}//

	@Override
	public int deleteReply(int reId) {
		return bDAO.deleteReply(sqlSession, reId);
	}//

	@Override
	public int updateReplyStatus(int boardNo) {
		return bDAO.updateReplyStatus(sqlSession, boardNo);
	}//

	@Override
	public int updateReply(Reply r) {
		return bDAO.updateReply(sqlSession, r);
	}//


	@Override
	public ArrayList<Board> searchReBoard(HashMap<String, Object> map, PageInfo pi) {
		return bDAO.searchReBoard(sqlSession, map, pi);
	}

	@Override
	public Image getOperatingImage() {
		return bDAO.getOperatingImage(sqlSession);
	}//

	@Override
	public Image getChargeImage() {
		return bDAO.getChargeImage(sqlSession);
	}//

	@Override
	public ArrayList<Reply> selectQuReply(int bId) {
		return bDAO.selectQuReply(sqlSession, bId);
	}//
	
	@Override
	public Image getShowImageByRefType(String linkRefType) {
		return bDAO.getShowImageByRefType(sqlSession,linkRefType);
	}//
	
	@Override
	public ArrayList<Show> getAllShows() {
		return bDAO.getAllShows(sqlSession);
	}//

	@Override
	public Image getShowImage(int showNo, int i) {
		return bDAO.getShowImage(sqlSession,showNo,i);
	}//
	
	@Override
	public Image getShowImage2(int i, int j) {
		return bDAO.getShowImage2(sqlSession,i,j);
	}//
}
