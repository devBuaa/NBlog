package com.amc.service.imp;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.amc.domain.AmcReceivable;
import com.amc.domain.AmcReceivabledetail;
import com.amc.domain.AmcSaleaccount;
import com.amc.domain.AmcSalesorder;
import com.amc.service.ReceivableService;
import com.amc.util.DateUtils;

public class ReceivableServiceImp extends BaseServiceImp implements
		ReceivableService {

	@SuppressWarnings("unchecked")
	public List<AmcReceivable> getAReceivables() {
		// TODO Auto-generated method stub
		return find("from AmcReceivable", null);
	}

	@SuppressWarnings("unchecked")
	public List<AmcReceivable> getReceivablesByPage(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return findByPage("from AmcReceivable", null,pageNow,pageSize);
	}

	public int getReceivableCount() {
		// TODO Auto-generated method stub
		return getCount("from AmcReceivable", null);
	}

	public AmcReceivable findReceivableById(Serializable rid) {
		// TODO Auto-generated method stub
		return (AmcReceivable) findById(AmcReceivable.class, rid);
	}

	public void addReceivable(AmcReceivable receivable,
			List<AmcReceivabledetail> receivabledetails) {
		// TODO Auto-generated method stub
		save(receivable);
		for(AmcReceivabledetail receivabledetail:receivabledetails){
			save(receivabledetail);
		}
	}

	public void transReceivableToAccount(AmcReceivable receivable) {
		// TODO Auto-generated method stub
		AmcSaleaccount saleaccount=new AmcSaleaccount();
		saleaccount.setAmcReceivable(receivable);
		saleaccount.setSatotalaccount(receivable.getRctaccount());
		saleaccount.setSactime(new Date());
		save(saleaccount);
	}

	@SuppressWarnings("unchecked")
	public List<AmcReceivable> getReceivablesUndoByPage(int pageNow,
			int pageSize) {
		// TODO Auto-generated method stub
		return findByPage("from AmcReceivable where rcstate>0", null,pageNow,pageSize);
	}

	public int getReceivableUndoCount() {
		// TODO Auto-generated method stub
		return getCount("from AmcReceivable where rcstate>0",null);
	}

	@SuppressWarnings("unchecked")
	public List<AmcReceivabledetail> getReceivabledetails(
			AmcReceivable receivable) {
		// TODO Auto-generated method stub
		return find("from AmcReceivabledetail where rcdrcid=?", new Object[]{receivable.getRcid()});
	}

	public List<AmcSaleaccount> getReceivablesdoneByPage(int pageNow,
			int pageSize) {
		// TODO Auto-generated method stub
		return findByPage("from AmcSaleaccount", null,pageNow,pageSize);
	}


	public AmcSaleaccount getSaleaccountByAccountId(Serializable accountId) {
		// TODO Auto-generated method stub
		return (AmcSaleaccount) findById(AmcSaleaccount.class, accountId);
	}

	public List<AmcReceivabledetail> getReceivabledetailsByAccount(
			AmcSaleaccount saleaccount) {
		// TODO Auto-generated method stub
		return getReceivabledetails(saleaccount.getAmcReceivable());
	}

	public int getAccountCount() {
		// TODO Auto-generated method stub
		return getCount("from AmcSaleaccount",null);
	}
	public List<AmcReceivable> getWeekAmcReceivables(Date date) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<AmcReceivable> list=find("from AmcReceivable where rcctime between ? and ? order by rcctime",
				new Object[]{
				DateUtils.getDateByOffset(date, -7),date
		});
		return list;
	}

	public List<AmcReceivable> getPeriodAmcReceivables(Date cDate, Date eDate) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<AmcReceivable> list=find("from AmcReceivable where rcctime between ? and ? order by rcctime",
				new Object[]{
				cDate,eDate
		});
		return list;
	}
}
