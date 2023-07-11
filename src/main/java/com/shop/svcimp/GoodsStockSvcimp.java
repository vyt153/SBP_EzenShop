package com.shop.svcimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.GoodsStockDao;
import com.shop.dto.GoodsCateDto;
import com.shop.dto.GoodsModDto;
import com.shop.dto.GoodsStockColorDto;
import com.shop.dto.GoodsStockDto;
import com.shop.dto.GoodsStockSizeDto;
import com.shop.svc.GoodsStockSvc;

@Service
public class GoodsStockSvcimp implements GoodsStockSvc {

	@Autowired
	GoodsStockDao goodsStockDao; 
	
	@Override
	public int goodsStock(String goodsCode, String goodsName, String goodsCategory, String goodsColor, String goodsSize, int goodsStock) {
		return goodsStockDao.goodsStock(goodsCode, goodsName, goodsCategory, goodsColor, goodsSize, goodsStock);
	}

	@Override
	public List<GoodsStockDto> goodsStockList() {
		return goodsStockDao.goodsStockList();
	}

	@Override
	public List<GoodsStockColorDto> goodsColorList() {
		return goodsStockDao.goodsColorList();
	}

	@Override
	public List<GoodsStockSizeDto> goodsSizeList() {
		return goodsStockDao.goodsSizeList();
	}

	@Override
	public List<GoodsCateDto> goodsCateList() {
		return goodsStockDao.goodsCateList();
	}

	@Override
	public int goodsStockDel(String delCode) {
		return goodsStockDao.goodsStockDel(delCode);
	}

	@Override
	public List<GoodsStockColorDto> goodsModColorList(String goodsCode) {
		return goodsStockDao.goodsModColorList(goodsCode);
	}

	@Override
	public List<GoodsStockSizeDto> goodsModSizeList(String goodsCode) {
		return goodsStockDao.goodsModSizeList(goodsCode);
	}

	@Override
	public List<GoodsCateDto> goodsModCateList(String goodsCode) {
		return goodsStockDao.goodsModCateList(goodsCode);
	}

	@Override
	public List<GoodsModDto> goodsModCnt(String goodsCode) {
		return goodsStockDao.goodsModCnt(goodsCode);
	}

	@Override
	public int goodsStockMod(String goodsCode, String goodsCategory, String goodsName, String goodsSize, String goodsColor, int goodsStock, int num) {
		return goodsStockDao.goodsStockMod(goodsCode, goodsCategory, goodsName, goodsSize, goodsColor, goodsStock, num);
	}

	@Override
	public int goodsModMore(String goodsCode, String goodsName, String goodsSize, String goodsCategory, String goodsColor, int goodsStock) {
		return goodsStockDao.goodsModMore(goodsCode, goodsName, goodsSize, goodsCategory, goodsColor, goodsStock);
	}

	@Override
	public int goodsOriLength(String goodsCode) {
		return goodsStockDao.goodsOriLength(goodsCode);
	}

}
