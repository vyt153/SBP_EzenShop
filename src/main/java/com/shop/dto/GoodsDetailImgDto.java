package com.shop.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class GoodsDetailImgDto {

	private String goodsCode;
	private String imgName;
	private String oriFilename;
	private int filesize;
	private Timestamp regTM;
	
}
