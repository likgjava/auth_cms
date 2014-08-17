package com.likg.cms.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.likg.auth.domain.User;
import com.likg.core.domain.BaseObject;

@Entity
@Table(name="CMS_UP_DOWN")
public class UpDown implements BaseObject {

	private static final long serialVersionUID = 1638300741655156017L;
	
	/**状态标记：顶*/
	public static final String STATUS_UP = "up";
	/**状态标记：踩*/
	public static final String STATUS_DOWN = "down";

	/**记录号，使用稿件id*/
	@Id
	@Column(name="UP_DOWN_ID", length=50)
	private String objId;
	
	/**顶*/
	@Column(name="UP", length=10)
	private Long up;
	
	/**踩*/
	@Column(name="DOWN", length=10)
	private Long down;
	
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

	public Long getUp() {
		return up;
	}

	public void setUp(Long up) {
		this.up = up;
	}

	public Long getDown() {
		return down;
	}

	public void setDown(Long down) {
		this.down = down;
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
