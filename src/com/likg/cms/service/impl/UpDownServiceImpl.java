package com.likg.cms.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.likg.cms.dao.UpDownDao;
import com.likg.cms.domain.UpDown;
import com.likg.cms.service.UpDownService;
import com.likg.core.service.impl.BaseGenericServiceImpl;

@Service
public class UpDownServiceImpl extends BaseGenericServiceImpl<UpDown> implements UpDownService {
	
	@Resource(name="upDownDaoHibernate")
	private UpDownDao upDownDaoHibernate;

	
	/**
	 * 保存顶踩对象
	 * @param objId 对象id，即稿件id
	 * @param status 状态
	 * @throws Exception
	 */
	public UpDown saveUpDown(String objId, String status) throws Exception {
		//获取对象信息
		UpDown upDown = upDownDaoHibernate.get(objId);
		
		//新增
		if(upDown == null) {
			upDown = new UpDown();
			upDown.setObjId(objId);
			upDown.setUp(0L);
			upDown.setDown(0L);
		}
		
		//顶
		if(UpDown.STATUS_UP.equals(status)) {
			upDown.setUp(upDown.getUp()+1);
		}
		//踩
		else if(UpDown.STATUS_DOWN.equals(status)) {
			upDown.setDown(upDown.getDown()+1);
		}
		
		//保存到数据库
		upDownDaoHibernate.save(upDown);
		
		return upDown;
	}

	
	

}
