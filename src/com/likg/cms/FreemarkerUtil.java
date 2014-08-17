package com.likg.cms;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

import com.likg.cms.domain.Article;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class FreemarkerUtil {
	
	static Logger log = Logger.getLogger(FreemarkerUtil.class);
	
	public static void makeView() throws IOException, TemplateException {
		
		//获取存放静态页面文件的目录
		//FrameMessageSource messageSource = (FrameMessageSource) FrameBeanFactory.getBean(FrameMessageSource.BEAN_NAME);
		//String cmsStaticPage = messageSource.getMessage("cmsStaticPage");
		//File templateDir = new File(Constants.ROOTPATH + cmsStaticPage);
		//File templateDir = new File("D:\\Projects\\myWorkSpace\\auth_platform\\webapp\\data\\staticpage");
		File templateDir = new File("D:\\Projects\\myWorkSpace\\auth_platform\\webapp\\data\\template");
		
		Configuration cfg = new Configuration();
		cfg.setDirectoryForTemplateLoading(templateDir);
		
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("hello", "王小二");
		
		Article article = new Article();
		article.setTitle("辽宁号航空母舰入列");
		
		root.put("article", article);
		
		File f = new File("D:\\Projects\\myWorkSpace\\auth_platform\\webapp\\data\\staticpage\\a.html");
		FileWriter fw = new FileWriter(f);
		Template t = cfg.getTemplate("2c93a0c239fb0a040139fb0ded6a0001.ftl");
		//Writer out = new OutputStreamWriter(System.out, "GBK");
		t.process(root, fw);
		
		fw.close();
	}
	
	public static void main(String[] args) {
		try {
			FreemarkerUtil.makeView();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		}
	}

}
