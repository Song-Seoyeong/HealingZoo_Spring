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
public class Image {
	private int imgNo;
	private String imgPath;
	private String imgName;
	private String imgRename;
	private int imgRefNum;
	private String imgRefType;
	private String imgActive;
	private int imgRefHover;
}
