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
public class Goods {
	private int goodsNo;
	private String goodsName;
	private int goodsPrice;
	private String goodsInfo;
	private String imagePath; // 이미지를 맞춰주기 위한 추가 0709 갱신
	private String imageRename;
}
