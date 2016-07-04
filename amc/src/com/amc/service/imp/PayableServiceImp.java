package com.amc.service.imp;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.amc.domain.AmcPayable;
import com.amc.domain.AmcPayabledetail;
import com.amc.domain.AmcPurchaseaccount;
import com.amc.domain.AmcReceivable;
import com.amc.service.PayableService;
import com.amc.util.DateUtils;

public class PayableServiceImp extends BaseServiceImp implements PayableService {

	public List<AmcPayable> getPayables() {
		// TODO Auto-generated method stub
		return find("from AmcPayable", null);
	}

	public List<AmcPayable> getPayablesByPage(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return findByPage("from AmcPayable", null, pageNow, pageSize);
	}

	public List<AmcPayable> getPayablesUndoByPage(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return findByPage("from AmcPayable where paystate=1", null, pageNow, pageSize);
	}

	public int getPayableCount() {
		// TODO Auto-generated method stub
		return getCount("from AmcPayable", null);
	}

	public int getPayableUndoCount() {
		// TODO Auto-generated method stub
		return getCount("from AmcPayable where paystate=1", null);
	}

	public AmcPayable findPayableById(Serializable rid) {
		// TODO Auto-generated method stub
		return (AmcPayable) findById(AmcPayable.class, rid);
	}

	public void addPayable(AmcPayable payable,
			List<AmcPayabledetail> payabledetails) {
		// TODO Auto-generated method stub
		save(payable);
		for(AmcPayabledetail payabledetail:payabledetails){
			save(payabledetail);
		}
	}

	public void transPayableToAccount(AmcPayable payable) {
		// TODO Auto-generated method stub
		AmcPurchaseaccount purchaseaccount=new AmcPurchaseaccount();
		purchaseaccount.setAmcPayable(payable);
		purchaseaccount.setPatotalaccount(payable.getPaytotalaccount());
		purchaseaccount.setPactime(new Date());
		save(purchaseaccount);
	}

	@SuppressWarnings("unchecked")
	public List<AmcPayabledetail> getPayabledetails(AmcPayable payable) {
		// TODO Auto-generated method stub
		return find("from AmcPayabledetail where amcPayable=?", new Object[]{payable});
	}

	public AmcPurchaseaccount getPurchaseaccountByAccountId(
			Serializable accountId) {
		// TODO Auto-generated method stub
		return (AmcPurchaseaccount) findById(AmcPurchaseaccount.class, accountId);
	}

	public List<AmcPayabledetail> getPayabledetailsByAccount(
			AmcPurchaseaccount account) {
		// TODO Auto-generated method stub
		return getPayabledetails(account.getAmcPayable());
	}

	public int getAccountCount() {
		// TODO Auto-generated method stub
		return getCount("from AmcPurchaseaccount", null);
	}

	public List<AmcPurchaseaccount> getAccountByPage(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return findByPage("from AmcPurchaseaccount", null, pageNow, pageSize);
	}
	
	public List<AmcPayable> getWeekAmcPayables(Date date) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<AmcPayable> list=find("from AmcPayable where payctime between ? and ? order by payctime",new Object[]{
				DateUtils.getDateByOffset(date, -7),date
		});
		return list;
	}

	public List<AmcPayable> getPeriodAmcPayables(Date cdate, Date edate) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<AmcPayable> list=find("from AmcPayable where payctime between ? and ? order by payctime",new Object[]{
				cdate,edate
		});
		return list;
	}

}
