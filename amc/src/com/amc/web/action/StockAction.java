/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.amc.web.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.amc.cfg.Constant;
import com.amc.domain.AmcSodetail;
import com.amc.domain.AmcStockorder;
import com.amc.domain.AmcUser;
import com.amc.domain.AmcWantslip;
import com.amc.service.DispatchService;
import com.amc.service.SalesOrderService;
import com.amc.service.StockService;
import com.amc.service.WantSlipService;
import com.amc.util.StringUtils;

/**
 * MyEclipse Struts Creation date: 12-14-2015
 * 
 * XDoclet definition:
 * 
 * @struts.action parameter="method" validate="true"
 */
public class StockAction extends DispatchAction {

	private StockService stockService;
	private SalesOrderService salesOrderService;
	private WantSlipService wantSlipService;
	private DispatchService dispatchService;

	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String pageNowString = (String) request.getParameter("pageNow");
		List<AmcStockorder> stocks = null;
		int pageNow, pageCount;
		if (StringUtils.isEmpty(pageNowString)) {
			int count = stockService.getStockorderCount();
			if (count % Constant.pageSize == 0) {
				pageCount = (int) Math.floor(count / Constant.pageSize);
			} else {
				pageCount = (int) Math.floor(count / Constant.pageSize) + 1;
			}
			pageNow = 1;

		} else {
			pageCount = Integer.parseInt(request.getParameter("pageCount"));
			pageNow = Integer.parseInt(pageNowString);
		}
		stocks = stockService.getStockordersByPage(pageNow, Constant.pageSize);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNow", pageNow);
		request.setAttribute("stockList", stocks);
		return mapping.findForward("list");
	}

	public ActionForward showDetail(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String stoid = request.getParameter("stoid");
		AmcStockorder stockorder = stockService.findStockorderById(Integer
				.parseInt(stoid));
		List<AmcSodetail> salesOrderDetail = salesOrderService
				.getSalesOrderDetail(stockorder.getAmcSalesorder().getSoid());
		request.setAttribute("sto", stockorder);
		request.setAttribute("sod", salesOrderDetail);
		boolean isShort = false;
		if (stockorder.getStostate() == 1) {
			for (AmcSodetail sodetail : salesOrderDetail) {
				if (sodetail.getAmcProduct().getPinventoryamount() < sodetail
						.getSodamount()) {
					isShort = true;
					break;
				}
			}
		}
		boolean hasWantSlip = false;
		// 检查是否提交过了缺货单
		AmcWantslip wantslip = wantSlipService.checkIsExisted(stockorder
				.getAmcSalesorder().getSoid());
		if (wantslip != null) {
			hasWantSlip = true;
		}
		request.setAttribute("hasWantSlip", hasWantSlip);
		request.setAttribute("isShort", isShort);
		return mapping.findForward("showDetail");
	}

	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		

		String soid = request.getParameter("soid");
		
		// 检查是否存在备货单
		AmcStockorder stockorder=stockService.findStockorderBySoId(Integer.parseInt(soid));
		if (stockorder != null) {
			if(stockorder.getStostate()<2){//如果已经被处理过了
				request.setAttribute("tag", "showSalesOrderDetail");
				return mapping.findForward("add_error");
			}else {//未被处理
				stockorder.setStostate(1);
				stockService.updateStock(stockorder);
			}
		}else {//如果当时没有被插入 则创建一个新的stockorder
			stockorder = new AmcStockorder();
			stockorder.setStoctime(new Date());
			stockorder.setStostate(1);
			AmcUser user = (AmcUser) request.getSession().getAttribute("user");
			stockorder.setAmcUser(user);
			stockorder.setAmcSalesorder(salesOrderService
					.findSalesOrderById(Integer.parseInt(soid)));
			stockService.addStock(stockorder);
		}	
		return mapping.findForward("ok");
	}

	public StockService getStockService() {
		return stockService;
	}

	public void setStockService(StockService stockService) {
		this.stockService = stockService;
	}

	public DispatchService getDispatchService() {
		return dispatchService;
	}

	public void setDispatchService(DispatchService dispatchService) {
		this.dispatchService = dispatchService;
	}

	public SalesOrderService getSalesOrderService() {
		return salesOrderService;
	}

	public void setSalesOrderService(SalesOrderService salesOrderService) {
		this.salesOrderService = salesOrderService;
	}

	public WantSlipService getWantSlipService() {
		return wantSlipService;
	}

	public void setWantSlipService(WantSlipService wantSlipService) {
		this.wantSlipService = wantSlipService;
	}

}