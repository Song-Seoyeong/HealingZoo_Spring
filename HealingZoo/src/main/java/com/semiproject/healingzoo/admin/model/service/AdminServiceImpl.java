package com.semiproject.healingzoo.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semiproject.healingzoo.admin.model.dao.AdminDAO;
import com.semiproject.healingzoo.admin.model.vo.Show;
import com.semiproject.healingzoo.board.model.vo.Animal;
import com.semiproject.healingzoo.board.model.vo.Goods;
import com.semiproject.healingzoo.board.model.vo.Image;
import com.semiproject.healingzoo.board.model.vo.Link;
import com.semiproject.healingzoo.board.model.vo.PageInfo;

@Service("aService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private AdminDAO aDAO;
	
	
	@Override
	public ArrayList<Animal> selectFamilyList(PageInfo pi) { // +수정+
		return aDAO.selectFamilyList(sqlSession,pi);
	}

	
	@Override public int getAnimalCount() { // +수정+ 
		return aDAO.getAnimalCount(sqlSession); 
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

	@Override
	public void insertGoods(Goods goods) {
		aDAO.insertGoods(sqlSession,goods);
	}
	
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
	}


	@Override
	public ArrayList<Show> getShowList(PageInfo pi) {
		return aDAO.getShowList(sqlSession, pi);
	}


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
	public void deleteImg(int showNo) {
		aDAO.deleteImg(sqlSession, showNo);
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
}
