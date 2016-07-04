package com.amc.service;

import java.io.Serializable;
import java.util.List;

import com.amc.domain.AmcReplenishdetail;
import com.amc.domain.AmcReplenishsheet;

public interface ReplenishService extends BaseService {
	List<AmcReplenishsheet> getReplenishs();
	int getReplenishCounts();
	List<AmcReplenishsheet> getReplenishsByPage(int pageNow,int pageSize);
	List<AmcReplenishdetail> getRdetails(AmcReplenishsheet replenishsheet);
	AmcReplenishsheet findReplenishById(Serializable id);
	AmcReplenishsheet checkIsExisted(AmcReplenishsheet sheet);
	void addReplenish(AmcReplenishsheet sheet,List<AmcReplenishdetail> replenishdetails);
	List<AmcReplenishsheet> getUndoneReplenishs();//未确认的到货通知单订单
}
