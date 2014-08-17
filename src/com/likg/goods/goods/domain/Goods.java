package com.likg.goods.goods.domain;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import com.likg.auth.domain.User;
import com.likg.core.domain.BaseObject;
import com.likg.goods.goodsbrand.domain.GoodsBrand;
import com.likg.goods.goodsclass.domain.GoodsClass;

@Entity
@Table(name="GOODS")
public class Goods implements BaseObject {

	private static final long serialVersionUID = -1529875094776536954L;

	/**记录号*/
	@Id
	@Column(name="GOODS_ID", length=50)
	@GeneratedValue(generator="generatorUUID")
	@GenericGenerator(name="generatorUUID", strategy="uuid")
	private String objId;
	
	/**所属商品品牌*/
	@ManyToOne(fetch=FetchType.LAZY, optional=true)
	@JoinColumn(name="GOODS_BRAND_ID")
	private GoodsBrand goodsBrand;
	
	/**所属商品分类*/
	@ManyToOne(fetch=FetchType.LAZY, optional=true)
	@JoinColumn(name="GOODS_CLASS_ID")
	private GoodsClass goodsClass;
	
	/**商品名称*/
	@Column(name="GOODS_NAME", length=20)
	private String goodsName;
	
	/**商品型号*/
	@Column(name="GOODS_CODE", length=50)
	private String goodsCode;
	
	/**参考价*/
	@Column(name="REF_PRICE", length=20)
	private BigDecimal refPrice;
	
	/**主图*/
	@Column(name="MAIN_PICTURE", length=50)
	private String mainPicture;
	
	/**商品描述*/
	@Column(name="GOODS_DESC", length=2000)
	private String goodsDesc;
	
	/**使用状态*/
	@Column(name="USE_STATUS", length=2)
	private String useStatus;
	
	/**创建人*/
	@ManyToOne(fetch=FetchType.LAZY, optional=true)
	@JoinColumn(name="CREATE_USER_ID")
	private User createUser;
	
	/** 创建时间 */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="CREATE_TIME")
	private Date createTime;

	public String getObjId() {
		return objId;
	}

	public void setObjId(String objId) {
		this.objId = objId;
	}
	
	public GoodsBrand getGoodsBrand() {
		return goodsBrand;
	}

	public void setGoodsBrand(GoodsBrand goodsBrand) {
		this.goodsBrand = goodsBrand;
	}

	public GoodsClass getGoodsClass() {
		return goodsClass;
	}

	public void setGoodsClass(GoodsClass goodsClass) {
		this.goodsClass = goodsClass;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getGoodsCode() {
		return goodsCode;
	}

	public void setGoodsCode(String goodsCode) {
		this.goodsCode = goodsCode;
	}

	public BigDecimal getRefPrice() {
		return refPrice;
	}

	public void setRefPrice(BigDecimal refPrice) {
		this.refPrice = refPrice;
	}

	public String getMainPicture() {
		return mainPicture;
	}

	public void setMainPicture(String mainPicture) {
		this.mainPicture = mainPicture;
	}

	public String getGoodsDesc() {
		return goodsDesc;
	}

	public void setGoodsDesc(String goodsDesc) {
		this.goodsDesc = goodsDesc;
	}

	public String getUseStatus() {
		return useStatus;
	}

	public void setUseStatus(String useStatus) {
		this.useStatus = useStatus;
	}

	public User getCreateUser() {
		return createUser;
	}

	public void setCreateUser(User createUser) {
		this.createUser = createUser;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}
