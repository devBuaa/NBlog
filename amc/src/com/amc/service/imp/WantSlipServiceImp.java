package com.amc.service.imp;

import java.io.Serializable;
import java.util.List;

import com.amc.domain.AmcProduct;
import com.amc.domain.AmcWantslip;
import com.amc.domain.AmcWsdetail;
import com.amc.service.WantSlipService;

public class WantSlipServiceImp extends BaseServiceImp implements
		WantSlipService {

	public List<?> getWantSlips() {
		// TODO Auto-generated method stub
		return find("from AmcWantslip", null);
	}

	public List<?> getWantSlipsByPage(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return findByPage("from AmcWantslip", null, pageNow, pageSize);
	}

	public int getWantSlipCount() {
		// TODO Auto-generated method stub
		return getCount("from AmcWantslip", null);
	}

	public void addWantSlip(AmcWantslip WantSlip, List<AmcWsdetail> wsdetails) {
		// TODO Auto-generated method stub
		save(WantSlip);
		for (AmcWsdetail wsdetail : wsdetails) {
			save(wsdetail);
		}
	}

	@SuppressWarnings("unchecked")
	public List<AmcWsdetail> getWantSlipDetail(Serializable WantSlipId) {
		// TODO Auto-generated method stub
		return find("from AmcWsdetail where wsdwsid=?",
				new Object[] { WantSlipId });
	}

	public AmcWantslip findWantSlipById(Serializable WantSlipId) {
		// TODO Auto-generated method stub
		return (AmcWantslip) findById(AmcWantslip.class, WantSlipId);
	}

	public AmcWantslip checkIsExisted(Serializable soid) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<AmcWantslip> list = find("from AmcWantslip where wssoid=? ",
				new Object[] { soid });
		if (list.size() == 1) {
			return list.get(0);
		} else {
			return null;
		}
	}

	public int getWantProductNumber(AmcProduct product) {
		// TODO Auto-generated method stub
		/*
		 * List<AmcWantslip> wantslips=getUndoWantSlips(); for(AmcWantslip
		 * wantslip:wantslips){ getWantSlipDetail(wantslip.getWsid()); }
		 */
		int n = 0;
		@SuppressWarnings("unchecked")
		List<Integer> amounts = find(
				"select wsd.wsdamount from AmcWantslip ws,AmcWsdetail wsd where ws.wsstate=2 and wsd.amcWantslip.wsid=ws.wsid and wsd.amcProduct=?",
				new Object[] { product });
		if (amounts != null) {
			for (Integer i : amounts) {
				n += i;
			}
		}
		return n;
	}

	@SuppressWarnings("unchecked")
	public List<AmcWantslip> getUndoWantSlips() {
		// TODO Auto-generated method stub
		return find("from AmcWantslip where wsstate=2", null);
	}

	public void finishPurchasingWantState() {
		// TODO Auto-generated method stub
		List<AmcWantslip>  wantslips=find("from AmcWantslip where wsstate=1", null);
		for(AmcWantslip wantslip:wantslips){
			wantslip.setWsstate(0);
			update(wantslip);
		}
	}

}
