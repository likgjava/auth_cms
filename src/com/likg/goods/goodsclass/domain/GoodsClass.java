package com.likg.goods.goodsclass.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import com.likg.auth.domain.User;
import com.likg.core.domain.BaseTree;

@Entity
@Table(name="GOODS_CLASS")
public class GoodsClass implements BaseTree<GoodsClass> {

	private static final long serialVersionUID = -1529875094776536954L;

	/**记录号*/
	@Id
	@Column(name="GOODS_CLASS_ID", length=50)
	private String objId;
	
	/**父分类*/
	@ManyToOne(fetch=FetchType.LAZY, optional=true)
	@JoinColumn(name="GOODS_CLASS_PARENT_ID")
	private GoodsClass parent;
	
	/**商品分类名称*/
	@Column(name="GOODS_CLASS_NAME", length=20)
	private String goodsClassName;
	
	/**商品分类描述*/
	@Column(name="GOODS_CLASS_DESC", length=2000)
	private String goodsClassDesc;
	
	/**级别*/
	@Column(name="TREE_LEVEL")
	private Short treeLevel;
	
	/**是否叶子节点*/
	@Column(name="IS_LEAF")
	private Boolean isLeaf;
	
	/**创建人*/
	@ManyToOne(fetch=FetchType.LAZY, optional=true)
	@JoinColumn(name="CREATE_USER_ID")
	private User createUser;
	
	/**创建时间*/
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="CREATE_TIME")
	private Date createTime;
	
	@Transient
	private Set<GoodsClass> children = new HashSet<GoodsClass>();

	public String getObjId() {
		return objId;
	}

	public void setObjId(String objId) {
		this.objId = objId;
	}

	public GoodsClass getParent() {
		return parent;
	}

	public void setParent(GoodsClass parent) {
		this.parent = parent;
	}

	public String getGoodsClassName() {
		return goodsClassName;
	}

	public void setGoodsClassName(String goodsClassName) {
		this.goodsClassName = goodsClassName;
	}

	public String getGoodsClassDesc() {
		return goodsClassDesc;
	}

	public void setGoodsClassDesc(String goodsClassDesc) {
		this.goodsClassDesc = goodsClassDesc;
	}

	public Short getTreeLevel() {
		return treeLevel;
	}

	public void setTreeLevel(Short treeLevel) {
		this.treeLevel = treeLevel;
	}

	public Boolean getIsLeaf() {
		return isLeaf;
	}

	public void setIsLeaf(Boolean isLeaf) {
		this.isLeaf = isLeaf;
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

	public Set<GoodsClass> getChildren() {
		return children;
	}

	public void setChildren(Set<GoodsClass> children) {
		this.children = children;
	}
	
}
