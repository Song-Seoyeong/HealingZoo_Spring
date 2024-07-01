package com.semiproject.healingzoo.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Link {
	private int linkNo;
	private String linkUrl;
	private String linkInfo;
	private String linkRefType;
}
