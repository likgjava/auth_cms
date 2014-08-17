package com.likg.cms.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import com.likg.cms.dao.ArticleDao;
import com.likg.cms.dao.ChannelDao;
import com.likg.cms.dao.TemplateDao;
import com.likg.cms.domain.Article;
import com.likg.cms.domain.Channel;
import com.likg.cms.domain.Comment;
import com.likg.cms.domain.Template;
import com.likg.cms.enumeration.ArticleEnum;
import com.likg.cms.service.ArticleService;
import com.likg.common.Constants;
import com.likg.core.dao.hibernate.query.QueryObject;
import com.likg.core.dao.hibernate.query.QueryObjectBase;
import com.likg.core.dao.hibernate.query.QueryParam;
import com.likg.core.service.impl.BaseGenericServiceImpl;
import com.likg.lucene.LuceneUtil;

import freemarker.template.Configuration;

@Service
public class ArticleServiceImpl extends BaseGenericServiceImpl<Article> implements ArticleService {
	
	@Resource(name="articleDaoHibernate")
	private ArticleDao articleDaoHibernate;
	
	@Resource(name="channelDaoHibernate")
	private ChannelDao channelDaoHibernate;
	
	@Resource(name="templateDaoHibernate")
	private TemplateDao templateDaoHibernate;

	
	/**
	 * 保存稿件信息
	 * @param article 稿件对象
	 * @throws Exception
	 */
	public void saveArticle(Article article) throws Exception {
		//新增
		if(StringUtils.isBlank(article.getObjId())) {
			//如果是已发布状态，则设置发布时间
			if(ArticleEnum.RELEASED.equals(article.getReleaseStatus())) {
				article.setReleaseDate(new Date());
			}
			articleDaoHibernate.save(article);
			
			//创建索引文件
			LuceneUtil.addIndex(article);
		}
		//修改
		else {
			Article oldArticle = articleDaoHibernate.get(article.getObjId());
			oldArticle.setTitle(article.getTitle());
			oldArticle.setAuthor(article.getAuthor());
			oldArticle.setAbstracts(article.getAbstracts());
			oldArticle.setContent(article.getContent());
			oldArticle.setSource(article.getSource());
			oldArticle.setReleaseStatus(article.getReleaseStatus());
			articleDaoHibernate.save(oldArticle);
			
			//更新索引文件
			LuceneUtil.updateIndex(article);
		}
	}

	/**
	 * 生成稿件静态页面
	 * @param objId 稿件id
	 * @throws Exception
	 */
	public void makeStaticPage(String objId) throws Exception {
		Configuration cfg = new Configuration();
		cfg.setDirectoryForTemplateLoading(new File(Constants.ROOTPATH));

		Map<String, Object> root = new HashMap<String, Object>();
		root.put("initPath", Constants.INITPATH);
		
		//获取稿件信息
		Article article = articleDaoHibernate.get(objId);
		root.put("article", article);
		
		//获取稿件的栏目信息
		List<Channel> channelList = channelDaoHibernate.getParentList(article.getChannel().getObjId());
		root.put("channelList", channelList);
		
		//获取稿件模板信息
		Channel channel = channelDaoHibernate.get(article.getChannel().getObjId());
		Template template = templateDaoHibernate.get(channel.getArticleTemplate().getObjId());
		freemarker.template.Template t = cfg.getTemplate(template.getTemplatePath());
		
		//计算静态页面的存放路径
		String cmsStaticPage = messageSource.getMessage("cmsStaticPage");
		Calendar c = Calendar.getInstance();
		c.setTime(article.getCreateTime());
		String dir = Constants.ROOTPATH+File.separator + cmsStaticPage+File.separator + c.get(Calendar.YEAR)+"-"+(c.get(Calendar.MONTH)+1)+File.separator + c.get(Calendar.DATE) + File.separator + article.getObjId()+".html";
		File staticFile = new File(dir);
		if(!staticFile.getParentFile().exists()) {
			staticFile.getParentFile().mkdirs();
		}
		FileOutputStream fos = new FileOutputStream(staticFile);
		Writer out = new OutputStreamWriter(fos, "UTF-8");
		t.process(root, out);
	}

	
	

}
