package com.shop.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class GoodsModDto {

	private int num;
	private String goodsCode;
	private String goodsName;
	private String goodsCategory;
	private String goodsColor;
	private String goodsSize;
	private int goodsStock;
	private Timestamp regTM;
	
}
