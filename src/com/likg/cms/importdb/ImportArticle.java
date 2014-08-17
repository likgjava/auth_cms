package com.likg.cms.importdb;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Node;

import com.likg.cms.domain.Article;
import com.likg.cms.domain.Channel;
import com.likg.core.util.TreeSequenceUtil;

/**
 * 稿件导入主程序<br/>
 * 把xml格式的稿件导入到CMS系统的数据库中。
 * @author likg
 */
public class ImportArticle {
	static Logger log = Logger.getLogger(ImportArticle.class);
	
	private Connection conn = null;

	/**
	 * 开始导库任务
	 */
	public void start() {
		log.info("导库程序开始处理稿件...");
		
		//读取xml稿件
		File xmlDir = new File(ImportConfig.importXmlDir);
		for(File xmlFile : xmlDir.listFiles()) {
			//标记是否导入成功
			boolean isSuccess = true;
			
			//把XML转化成Article对象
			Article article = this.xml2Article(xmlFile);
			
			if(article != null) {
				//设置稿件id
				article.setObjId(UUID.randomUUID().toString());
				//保存稿件到数据库
				isSuccess = this.saveArticle(article);
			} else {
				isSuccess = false;
			}
			
			//把成功导入和失败导入的稿件的xml文件分别移动到bak和fail目录下
			this.moveFileToDirectory(xmlFile, isSuccess);
		}
	}
	
	/**
	 * 把成功导入和失败导入的稿件的xml文件分别移动到bak和fail目录下
	 * @param srcFile 源文件
	 * @param isSuccess 执行结果
	 */
	private void moveFileToDirectory(File srcFile, boolean isSuccess) {
		try {
			if(isSuccess) {
				FileUtils.moveFileToDirectory(srcFile, new File(ImportConfig.importWorkDir+File.separator+"bak"), true);
			} else {
				FileUtils.moveFileToDirectory(srcFile, new File(ImportConfig.importWorkDir+File.separator+"fail"), true);
			}
		} catch (IOException e) {
			log.error("把xml稿件文件移动到bak\\fail目录下时出现错误！", e);
		}
	}

	/**
	 * 保存稿件到数据库
	 * @param article 稿件对象
	 * @return 执行结果
	 */
	private boolean saveArticle(Article article) {
		//标记是否保存成功
		boolean isSuccess = true;
		
		String sql = "insert into cms_article(ARTICLE_ID,CHANNEL_ID,TITLE,AUTHOR,ABSTRACTS,CONTENT,RELEASE_STATUS,RELEASE_DATE,SOURCE,CREATE_TIME) values(?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = null;
		try {
			ps = this.conn.prepareStatement(sql);
			ps.setString(1, article.getObjId());
			ps.setString(2, article.getChannel().getObjId());
			ps.setString(3, article.getTitle());
			ps.setString(4, article.getAuthor());
			ps.setString(5, article.getAbstracts());
			ps.setString(6, article.getContent());
			ps.setString(7, article.getReleaseStatus());
			ps.setTimestamp(8, new java.sql.Timestamp(article.getReleaseDate().getTime()));
			ps.setString(9, article.getSource());
			ps.setTimestamp(10, new java.sql.Timestamp(article.getCreateTime().getTime()));
			
			ps.execute();
		} catch (SQLException e) {
			isSuccess = false;
			log.error("把稿件保存到数据库时出现错误！", e);
		} finally {
			ImportConn.close(null, ps, null);
		}
		
		if(isSuccess) {
			log.info("成功导入稿件["+article.getObjId()+":"+article.getTitle()+"]");
		} else {
			log.info("稿件导入失败["+article.getObjId()+":"+article.getTitle()+"]");
		}
		
		return isSuccess;
	}
	
