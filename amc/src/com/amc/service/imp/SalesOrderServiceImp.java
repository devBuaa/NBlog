package com.amc.service.imp;

import java.io.Serializable;
import java.util.List;

import com.amc.domain.AmcDispatchorder;
import com.amc.domain.AmcSalesorder;
import com.amc.domain.AmcSodetail;
import com.amc.domain.AmcStockorder;
import com.amc.service.SalesOrderService;

public class SalesOrderServiceImp extends BaseServiceImp implements
		SalesOrderService {

	public List getSalesOrders() {
		// TODO Auto-generated method stub
		return find("from AmcSalesorder", null);
	}

	public List getSalesOrdersByPage(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return findByPage("from AmcSalesorder", null, pageNow, pageSize);
	}

	public int getSalesOrderCount() {
		// TODO Auto-generated method stub
		return getCount("from AmcSalesorder", null);
	}

	public void addSalesOrder(AmcSalesorder salesorder,
			List<AmcSodetail> sodetailList) {
		// TODO Auto-generated method stub
		AmcStockorder stockorder = new AmcStockorder();
		stockorder.setAmcUser(salesorder.getAmcUser());
		stockorder.setAmcSalesorder(salesorder);
		stockorder.setStoctime(salesorder.getSoctime());
		stockorder.setStostate(2);
		save(salesorder);
		save(stockorder);
		for (AmcSodetail sodetail : sodetailList) {
			save(sodetail);
		}
	}

	public List<AmcSodetail> getSalesOrderDetail(Serializable salesOrderId) {
		// TODO Auto-generated method stub
		return find("from AmcSodetail where sodsoid=?",
				new Object[] { salesOrderId });
	}

	public AmcSalesorder findSalesOrderById(Serializable salesOrderId) {
		// TODO Auto-generated method stub
		return (AmcSalesorder) findById(AmcSalesorder.class, salesOrderId);
	}

	public AmcSalesorder checkIsExisted(AmcSalesorder salesorder) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<AmcSalesorder> list = find(
				"from AmcSalesorder where socid=? and soaddress=? and soctime=? and soReceivePerson=?",
				new Object[] { salesorder.getAmcCustomer().getCid(),
						salesorder.getSoaddress(), salesorder.getSoctime(),
						salesorder.getSoReceivePerson() });
		if (list.size() == 1) {
			return list.get(0);
		} else {
			return null;
		}
	}


}
