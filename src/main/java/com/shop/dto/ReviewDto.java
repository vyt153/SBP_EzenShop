package com.shop.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class ReviewDto {

	private int num;
	private String goodsCode;
	private String goodsName;
	private int reStar;
	private String uname;
	private String weight;
	private String height;
	private String goodsSize;
	private String goodsColor;
	private String reContent;
	private int ref;
	private Timestamp regTM;
}
