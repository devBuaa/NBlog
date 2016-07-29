package com.nblog.service.impl;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.nblog.dao.BaseMapper;
import com.nblog.service.BaseService;
import com.nblog.util.LoggerManager;
import com.nblog.util.SqlUtil;
@Service("baseService")
public class BaseServiceImpl implements BaseService {
	
	@Inject
	private BaseMapper baseMapper;

	@Override
	public void insertBean(Object object) throws Exception{
		// TODO Auto-generated method stub
		Map<String, Object> insertMap = SqlUtil.buildInsertMap(object);
		int result = baseMapper.insertByMap(insertMap);
		if(result!=1){
			String errorMessage = object.getClass().getSimpleName() + "插入失败 -->" +insertMap;
			LoggerManager.getLogger(this.getClass()).error(errorMessage);
			throw new Exception(errorMessage);						
		}
	}

}
