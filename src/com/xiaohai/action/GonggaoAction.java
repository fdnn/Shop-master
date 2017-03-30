package com.xiaohai.action;

import java.util.Date;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.xiaohai.entity.Gonggao;
import com.xiaohai.service.GonggaoService;

@Controller
public class GonggaoAction extends ActionSupport
{

	private static final long serialVersionUID = 1L;
	
	private int gonggaoId;
	private String gonggaoTitle;
	private String gonggaoContent;
	private String gonggaoData;
	
	private String message;
	private String path;
	
	@Resource
	private GonggaoService gonggaoService;
	
	/*
	 * 公告添加
	 */
	public String gonggaoAdd()
	{
		Gonggao gonggao=new Gonggao();
		gonggao.setGonggaoTitle(gonggaoTitle);
		gonggao.setGonggaoContent(gonggaoContent);
		gonggao.setGonggaoData(new Date().toLocaleString());
		gonggaoService.saveGonggao(gonggao);
		this.setMessage("公告添加完毕");
		this.setPath("gonggaoMana.action");
		return "succeed";
	}
	
	/*
	 * 公告管理
	 */
	public String gonggaoMana()
	{
		List gonggaoList =gonggaoService.findAllList();
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("gonggaoList", gonggaoList);
		return SUCCESS;
	}
	
	/*
	 * 公告删除
	 */
	public String gonggaoDel()
	{
		Gonggao gonggao=gonggaoService.findGonggaoById(gonggaoId);
		gonggaoService.deleteGonggao(gonggao);
		this.setMessage("公告成功删除");
		this.setPath("gonggaoMana.action");
		return "succeed";
	}
	
	/*
	 * 公告内容
	 */
	public String gonggaoDetail()
	{
		Gonggao gonggao=gonggaoService.findGonggaoById(gonggaoId);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("gonggao", gonggao);
		return SUCCESS;
	}
	
	public String gonggaoAll()
	{
        Map request=(Map)ServletActionContext.getContext().get("request");
		List gonggaoList=gonggaoService.findAllList();
		if(gonggaoList.size()>5)
		{
			//面板只留5条公告
			gonggaoList=gonggaoList.subList(0, 5);
		}
		request.put("gonggaoList", gonggaoList);
		return SUCCESS;
	}
	
	public String getGonggaoContent()
	{
		return gonggaoContent;
	}

	public void setGonggaoContent(String gonggaoContent)
	{
		this.gonggaoContent = gonggaoContent;
	}

	public String getGonggaoData()
	{
		return gonggaoData;
	}

	public void setGonggaoData(String gonggaoData)
	{
		this.gonggaoData = gonggaoData;
	}

	public int getGonggaoId()
	{
		return gonggaoId;
	}

	public void setGonggaoId(int gonggaoId)
	{
		this.gonggaoId = gonggaoId;
	}

	public String getGonggaoTitle()
	{
		return gonggaoTitle;
	}

	public void setGonggaoTitle(String gonggaoTitle)
	{
		this.gonggaoTitle = gonggaoTitle;
	}

	public String getMessage()
	{
		return message;
	}

	public void setMessage(String message)
	{
		this.message = message;
	}

	public String getPath()
	{
		return path;
	}

	public void setPath(String path)
	{
		this.path = path;
	}
	
}
