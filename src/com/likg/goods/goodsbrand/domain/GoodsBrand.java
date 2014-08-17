package com.likg.goods.goodsbrand.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

import com.likg.auth.domain.User;
import com.likg.core.domain.BaseObject;
import com.likg.goods.goodsclass.domain.GoodsClass;

/**
 * 商品品牌
 * @author likg
 */
@Entity
@Table(name="GOODS_BRAND")
public class GoodsBrand implements BaseObject {

	private static final long serialVersionUID = -1529875094776536954L;

	/**记录号*/
	@Id
	@Column(name="GOODS_BRAND_ID", length=50)
	@GeneratedValue(generator="generatorUUID")
	@GenericGenerator(name="generatorUUID", strategy="uuid")
	private String objId;
	
	/**品牌名称*/
	@Column(name="BRAND_NAME", length=20)
	private String brandName;
	
	/**图片*/
	@Column(name="BRAND_PICTURE", length=50)
	private String brandPicture;
	
	/**品牌描述*/
	@Column(name="BRAND_DESC", length=2000)
	private String brandDesc;
	
	/**品牌分类中间表*/
	@ManyToMany(cascade={CascadeType.MERGE, CascadeType.REFRESH})
	@JoinTable(name="GOODS_BRAND_TO_CLASS", joinColumns={@JoinColumn(name="GOODS_BRAND_ID")}, inverseJoinColumns={@JoinColumn(name="GOODS_CLASS_ID")})
	private Set<GoodsClass> goodsClasses = new HashSet<GoodsClass>();
	
	/**商品分类IDs，多个以逗号分隔*/
	@Column(name="GOODS_CLASS_IDS", length=2000)
	private String goodsClassIds;
	
	/**商品分类Names，多个以逗号分隔*/
	@Column(name="GOODS_CLASS_NAMES", length=2000)
	private String goodsClassNames;
	
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

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getBrandPicture() {
		return brandPicture;
	}

	public void setBrandPicture(String brandPicture) {
		this.brandPicture = brandPicture;
	}

	public String getBrandDesc() {
		return brandDesc;
	}

	public void setBrandDesc(String brandDesc) {
		this.brandDesc = brandDesc;
	}
	
	public Set<GoodsClass> getGoodsClasses() {
		return goodsClasses;
	}

	public void setGoodsClasses(Set<GoodsClass> goodsClasses) {
		this.goodsClasses = goodsClasses;
	}
	
	public String getGoodsClassIds() {
		return goodsClassIds;
	}

	public void setGoodsClassIds(String goodsClassIds) {
		this.goodsClassIds = goodsClassIds;
	}

	public String getGoodsClassNames() {
		return goodsClassNames;
	}

	public void setGoodsClassNames(String goodsClassNames) {
		this.goodsClassNames = goodsClassNames;
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
