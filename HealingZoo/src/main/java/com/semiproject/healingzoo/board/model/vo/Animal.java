package com.semiproject.healingzoo.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Animal {
	
	private int aniNO;
	private String animalClass;
	private String animalFamily;
	private String animalName;
	private Date enterDate;
	private String extinctGrade;
	private Date uploadDate;
	private String imagePath; // 이미지 번호를 이어주기위한 추가코드 0709 갱신
	
}
