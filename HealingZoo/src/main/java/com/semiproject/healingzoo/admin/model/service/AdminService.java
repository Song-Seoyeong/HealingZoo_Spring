package com.semiproject.healingzoo.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.semiproject.healingzoo.admin.model.vo.Show;
import com.semiproject.healingzoo.board.model.vo.Animal;
import com.semiproject.healingzoo.board.model.vo.Goods;
import com.semiproject.healingzoo.board.model.vo.Image;
import com.semiproject.healingzoo.board.model.vo.Link;
import com.semiproject.healingzoo.board.model.vo.PageInfo;

public interface AdminService {

	ArrayList<Animal> selectFamilyList(PageInfo pi);//+수정+

	int getAnimalCount();

	ArrayList<Goods> selectMascotList();

	int insertAnimal(Animal animal);

	int deleteAnimals(List<Integer> aniNOs);

	Animal selectAnimal(int aniNO);

	int updateAnimal(Animal animal);

	List<Animal> getAllAnimals();

	Goods selectGoods(int goodsNo);

	void updateGoods(Goods goods);

	void deleteGoods(int goodsNo);

	void insertGoods(Goods goods);
	
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

	void deleteImg(int showNo);

	ArrayList<Image> getImgList(int showNo);

	int updateShow(Show show);

	int updateShowImg(HashMap<String, Object> map);


}
