package com.likg.cms.domain;

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
import javax.persistence.Transient;

import org.hibernate.Session;
import org.hibernate.annotations.GenericGenerator;

import com.likg.auth.domain.User;
import com.likg.cms.enumeration.ArticleEnum;
import com.likg.core.domain.BaseObject;

@Entity
@Table(name="CMS_ARTICLE")
public class Article implements BaseObject {

	private static final long serialVersionUID = 1638300741655156017L;

	/**记录号*/
	@Id
	@Column(name="ARTICLE_ID", length=50)
	@GeneratedValue(generator="generatorUUID")
	@GenericGenerator(name="generatorUUID", strategy="uuid")
	private String objId;
	
	/**所属栏目*/
	@ManyToOne(fetch=FetchType.LAZY, optional=true)
	@JoinColumn(name="CHANNEL_ID")
	private Channel channel;
	
	/**标题*/
	@Column(name="TITLE", length=20)
	private String title;
	
	/**作者*/
	@Column(name="AUTHOR", length=20)
	private String author;
	
	/**摘要*/
	@Column(name="ABSTRACTS", length=20)
	private String abstracts;
	
	/**内容*/
	@Column(name="CONTENT", length=20)
	private String content;
	
	/**发布状态(00:未发布；01:已发布)*/
	@Column(name="RELEASE_STATUS", length=2)
	private String releaseStatus;
	
	@Transient
	private String releaseStatusCN;
	
	/**发布日期*/
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="RELEASE_DATE")
	private Date releaseDate;
	
	/**稿件来源*/
	@Column(name="SOURCE", length=20)
	private String source;
	
	/**创建人*/
	@ManyToOne(fetch=FetchType.LAZY, optional=true)
	@JoinColumn(name="CREATE_USER_ID")
	private User createUser;
	
	/**创建时间*/
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="CREATE_TIME")
	private Date createTime;

	public String getObjId() {
		return objId;
	}

	public void setObjId(String objId) {
		this.objId = objId;
	}
	
	public Channel getChannel() {
		return channel;
	}

	public void setChannel(Channel channel) {
		this.channel = channel;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getAbstracts() {
		return abstracts;
	}

	public void setAbstracts(String abstracts) {
		this.abstracts = abstracts;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public String getReleaseStatus() {
		return releaseStatus;
	}

	public void setReleaseStatus(String releaseStatus) {
		this.releaseStatus = releaseStatus;
	}
	
	public String getReleaseStatusCN() {
		this.releaseStatusCN = ArticleEnum.getReleaseStatusCN(this.releaseStatus);
		return releaseStatusCN;
	}

	public void setReleaseStatusCN(String releaseStatusCN) {
		this.releaseStatusCN = releaseStatusCN;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	
	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
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
