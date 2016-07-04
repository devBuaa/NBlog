package com.amc.service.imp;

import java.io.Serializable;
import java.util.List;

import com.amc.domain.AmcPodetail;
import com.amc.domain.AmcProduct;
import com.amc.domain.AmcPurchaseorder;
import com.amc.domain.AmcShortstock;
import com.amc.domain.AmcUser;
import com.amc.domain.AmcWantslip;
import com.amc.service.PurchaseOrderService;

public class PurchaseOrderServiceImp extends BaseServiceImp implements
		PurchaseOrderService {

	@SuppressWarnings("unchecked")
	public List<AmcPurchaseorder> getPurchaseorders() {
		// TODO Auto-generated method stub
		return find("from AmcPurchaseorder", null);
	}

	public int getPurchaseCounts() {
		// TODO Auto-generated method stub
		return getCount("from AmcPurchaseorder", null);
	}

	@SuppressWarnings("unchecked")
	public List<AmcPurchaseorder> getPurchaseordersByPage(int pageNow,
			int pageSize) {
		// TODO Auto-generated method stub
		return findByPage("from AmcPurchaseorder", null, pageNow, pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<AmcPodetail> getPodetails(AmcPurchaseorder purchaseorder) {
		// TODO Auto-generated method stub
		return find("from AmcPodetail where podpoid=?", new Object[]{purchaseorder.getPoid()});
	}

	public AmcPurchaseorder findPurchaseorderById(Serializable id) {
		// TODO Auto-generated method stub
		return (AmcPurchaseorder) findById(AmcPurchaseorder.class, id);
	}

	@SuppressWarnings("unchecked")
	public AmcPurchaseorder checkIsExisted(AmcPurchaseorder order) {
		// TODO Auto-generated method stub
		List<AmcPurchaseorder> list = find("from AmcPurchaseorder where amcSupplier=? and poctime=? and poamount=?",
				new Object[] { order.getAmcSupplier(),order.getPoctime(),order.getPoamount()});
		if (list.size() == 1) {
			return list.get(0);
		} else {
			return null;
		}
	}

	public void addPurchaseOrder(AmcPurchaseorder order,
			List<AmcPodetail> podetails) {
		// TODO Auto-generated method stub
		save(order);
		for(AmcPodetail dPodetail:podetails){
			save(dPodetail);
		}
		//修改未处理的遍历过添加到订货表里的缺货单状态3->1
		@SuppressWarnings("unchecked")
		List<AmcWantslip> wantslips=find("from AmcWantslip where wsstate=3", null);
		if(wantslips!=null){
			for(AmcWantslip wantslip:wantslips){
				wantslip.setWsstate(1);
				update(wantslip);
			}
		}
	}

	@SuppressWarnings("unchecked")
	public List<AmcPurchaseorder> getUndonePurchaseorders() {
		// TODO Auto-generated method stub
		return find("from AmcPurchaseorder where postate>0", null);
	}

	public int purchasingProductAmount(AmcProduct product) {
		// TODO Auto-generated method stub
		int n = 0;
		@SuppressWarnings("unchecked")
		List<Integer> amounts = find(
				"select pod.podamount from AmcPurchaseorder po,AmcPodetail pod where po.postate>0 and pod.amcPurchaseorder.poid=po.poid and pod.amcProduct=?",
				new Object[] { product });
		if (amounts != null) {
			for (Integer i : amounts) {
				n += i;
			}
		}
		return n;
	}

	@SuppressWarnings("unchecked")
	public List<AmcShortstock> getAllShortstocks() {
		// TODO Auto-generated method stub
		return find("from AmcShortstock", null);
	}

}
