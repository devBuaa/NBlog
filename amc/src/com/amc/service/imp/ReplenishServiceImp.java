package com.amc.service.imp;

import java.io.Serializable;
import java.util.List;

import com.amc.domain.AmcReplenishdetail;
import com.amc.domain.AmcReplenishsheet;
import com.amc.service.ReplenishService;

public class ReplenishServiceImp extends BaseServiceImp implements
		ReplenishService {

	@SuppressWarnings("unchecked")
	public List<AmcReplenishsheet> getReplenishs() {
		// TODO Auto-generated method stub
		return find("from AmcReplenishsheet", null);
	}

	public int getReplenishCounts() {
		// TODO Auto-generated method stub
		return getCount("from AmcReplenishsheet", null);
	}

	@SuppressWarnings("unchecked")
	public List<AmcReplenishsheet> getReplenishsByPage(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return findByPage("from AmcReplenishsheet", null, pageNow, pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<AmcReplenishdetail> getRdetails(AmcReplenishsheet replenishsheet) {
		// TODO Auto-generated method stub
		return find("from AmcReplenishdetail where amcReplenishsheet=?", new Object[]{replenishsheet});
	}

	public AmcReplenishsheet findReplenishById(Serializable id) {
		// TODO Auto-generated method stub
		return (AmcReplenishsheet) findById(AmcReplenishsheet.class, id);
	}
	//未写方法
	public AmcReplenishsheet checkIsExisted(AmcReplenishsheet sheet) {
		// TODO Auto-generated method stub
		return null;
	}

	public void addReplenish(AmcReplenishsheet sheet,
			List<AmcReplenishdetail> replenishdetails) {
		// TODO Auto-generated method stub
		save(sheet);
		for(AmcReplenishdetail replenishdetail:replenishdetails){
			save(replenishdetail);
		}
		
	}

	@SuppressWarnings("unchecked")
	public List<AmcReplenishsheet> getUndoneReplenishs() {
		// TODO Auto-generated method stub
		return find("from AmcReplenishsheet where rstate=1", null);
	}

}
