package com.likg.cms.service;

import com.likg.cms.domain.UpDown;
import com.likg.core.service.BaseGenericService;

public interface UpDownService extends BaseGenericService<UpDown> {

	/**
	 * 保存顶踩对象
	 * @param objId 对象id，即稿件id
	 * @param status 状态
	 * @throws Exception
	 */
	UpDown saveUpDown(String objId, String status) throws Exception;
	

	
}
