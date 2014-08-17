package com.likg.goods.goods.service.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.likg.core.service.impl.BaseTreeServiceImpl;
import com.likg.goods.goods.dao.GoodsDao;
import com.likg.goods.goods.domain.Goods;
import com.likg.goods.goods.service.GoodsService;
import com.likg.lucene.LuceneUtil;
import com.likg.security.AuthenticationHelper;

@Service
public class GoodsServiceImpl extends BaseTreeServiceImpl<Goods> implements GoodsService {
	
	@Resource(name="goodsDaoHibernate")
	private GoodsDao goodsDaoHibernate;

	/**
	 * 保存用户信息
	 * @param Goods 用户对象
	 * @throws Exception
	 */
	public void saveGoods(Goods goods) throws Exception {
		//新增
		if(StringUtils.isBlank(goods.getObjId())) {
			goods.setCreateUser(AuthenticationHelper.getCurrentUser());
			goodsDaoHibernate.save(goods);
			
			//LuceneUtil.addIndex(goods);
			
//			String luceneIndexPath = messageSource.getMessage("luceneIndexPath");
//			
//			//1、创建Directory
//			Directory directory = FSDirectory.open(new File(Constants.ROOTPATH + luceneIndexPath)); //建立在硬盘上
//
//			//2、创建IndexWriter
//			IndexWriterConfig iwc = new IndexWriterConfig(Version.LUCENE_36, new StandardAnalyzer(Version.LUCENE_36));
//			IndexWriter writer = new IndexWriter(directory, iwc);
//
//			//3、创建Document对象
//			Document doc = null;
//			
//			//4、为Document添加Field
//			doc = new Document();
//			doc.add(new Field("objId", goods.getObjId(), Field.Store.YES, Field.Index.NOT_ANALYZED));
//			doc.add(new Field("goodsName", goods.getGoodsName()+goods.getGoodsCode(), Field.Store.YES, Field.Index.NOT_ANALYZED));
//			doc.add(new Field("content", goods.getGoodsDesc(), Field.Store.YES, Field.Index.ANALYZED));
//			
//			//5、通过IndexWriter添加文档到索引中
//			writer.addDocument(doc);
//			
//			//6、关闭流
//			writer.close();

			
			
		}
		//修改
		else {
			Goods oldGoods = goodsDaoHibernate.get(goods.getObjId());
			oldGoods.setGoodsName(goods.getGoodsName());
			oldGoods.setGoodsCode(goods.getGoodsCode());
			oldGoods.setGoodsBrand(goods.getGoodsBrand());
			oldGoods.setGoodsClass(goods.getGoodsClass());
			oldGoods.setRefPrice(goods.getRefPrice());
			oldGoods.setGoodsDesc(goods.getGoodsDesc());
			oldGoods.setMainPicture(goods.getMainPicture());
			goodsDaoHibernate.save(oldGoods);
			
			LuceneUtil.updateIndex(oldGoods);
		}
	}

	

}
