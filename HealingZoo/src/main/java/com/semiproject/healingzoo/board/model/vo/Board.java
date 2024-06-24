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
public class Board {
	private int boardNo;
	private int cateNo;
	private int writerNo;
	private String writerName;
	private String title;
	private String content;
	private String active;
	private int count;
	private Date createDate;
	private Date modifyDate;
}
