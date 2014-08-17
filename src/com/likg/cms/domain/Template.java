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

import org.hibernate.annotations.GenericGenerator;

import com.likg.auth.domain.User;
import com.likg.cms.enumeration.TemplateEnum;
import com.likg.core.domain.BaseObject;

@Entity
@Table(name="CMS_TEMPLATE")
public class Template implements BaseObject {

	private static final long serialVersionUID = 1638300741655156017L;

	/**记录号*/
	@Id
	@Column(name="TEMPLATE_ID", length=50)
	@GeneratedValue(generator="generatorUUID")
	@GenericGenerator(name="generatorUUID", strategy="uuid")
	private String objId;
	
	/**模板名称*/
	@Column(name="TEMPLATE_NAME", length=20)
	private String templateName;
	
	/**模板类型(0:栏目模板；1:文章模板)*/
	@Column(name="TEMPLATE_TYPE", length=1)
	private String templateType;
	
	@Transient
	private String templateTypeCN;
	
	/**模板路径*/
	@Column(name="TEMPLATE_PATH", length=100)
	private String templatePath;
	
	@Transient
	private String templateContent;
	
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

	public String getTemplateName() {
		return templateName;
	}

	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}
	
	public String getTemplateType() {
		return templateType;
	}

	public void setTemplateType(String templateType) {
		this.templateType = templateType;
	}
	
	public String getTemplateTypeCN() {
		this.templateTypeCN = TemplateEnum.getTemplateTypeCN(this.templateType);
		return templateTypeCN;
	}

	public void setTemplateTypeCN(String templateTypeCN) {
		this.templateTypeCN = templateTypeCN;
	}

	public String getTemplatePath() {
		return templatePath;
	}

	public void setTemplatePath(String templatePath) {
		this.templatePath = templatePath;
	}
	
	public String getTemplateContent() {
		return templateContent;
	}

	public void setTemplateContent(String templateContent) {
		this.templateContent = templateContent;
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
