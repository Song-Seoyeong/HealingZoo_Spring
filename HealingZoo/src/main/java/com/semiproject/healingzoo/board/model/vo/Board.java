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
	private int boardWriterNo;
	private String boardWriterName;
	private String boardTitle;
	private String boardContent;
	private String boardActive;
	private int boardCount;
	private Date boardCreateDate;
	private Date boardModifyDate;
	private String writerPhone;
	private int boPwd;
	private String noSubject;
}
