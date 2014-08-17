package com.likg.cms.importdb;

import java.io.File;
import java.util.Properties;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

/**
 * 导库程序的配置类<br/>
 * 读取导库程序的配置文件信息
 * @author likg
 */
public class ImportConfig {
	static Logger log = Logger.getLogger(ImportConfig.class);

	public static String importWorkDir;
	public static String importXmlDir;
	public static String driverClassName;
	public static String url;
	public static String username;
	public static String password;
	
	static {
		load();
		check();
	}
	
	/**
	 * 加载数据
	 */
	private static void load() {
		try {
			Properties prop = new Properties();
			prop.load(ImportConfig.class.getClassLoader().getResourceAsStream("importdb.properties"));
			
			ImportConfig.importWorkDir = prop.getProperty("importWorkDir");
			ImportConfig.importXmlDir = prop.getProperty("importXmlDir");
			ImportConfig.driverClassName = prop.getProperty("driverClassName");
			ImportConfig.url = prop.getProperty("url");
			ImportConfig.username = prop.getProperty("username");
			ImportConfig.password = prop.getProperty("password");
			
		} catch (Exception e) {
			log.error("读取配置文件信息时出现错误！", e);
		}
	}
	
	/**
	 * 验证数据
	 */
	private static void check() {
		try {
			if(StringUtils.isNotBlank(ImportConfig.importWorkDir)) {
				File dir = new File(ImportConfig.importWorkDir);
				if(!dir.exists()) {
					dir.mkdirs();
				}
			} else {
				log.error("importWorkDir参数不能为空！");
			}
			
			if(StringUtils.isNotBlank(ImportConfig.importXmlDir)) {
				new File(ImportConfig.importXmlDir);
			} else {
				log.error("importXmlDir参数不能为空！");
			}
			
			if(StringUtils.isBlank(ImportConfig.driverClassName)) {
				log.error("driverClassName 参数不能为空！");
			}
			if(StringUtils.isBlank(ImportConfig.url)) {
				log.error("url 参数不能为空！");
			}
			if(StringUtils.isBlank(ImportConfig.username)) {
				log.error("username 参数不能为空！");
			}
		} catch (Exception e) {
			log.error("验证配置参数时出现错误，请检查配置参数是否正确！", e);
		}
	}
	
	public static void main(String[] args) {
		System.out.println(ImportConfig.importWorkDir);
	}
}
