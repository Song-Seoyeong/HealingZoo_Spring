package com.semiproject.healingzoo.board.model.vo;

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
public class Reply {
	private int reNo;
	private int boardNo;
	private int memNo;
	private String memName;
	private String reContent;
	private String createDate;
	private String modifyDate;
	private String reActive;
	private String boardTitle; // 추가
	private String memGrade; // 추가
	private String boardContent;//추가
}
