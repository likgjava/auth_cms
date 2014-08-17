package com.likg.lucene;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.WildcardQuery;
import org.apache.lucene.search.BooleanClause.Occur;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.store.LockObtainFailedException;
import org.apache.lucene.util.Version;

import com.likg.cms.domain.Article;
import com.likg.common.Constants;
import com.likg.core.context.FrameBeanFactory;
import com.likg.core.context.FrameMessageSource;
import com.likg.core.domain.BaseObject;
import com.likg.goods.goods.domain.Goods;

/**
 * 索引工具类
 * @author likg
 */
public class LuceneUtilTest {
	
	static Logger log = Logger.getLogger(LuceneUtilTest.class);
	
	/**索引目录*/
	private static Directory directory;
	
	private static IndexReader indexReader;
	private static IndexWriter indexWriter;
	
	//类加载的时候，初始化对象
	static {
		init();
	}
	
	/**
	 * 初始化对象
	 */
	//@PostConstruct
	public static void init() {
		log.info("初始化索引工具类...");
		
		//获取存放索引文件的目录
		//FrameMessageSource messageSource = (FrameMessageSource) FrameBeanFactory.getBean(FrameMessageSource.BEAN_NAME);
		//String luceneIndexPath = messageSource.getMessage("luceneIndexPath");
		//File indexFile = new File(Constants.ROOTPATH + luceneIndexPath);
		File indexFile = new File("c:/luceneindex");
		indexFile.delete();
		if(!indexFile.exists()) {
			
			indexFile.mkdirs();
		}
		
		try {
			//1、创建Directory
			directory = FSDirectory.open(indexFile); //建立在硬盘上
			
			//2、创建IndexWriter
			IndexWriterConfig iwc = new IndexWriterConfig(Version.LUCENE_36, new StandardAnalyzer(Version.LUCENE_36));
			indexWriter = new IndexWriter(directory, iwc);
		} catch (IOException e) {
			log.error("初始化Directory、IndexWriter时出现异常："+e.getMessage());
		}
		
	}
	
	/**
	 * 如果IndexReader发生了变化，则获取新的IndexReader对象
	 * @return
	 */
	private static IndexReader getIndexReader() {
		try {
			//预防在未创建索引文件时读取发生错误
			if(indexReader == null) {
				//2、创建IndexReader
				indexReader = IndexReader.open(directory);
			}
			
			//判断IndexReader是否发生了变化
			IndexReader newIndexReader = IndexReader.openIfChanged(indexReader);
			if(newIndexReader != null) {
				indexReader.close();
				indexReader = newIndexReader;
			}
		} catch (IOException e) {
			log.error("获取IndexReader对象时出现异常："+e.getMessage());
		}

		return indexReader;
	}
	
	/**
	 * 创建索引文件
	 * @param object 商品或稿件对象
	 */
	public static void addIndex(BaseObject object) {
		try {
			//3、创建Document对象
			Document doc = new Document();
			
			//4、为Document添加Field
			//为稿件添加索引信息
			if(object instanceof Article) {
				Article article = (Article) object;
				doc.add(new Field("objId", article.getObjId(), Field.Store.YES, Field.Index.NO));
				doc.add(new Field("title", article.getTitle(), Field.Store.YES, Field.Index.NOT_ANALYZED));
				doc.add(new Field("content", article.getContent(), Field.Store.NO, Field.Index.ANALYZED));
				
			}
			//为商品信息添加索引
			else if(object instanceof Goods) {
				Goods goods = (Goods) object;
				doc.add(new Field("objId", goods.getObjId(), Field.Store.YES, Field.Index.NO));
				doc.add(new Field("goodsName", goods.getGoodsName(), Field.Store.YES, Field.Index.NOT_ANALYZED));
				doc.add(new Field("content", goods.getGoodsDesc(), Field.Store.NO, Field.Index.ANALYZED));
			}
			
			//5、通过IndexWriter添加文档到索引中
			indexWriter.addDocument(doc);
			indexWriter.commit();
		} catch (IOException e) {
			log.error("创建索引文件时出现异常！", e);
		}
		
	}
	
	/**
	 * 更新索引信息
	 * @param object 商品或稿件对象
	 */
	public static void updateIndex(BaseObject object) {
		try {
			//Lucene并没有提供更新，这里的更新操作其实是如下两个操作的合集 先删除之后再添加
			Document doc = new Document();
			
			//为稿件更新索引信息
			if(object instanceof Article) {
				log.info("更新稿件索引信息，id="+object.getObjId());
				Article article = (Article) object;
				doc.add(new Field("objId", article.getObjId(), Field.Store.YES, Field.Index.NO));
				doc.add(new Field("title", article.getTitle(), Field.Store.YES, Field.Index.NOT_ANALYZED));
				doc.add(new Field("content", article.getContent(), Field.Store.NO, Field.Index.ANALYZED));
			}
			//为商品更新索引
			else if(object instanceof Goods) {
				log.info("更新商品索引信息，id="+object.getObjId());
				Goods goods = (Goods) object;
				doc.add(new Field("objId", goods.getObjId(), Field.Store.YES, Field.Index.NO));
				doc.add(new Field("goodsName", goods.getGoodsName(), Field.Store.YES, Field.Index.NOT_ANALYZED));
				doc.add(new Field("content", goods.getGoodsDesc(), Field.Store.NO, Field.Index.ANALYZED));
			}
			
			indexWriter.updateDocument(new Term("objId", object.getObjId()), doc);
		} catch (Exception e) {
			log.error("更新索引文件时出现异常！", e);
		}
		
	}

