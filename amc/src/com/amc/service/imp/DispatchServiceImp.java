package com.amc.service.imp;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import com.amc.domain.AmcDispatchorder;
import com.amc.domain.AmcDodetail;
import com.amc.domain.AmcProduct;
import com.amc.domain.AmcSalesorder;
import com.amc.domain.AmcSodetail;
import com.amc.domain.AmcStockorder;
import com.amc.domain.AmcWantslip;
import com.amc.service.DispatchService;
import com.sun.jndi.url.ldaps.ldapsURLContextFactory;

public class DispatchServiceImp extends BaseServiceImp implements
		DispatchService {

	public List getDispatchOrdersList() {
		// TODO Auto-generated method stub
		return find("from AmcDispatchorder", null);
	}

	public List getDispatchOrdersByPage(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return findByPage("from AmcDispatchorder", null, pageNow, pageSize);
	}

	public int getDispatchOrderCount() {
		// TODO Auto-generated method stub
		return getCount("from AmcDispatchorder", null);
	}

	@SuppressWarnings("unchecked")
	public List<AmcDodetail> getDodetails(Serializable salesOrderId) {
		// TODO Auto-generated method stub
		return find("from AmcDodetail where dsddsid=?", new Object[] { salesOrderId });
	}

	public AmcDispatchorder findDipatchOrderById(Serializable did) {
		// TODO Auto-generated method stub
		return (AmcDispatchorder) findById(AmcDispatchorder.class, did);
	}
	public Object checkIsExisted(Serializable soid) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<AmcDispatchorder> list = find(
				"from AmcDispatchorder where dsoid=? ",
				new Object[] { soid });
		if (list.size() == 1) {
			return list.get(0);
		} else {
			return null;
		}
	}

	public void addDispatch(AmcDispatchorder dispatchorder,
			List<AmcDodetail> dList) {
		// TODO Auto-generated method stub
		
		save(dispatchorder);
		for(AmcDodetail dodetail:dList){
			save(dodetail);
			//减少库存
			AmcProduct product=dodetail.getAmcProduct();
			int amount=product.getPinventoryamount()-dodetail.getDsdamount();
			product.setPinventoryamount(amount);
			if(amount<product.getPsafeamount()){
				product.setPinventorystate(0);
			}
			update(product);
		}
		//修改订单状态为已处理
		AmcSalesorder salesorder = dispatchorder.getAmcSalesorder();
		salesorder.setSostate("0");
		update(salesorder);
		//修改备货单状态为已处理
		AmcStockorder stockorder=(AmcStockorder) find("from AmcStockorder where stosoid=?", new Object[]{dispatchorder.getAmcSalesorder().getSoid()}).get(0);
		stockorder.setStostate(0);
		update(stockorder);

	}


}
