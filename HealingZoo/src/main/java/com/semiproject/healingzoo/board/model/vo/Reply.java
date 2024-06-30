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
	private String reContent;
	private String createDate;
	private String modifyDate;
}
