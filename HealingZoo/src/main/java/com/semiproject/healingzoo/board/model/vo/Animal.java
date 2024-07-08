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
	
	
}
