package com.semiproject.healingzoo.member.model.vo;

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
public class Member {
	private int memNo;
	private String memId;
	private String memPwd;
	private String memName;
	private String memEmail;
	private int memPhone;
	private Date enrollDate;
	private Date updateDate;
	private String memActive;
	private String memGrade;
	private String memIntro;
}