	/**
	 * 为商品信息添加索引
	 * @param goods 商品信息
	 */
	public static void addGoodsIndex(Goods goods) {
		log.info("为商品信息添加索引，商品id="+goods.getObjId());
		
		try {
			//3、创建Document对象
			Document doc = null;
			
			//4、为Document添加Field
			doc = new Document();
			doc.add(new Field("objId", goods.getObjId(), Field.Store.YES, Field.Index.NO));
			doc.add(new Field("goodsName", goods.getGoodsName(), Field.Store.YES, Field.Index.NOT_ANALYZED));
			doc.add(new Field("content", goods.getGoodsDesc(), Field.Store.NO, Field.Index.ANALYZED));
			
			//5、通过IndexWriter添加文档到索引中
			indexWriter.addDocument(doc);
			indexWriter.commit();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * 更新商品的索引信息
	 * @param goods 商品信息
	 */
	public static void updateGoodsIndex(Goods goods) {
		log.info("更新商品的索引信息，商品id="+goods.getObjId());
		
		try {
			//Lucene并没有提供更新，这里的更新操作其实是如下两个操作的合集 先删除之后再添加
			Document doc = new Document();
			doc.add(new Field("objId", goods.getObjId(), Field.Store.YES, Field.Index.NO));
			doc.add(new Field("goodsName", goods.getGoodsName(), Field.Store.YES, Field.Index.NOT_ANALYZED));
			doc.add(new Field("content", goods.getGoodsDesc(), Field.Store.NO, Field.Index.ANALYZED));
			indexWriter.updateDocument(new Term("objId", goods.getObjId()), doc);
			
		} catch (CorruptIndexException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (LockObtainFailedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 删除索引信息
	 * @param objId 对象id
	 */
	public static void deleteIndex(String objId) {
		log.info("删除索引信息，id="+objId);
		
		try {
			// 参数是一个选项，可以是一个Query，也可以是一个term，term是一个精确查找的值
			// 此时删除的文档并不会被完全删除，而是存储在一个回收站中的，可以恢复
			indexWriter.deleteDocuments(new Term("objId", objId));
			indexWriter.commit(); //提交
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	/**
	 * 根据关键字搜索，返回满足条件的对象objId
	 * @param keyWord 关键字
	 * @return
	 */
	public static List<String> search(String keyWord) {
		List<String> objIdList = new ArrayList<String>();
		
		try {
			//3、根据IndexReader创建IndexSearcher
			IndexSearcher searcher = new IndexSearcher(LuceneUtilTest.getIndexReader());
			
			//4、创建搜索的Query
			//创建parser来确定要搜索的内容，第二个参数表示搜索的域
			QueryParser parser = new QueryParser(Version.LUCENE_36, "goodsName", new StandardAnalyzer(Version.LUCENE_36));
			//创建query，表示搜索域为content中包含java的文档
			//Query query = parser.parse(keyWord);
			Query query1 = new WildcardQuery(new Term("goodsName", "*"+keyWord+"*"));
			Query query2 = new WildcardQuery(new Term("content", "*"+keyWord+"*"));
			
			BooleanQuery booleanQuery = new BooleanQuery();
			booleanQuery.add(query1, Occur.SHOULD);
			booleanQuery.add(query2, Occur.SHOULD);
			
			//5、根据searcher搜索并返回TopDocs
			TopDocs tds = searcher.search(booleanQuery, 10);
			
			//6、根据TopDocs获取ScoreDoc对象
			ScoreDoc[] sds = tds.scoreDocs;
			System.out.println("查询到："+sds.length);
			for(ScoreDoc sd : sds) {
				//7、根据searcher和ScoreDoc对象获取具体的Document
				Document d = searcher.doc(sd.doc);
				
				//8、根据Document对象获取需要的值
				System.out.println("objId===="+d.get("objId"));
				objIdList.add(d.get("objId"));
			}
			searcher.close();
		} catch (IOException e) {
			e.printStackTrace();
		} 
		
		return objIdList;
	}
	
	
	public static void main(String[] args) {
		Goods g1 = new Goods();
		g1.setObjId("1");
		g1.setGoodsName("联想lenovo r400");
		g1.setGoodsDesc("hello word,我是中国人， 联想是中国的品牌！");
		
		Goods g2 = new Goods();
		g2.setObjId("2");
		g2.setGoodsName("中国");
		g2.setGoodsDesc("hello word 联想是中国的品牌！");
		
		Goods g3 = new Goods();
		g3.setObjId("3");
		g3.setGoodsName("中国人");
		g3.setGoodsDesc("good,联想电脑真站！");
		
		LuceneUtilTest.addGoodsIndex(g1);
		LuceneUtilTest.addGoodsIndex(g2);
		LuceneUtilTest.addGoodsIndex(g3);
		
		LuceneUtilTest.search("联想");
		
		
		closeIndexReader();
		closeIndexWriter();
		
	}
	
	/**
	 * 关闭IndexReader
	 */
	@SuppressWarnings("unused")
	private static void closeIndexReader() {
		if(indexReader != null) {
			try {
				indexReader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 关闭IndexWriter
	 */
	@SuppressWarnings("unused")
	private static void closeIndexWriter() {
		if(indexWriter != null) {
			try {
				indexWriter.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
}
