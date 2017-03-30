package com.xiaohai.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="t_gonggao")
public class Gonggao implements java.io.Serializable
{
	private Integer gonggaoId;
	private String gonggaoTitle;
	private String gonggaoContent;
	private String gonggaoData;

	public Gonggao(){}
	
	@Id
	@GenericGenerator(name = "generator", strategy = "native")
	@GeneratedValue(generator = "generator")
	@Column(name = "gonggao_id", length=11)
	public Integer getGonggaoId()
	{
		return gonggaoId;
	}

	public void setGonggaoId(Integer gonggaoId)
	{
		this.gonggaoId = gonggaoId;
	}
	@Column(name = "gonggao_title", length = 100)
	public String getGonggaoTitle()
	{
		return gonggaoTitle;
	}

	public void setGonggaoTitle(String gonggaoTitle)
	{
		this.gonggaoTitle = gonggaoTitle;
	}

	@Column(name = "gonggao_content", length = 1000)
	public String getGonggaoContent()
	{
		return gonggaoContent;
	}

	public void setGonggaoContent(String gonggaoContent)
	{
		this.gonggaoContent = gonggaoContent;
	}

	@Column(name = "gonggao_data", length = 20)
	public String getGonggaoData()
	{
		return gonggaoData;
	}

	public void setGonggaoData(String gonggaoData)
	{
		this.gonggaoData = gonggaoData;
	}
}