	/**
	 * 把XML转化成Article对象
	 * @param xmlFile XML格式稿件信息文件
	 * @return Article对象
	 */
	public Article xml2Article(File xmlFile) {
		Article article = null;
		
		try {
			String xmlStr = FileUtils.readFileToString(xmlFile);
			Document doc = DocumentHelper.parseText(xmlStr);
			
			//栏目信息
			article = new Article();
			Node node = doc.selectSingleNode("//article/channel");
			String channelNames = node.getText();
			Channel channel = this.processChannel(channelNames);
			article.setChannel(channel);
			
			node = doc.selectSingleNode("//article/title");
			article.setTitle(node.getText());
			
			node = doc.selectSingleNode("//article/author");
			article.setAuthor(node.getText());
			
			node = doc.selectSingleNode("//article/abstracts");
			article.setAbstracts(node.getText());
			
			node = doc.selectSingleNode("//article/content");
			article.setContent(node.getText());
			
			node = doc.selectSingleNode("//article/releaseStatus");
			article.setReleaseStatus(node.getText());
			
			node = doc.selectSingleNode("//article/releaseDate");
			String releaseDate = node.getText();
			article.setReleaseDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(releaseDate));
			node = doc.selectSingleNode("//article/source");
			article.setSource(node.getText());
			node = doc.selectSingleNode("//article/createTime");
			String createTime = node.getText();
			article.setCreateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(createTime));
		} catch (DocumentException e) {
			log.error("解析["+xmlFile.getName()+"]文档时出现错误！", e);
		} catch (Exception e) {
			log.error("把["+xmlFile.getName()+"]稿件转化为对象时出现错误！", e);
		}
		
		return article;
	}
	
	/**
	 * 根据栏目名称获取稿件的栏目信息，若不存在就创建
	 * @param channelNames
	 * @return
	 */
	private Channel processChannel(String channelNames) {
		Channel channel = null;
		
		String[] channelNameList = channelNames.split("~");
		String parentId = null;
		for(int i=0; i<channelNameList.length; i++) {
			String channelName = channelNameList[i];
			
			//若不存在就创建
			channel = this.getChannel(channelName, i+1);
			if(channel == null) {
				channel = this.createChannel(channelName, i+1, parentId);
			}
			parentId = channel.getObjId();
		}
		
		return channel;
	}
	
	/**
	 * 创建新栏目
	 * @param channelName 栏目名称
	 * @param treeLevel	树层级
	 * @param parentId 父id
	 * @return
	 */
	private Channel createChannel(String channelName, int treeLevel, String parentId) {
		Channel channel = null;
		PreparedStatement ps = null;
		
		//获取栏目id
		String channelId = null;
		if(treeLevel == 1) {
			channelId = this.getSequenceNo(TreeSequenceUtil.CHANNEL_PREFIX);
		} else {
			channelId = this.getSequenceNo(parentId);
		}
		
		String sql = "insert into CMS_CHANNEL(CHANNEL_ID,CHANNEL_PARENT_ID,CHANNEL_NAME,TREE_LEVEL,IS_LEAF) values(?,?,?,?,1)";
		try {
			//关闭自动提交事务
			this.conn.setAutoCommit(false);
			
			ps = this.conn.prepareStatement(sql);
			ps.setString(1, channelId);
			ps.setString(2, parentId);
			ps.setString(3, channelName);
			ps.setInt(4, treeLevel);
			ps.execute();
			
			//如果该节点是第一个孩子，则修改父节点的IS_LEAF字段值
			if(channelId.endsWith("01") && treeLevel>1) {
				sql = "update CMS_CHANNEL set IS_LEAF=0 where CHANNEL_ID=?";
				ps = this.conn.prepareStatement(sql);
				ps.setString(1, parentId);
				ps.execute();
			}
			
			//提交事务
			this.conn.commit();
			
			channel = new Channel();
			channel.setObjId(channelId);
			channel.setChannelName(channelName);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				//打开自动提交事务
				this.conn.setAutoCommit(true);
			} catch (SQLException e) {
				log.error("打开自动提交事务时出现错误！", e);
			}
			ImportConn.close(null, ps, null);
		}
		
		return channel;
	}
	
	/**
	 * 根据父栏目id获取栏目序列号
	 * @param parentId
	 * @return
	 */
	private String getSequenceNo(String parentId) {
		String sequenceNo = parentId;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select COALESCE(MAX(SUBSTRING(CHANNEL_ID, "+(parentId.length()+1)+", 2)),0) from CMS_CHANNEL where CHANNEL_ID like '"+parentId+"%' and LENGTH(CHANNEL_ID) = "+(parentId.length()+2);
		try {
			ps = this.conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				String result = rs.getObject(1).toString();
				int num = Integer.parseInt(result) + 1;
				sequenceNo += (num<9 ? "0" : "") + num;
			}
		} catch (SQLException e) {
			log.error("获取栏目序列号时出现错误！", e);
		} finally {
			ImportConn.close(rs, ps, null);
		}
		
		return sequenceNo;
	}

	/**
	 * 根据栏目名称和树层级获取栏目对象
	 * @param channelName 栏目名称
	 * @param treeLevel	树层级
	 * @return
	 */
	private Channel getChannel(String channelName, int treeLevel) {
		Channel channel = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select CHANNEL_ID from CMS_CHANNEL t where t.CHANNEL_NAME=? and t.TREE_LEVEL=?");
		try {
			ps = this.conn.prepareStatement(sql.toString());
			ps.setString(1, channelName);
			ps.setInt(2, treeLevel);
			rs = ps.executeQuery();
			if(rs.next()) {
				String channelId = rs.getString("CHANNEL_ID");
				channel = new Channel();
				channel.setObjId(channelId);
				channel.setChannelName(channelName);
			}
			
		} catch (SQLException e) {
			log.error("根据栏目名称和树层级获取栏目对象时出现错误！", e);
		} finally {
			ImportConn.close(rs, ps, null);
		}
		
		return channel;
	}

	public static void main(String[] args) {
		long begin = System.currentTimeMillis();
		
		ImportArticle i = new ImportArticle();
		
		//获取数据库连接
		i.conn = ImportConn.getConnection();
		
		//清空importWorkDir目录
		try {
			FileUtils.cleanDirectory(new File(ImportConfig.importWorkDir));
		} catch (Exception e) {
		}
		
		//启动任务
		i.start();
		
		//关闭数据库连接
		ImportConn.close(null, null, i.conn);
		
		long end = System.currentTimeMillis();
		log.info("共花费时间："+(end-begin)*1.0/1000+" s");
	}
	
}
