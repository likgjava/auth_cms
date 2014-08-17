package com.likg.cms.service.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.likg.cms.dao.CommentDao;
import com.likg.cms.domain.Comment;
import com.likg.cms.service.CommentService;
import com.likg.core.service.impl.BaseGenericServiceImpl;

@Service
public class CommentServiceImpl extends BaseGenericServiceImpl<Comment> implements CommentService {
	
	@Resource(name="commentDaoHibernate")
	private CommentDao commentDaoHibernate;

	
	/**
	 * 保存稿件信息
	 * @param comment 稿件对象
	 * @throws Exception
	 */
	public void saveComment(Comment comment) throws Exception {
		//新增
		if(StringUtils.isBlank(comment.getObjId())) {
			commentDaoHibernate.save(comment);
		}
		//修改
		else {
			Comment oldComment = commentDaoHibernate.get(comment.getObjId());
			commentDaoHibernate.save(oldComment);
		}
	}

	
	

}
