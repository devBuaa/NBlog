package com.amc.service.imp;

import java.io.Serializable;
import java.util.List;

import com.amc.domain.AmcSalesorder;
import com.amc.domain.AmcStockorder;
import com.amc.service.StockService;

public class StockServiceImp extends BaseServiceImp implements StockService {

	public void addStock(AmcStockorder stockorder) {
		// TODO Auto-generated method stub
		save(stockorder);
		AmcSalesorder salesorder =stockorder.getAmcSalesorder();
		//修改销售订单为正在处理
		salesorder.setSostate("1");
		update(salesorder);
	}
	public void updateStock(AmcStockorder stockorder) {
		// TODO Auto-generated method stub
		update(stockorder);
		AmcSalesorder salesorder =stockorder.getAmcSalesorder();
		//修改销售订单为正在处理
		salesorder.setSostate("1");
		update(salesorder);
	}

	@SuppressWarnings("unchecked")
	public List<AmcStockorder> getStockorders() {
		// TODO Auto-generated method stub
		return find("from AmcStockorder", null);
	}

	@SuppressWarnings("unchecked")
	public List<AmcStockorder> getStockordersByPage(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return findByPage("from AmcStockorder", null, pageNow, pageSize);
	}

	public int getStockorderCount() {
		// TODO Auto-generated method stub
		return getCount("from AmcStockorder", null);
	}

	public AmcStockorder findStockorderById(Serializable stockId) {
		// TODO Auto-generated method stub
		return (AmcStockorder) findById(AmcStockorder.class, stockId);
	}

	public AmcStockorder findStockorderBySoId(Serializable soid) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<AmcStockorder> list = find("from AmcStockorder where stosoid=?",
				new Object[] { soid});
		if (list.size() == 1) {
			return list.get(0);
		} else {
			return null;
		}
	}

}
