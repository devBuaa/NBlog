/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.amc.web.action;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.amc.cfg.Constant;
import com.amc.domain.AmcPodetail;
import com.amc.domain.AmcPurchaseorder;
import com.amc.domain.AmcReplenishdetail;
import com.amc.domain.AmcReplenishsheet;
import com.amc.domain.AmcShortstock;
import com.amc.domain.AmcSupplier;
import com.amc.service.ProductService;
import com.amc.service.PurchaseOrderService;
import com.amc.service.ReplenishService;
import com.amc.service.SupplierService;
import com.amc.service.UserService;
import com.amc.service.WantSlipService;
import com.amc.util.DateUtils;
import com.amc.util.StringUtils;

/** 
 * MyEclipse Struts
 * Creation date: 12-20-2015
 * 
 * XDoclet definition:
 * @struts.action parameter="method"
 */
public class PurchaseAction extends DispatchAction {
	/*
	 * Generated Methods
	 */

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	private PurchaseOrderService purchaseOrderService;
	private ProductService productService;
	private WantSlipService wantSlipService;
	private SupplierService supplierService;
	private UserService userService;
	private ReplenishService replenishService;
	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String pageNowString = (String) request.getParameter("pageNow");
		List<AmcPurchaseorder> orders = null;
		int pageNow, pageCount;
		if (StringUtils.isEmpty(pageNowString)) {
			int count = purchaseOrderService.getPurchaseCounts();
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
		orders = purchaseOrderService.getPurchaseordersByPage(pageNow,
				Constant.pageSize);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNow", pageNow);
		request.setAttribute("polist", orders);
		return mapping.findForward("list");
	}
	public ActionForward addForward(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<AmcSupplier> suppliers=supplierService.getSuppliers();
		List<AmcShortstock> shortstocks=purchaseOrderService.getAllShortstocks();
		request.setAttribute("suppliers", suppliers);
		request.setAttribute("pods", shortstocks);
		return mapping.findForward("addForward");
	}
	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException {
		// TODO Auto-generated method stub
		Map<String, String[]> map=request.getParameterMap();
		AmcPurchaseorder order=new AmcPurchaseorder();
		order.setAmcUser(userService.loadByName(map.get("uname")[0]));
		order.setPoctime(DateUtils.parseDateFromString(map.get("ctime")[0]));
		order.setAmcSupplier(supplierService.findSupplierById(Integer.parseInt(map.get("sid")[0])));
		order.setPoamount(Float.parseFloat(map.get("totalMoney")[0]));
		order.setPostate(2);//采购订单未处理状态
		String pod=map.get("pod")[0];
		String[] pods= pod.split("&\\^&");
		List<AmcPodetail> podetails=new ArrayList<AmcPodetail>();
		for(int i=0;i<pods.length;i++){
			String[] sod=pods[i].split("&");
			AmcPodetail podetail=new AmcPodetail();
			podetail.setAmcProduct(productService.loadProductById(Integer.parseInt(sod[0])));
			podetail.setPodorderamount(Integer.parseInt(sod[1]));
			podetail.setPodamount(Integer.parseInt(sod[2]));
			podetail.setPodsafeamount(Integer.parseInt(sod[2])-Integer.parseInt(sod[1]));
			podetail.setAmcPurchaseorder(order);
			podetails.add(podetail);
		}
		if(purchaseOrderService.checkIsExisted(order)==null){
			purchaseOrderService.addPurchaseOrder(order, podetails);
			response.getWriter().write("1");
			//删除所有需要采购的产品
			purchaseOrderService.update("delete from AmcShortstock where 1=1", null);
			return null;
		}
		//否则 返回已存在
		response.getWriter().write("-1");
		return null;
	    
		
		
	}
	public ActionForward showDetail(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException {
		// TODO Auto-generated method stub
		String poid=request.getParameter("poid");
		AmcPurchaseorder purchaseorder=purchaseOrderService.findPurchaseorderById(Integer.parseInt(poid));
		List<AmcPodetail> podetails = purchaseOrderService.getPodetails(purchaseorder);
		request.setAttribute("po", purchaseorder);
		request.setAttribute("pod", podetails);
		return mapping.findForward("showDetail");
	}
	public ActionForward updateState(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws ParseException, IOException {
		// TODO Auto-generated method stub
		String poid=request.getParameter("poid");
		AmcPurchaseorder purchaseorder=purchaseOrderService.findPurchaseorderById(Integer.parseInt(poid));
		purchaseorder.setPostate(1);
		purchaseOrderService.update(purchaseorder);
		response.getWriter().write("1");
		//修改为发货中 则自动生成到货通知单  为了方便展示
		AmcReplenishsheet replenishsheet=new AmcReplenishsheet();
		replenishsheet.setAmcPurchaseorder(purchaseorder);
		replenishsheet.setAmcUser(purchaseorder.getAmcUser());//初次生成到货通知单，在到货通知单确认后需要修改人员
		replenishsheet.setRarrivaltime(new Date());//默认为生成日期，确定后修改为最新日期
		replenishsheet.setRstate(1);//1为未处理，0为已处理
		List<AmcPodetail> podetails = purchaseOrderService.getPodetails(purchaseorder);
		List<AmcReplenishdetail> replenishdetails=new ArrayList<AmcReplenishdetail>();
		for(AmcPodetail podetail:podetails){
			AmcReplenishdetail replenishdetail=new AmcReplenishdetail();
			replenishdetail.setAmcReplenishsheet(replenishsheet);
			replenishdetail.setAmcProduct(podetail.getAmcProduct());
			replenishdetail.setRdamount(podetail.getPodamount());
			replenishdetails.add(replenishdetail);
		}
		replenishService.addReplenish(replenishsheet, replenishdetails);
		return null;
	}
	
	public PurchaseOrderService getPurchaseOrderService() {
		return purchaseOrderService;
	}
	public void setPurchaseOrderService(PurchaseOrderService purchaseOrderService) {
		this.purchaseOrderService = purchaseOrderService;
	}
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public WantSlipService getWantSlipService() {
		return wantSlipService;
	}
	public void setWantSlipService(WantSlipService wantSlipService) {
		this.wantSlipService = wantSlipService;
	}
	public SupplierService getSupplierService() {
		return supplierService;
	}
	public void setSupplierService(SupplierService supplierService) {
		this.supplierService = supplierService;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public ReplenishService getReplenishService() {
		return replenishService;
	}
	public void setReplenishService(ReplenishService replenishService) {
		this.replenishService = replenishService;
	}
	
	
	
	
}