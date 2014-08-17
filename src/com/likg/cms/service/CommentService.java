package com.likg.cms.service;

import com.likg.cms.domain.Comment;
import com.likg.core.service.BaseGenericService;

public interface CommentService extends BaseGenericService<Comment> {

	/**
	 * 保存稿件信息
	 * @param comment 稿件对象
	 * @throws Exception
	 */
	void saveComment(Comment comment) throws Exception;
	

	
}
