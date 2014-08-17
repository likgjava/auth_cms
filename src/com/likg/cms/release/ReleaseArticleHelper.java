package com.likg.cms.release;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import org.apache.log4j.Logger;

import com.likg.common.Constants;

public class ReleaseArticleHelper {
	
	private static Logger log = Logger.getLogger(ReleaseArticleHelper.class);
	private static List<String> articleIdList = new LinkedList<String>();

	/**
	 * 获取待发布的稿件的id
	 * @return
	 */
	public static String getArticleId() {
		String articleId = null;
		if(!articleIdList.isEmpty()) {
			articleId = articleIdList.remove(0);
		}
		return articleId;
	}
	
	/**
	 * 添加稿件id
	 * @param articleId
	 */
	public static void addArticleId(String articleId) {
		ReleaseArticleHelper.articleIdList.add(articleId);
	}
	
	/**
	 * 删除稿件ID文件
	 * @param articleId
	 */
	public static void deleteArticleIdFile(String articleId) {
		File articleFile = new File(Constants.ROOTPATH + "/data/articleids/"+articleId);
		articleFile.delete();
		log.info("成功删除已发布稿件的ID文件->"+articleId);
	}
	
	/**
	 * 创建稿件ID文件
	 * @param articleId
	 */
	public static void createArticleIdFile(String articleId) {
		File articleFile = new File(Constants.ROOTPATH + "/data/articleids/"+articleId);
		try {
			if(!articleFile.exists()) {
				articleFile.createNewFile();
			}
		} catch (IOException e) {
			log.error("创建稿件ID文件时出现错误", e);
		}
		log.info("成功创建稿件ID文件->"+articleId);
	}
	
}
