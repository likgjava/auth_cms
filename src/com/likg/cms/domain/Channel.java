package com.likg.cms.domain;

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
@Table(name="CMS_CHANNEL")
public class Channel implements BaseTree<Channel> {

	private static final long serialVersionUID = 1638300741655156017L;

	/**记录号*/
	@Id
	@Column(name="CHANNEL_ID", length=50)
	private String objId;
	
	/**父栏目*/
	@ManyToOne(fetch=FetchType.LAZY, optional=true)
	@JoinColumn(name="CHANNEL_PARENT_ID")
	private Channel parent;
	
	/**栏目名称*/
	@Column(name="CHANNEL_NAME", length=20)
	private String channelName;
	
	/**栏目模板*/
	@ManyToOne(fetch=FetchType.LAZY, optional=true)
	@JoinColumn(name="CHANNEL_TEMPLATE_ID")
	private Template channelTemplate;
	
	/**文章模板*/
	@ManyToOne(fetch=FetchType.LAZY, optional=true)
	@JoinColumn(name="article_template_ID")
	private Template articleTemplate;
	
	/**栏目描述*/
	@Column(name="CHANNEL_DESC", length=100)
	private String channelDesc;
	
	/**栏目级别*/
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
	private Set<Channel> children = new HashSet<Channel>();

	public String getObjId() {
		return objId;
	}

	public void setObjId(String objId) {
		this.objId = objId;
	}

	public Channel getParent() {
		return parent;
	}

	public void setParent(Channel parent) {
		this.parent = parent;
	}

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}
	
	public Template getChannelTemplate() {
		return channelTemplate;
	}

	public void setChannelTemplate(Template channelTemplate) {
		this.channelTemplate = channelTemplate;
	}

	public Template getArticleTemplate() {
		return articleTemplate;
	}

	public void setArticleTemplate(Template articleTemplate) {
		this.articleTemplate = articleTemplate;
	}

	public String getChannelDesc() {
		return channelDesc;
	}

	public void setChannelDesc(String channelDesc) {
		this.channelDesc = channelDesc;
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

	public Set<Channel> getChildren() {
		return children;
	}

	public void setChildren(Set<Channel> children) {
		this.children = children;
	}

}
