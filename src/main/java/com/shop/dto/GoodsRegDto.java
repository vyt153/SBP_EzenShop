package com.shop.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class GoodsRegDto {

	private int num;
	private String goodsCode;
	private String goodsName;
	private int goodsPrice;
	private String goodsCategory;
	private String goodsStatus;
	private int goodsDiscount;

	private String goodsTXT;
	private int goodsOrder;
	private String filename;
	private String oriFilename;
	private int filesize;
	private Timestamp regTM;

}
