package com.nblog.shiro;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.config.Ini;
import org.springframework.beans.factory.FactoryBean;

import com.nblog.bean.Resources;
import com.nblog.dao.ResourcesDao;
import com.nblog.util.ConfigUtils;
import com.nblog.util.LoggerManager;
import com.nblog.util.SqlUtil;

/**
 * 产生责任链，确定每个url的访问权限
 * 
 */
public class ChainDefinitionSectionMetaSource implements FactoryBean<Ini.Section> {

	@Inject
	private ResourcesDao resourcesDao;

	// 静态资源访问权限
	private String filterChainDefinitions = null;

	@SuppressWarnings("rawtypes")
	public Ini.Section getObject() throws Exception {
		new ConfigUtils().initTableField(resourcesDao); 
		Ini ini = new Ini();
		// 加载默认的url
		ini.load(filterChainDefinitions);
		Ini.Section section = ini.getSection(Ini.DEFAULT_SECTION_NAME);
		// 循环Resource的url,逐个添加到section中。section就是filterChainDefinitionMap,
		// 里面的键就是链接URL,值就是存在什么条件才能访问该链接
		
		List<Resources> lists = resourcesDao.findByAll(SqlUtil.getTableNameMap(Resources.class));
		for (HashMap resources : lists) {
			// 构成permission字符串
			if (StringUtils.isNotEmpty(resources.get("Url") + "") && StringUtils.isNotEmpty(resources.get("ResKey") + "")) {
				String permission = "perms[" + resources.get("ResKey") + "]";
				// 不对角色进行权限验证
				// 如需要则 permission = "roles[" + resources.getResKey() + "]";
				section.put(resources.get("Url") + "", permission);
				LoggerManager.getLogger(this.getClass()).info("找到角色权限关系：[ Url："+resources.get("Url") + "] => [ permission："+permission+"]");
			}

		}
		// 所有资源的访问权限，必须放在最后
		/*section.put("/**", "authc");*/
		/** 如果需要一个用户只能登录一处地方,,修改为 section.put("/**", "authc,kickout,sysUser,user"); **/
		section.put("/**", "authc");
		return section;
	}

	/**
	 * 通过filterChainDefinitions对默认的url过滤定义
	 * 
	 * @param filterChainDefinitions
	 *            默认的url过滤定义
	 */
	public void setFilterChainDefinitions(String filterChainDefinitions) {
		this.filterChainDefinitions = filterChainDefinitions;
	}

	public Class<?> getObjectType() {
		return this.getClass();
	}

	public boolean isSingleton() {
		return false;
	}
}
