package com.semiproject.healingzoo.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semiproject.healingzoo.admin.model.vo.Show;
import com.semiproject.healingzoo.board.model.vo.Animal;
import com.semiproject.healingzoo.board.model.vo.Goods;
import com.semiproject.healingzoo.board.model.vo.Image;
import com.semiproject.healingzoo.board.model.vo.Link;
import com.semiproject.healingzoo.board.model.vo.PageInfo;

@Repository("aDAO")
public class AdminDAO {
	public ArrayList<Animal> selectFamilyList(SqlSession sqlSession, PageInfo pi) { // + 수정 +
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return (ArrayList) sqlSession.selectList("adminMapper.selectFamilyList",rowBounds);
    }


	
	public int getAnimalCount(SqlSession sqlSession) { //+수정+ return
		return sqlSession.selectOne("adminMapper.getAnimalCount"); 
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

	public void insertGoods(SqlSession sqlSession, Goods goods) {
	    sqlSession.insert("adminMapper.insertGoods", goods);
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



	public void deleteImg(SqlSession sqlSession, int showNo) {
		sqlSession.delete("adminMapper.deleteImg", showNo);
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
}
