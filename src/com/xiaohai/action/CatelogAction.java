package com.xiaohai.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.xiaohai.entity.Catelog;
import com.xiaohai.entity.Goods;
import com.xiaohai.service.CatelogService;

@Controller
public class CatelogAction extends ActionSupport
{

	private static final long serialVersionUID = 1L;
	
	private int catelogId;
	private String catelogName;
	private String catelogMiaoshu;
	
	private String message;
	private String path;
	
	@Resource
	private CatelogService catelogService;
	
	/*
	 * ��Ʒ������
	 */
	public String catelogAdd()
	{
		Catelog catelog=new Catelog();
		catelog.setCatelogName(catelogName);
		catelog.setCatelogMiaoshu(catelogMiaoshu);
		catelogService.saveCatelog(catelog);
		this.setMessage("��Ʒ�����ӳɹ�");
		this.setPath("catelogMana.action");
		return "succeed";
	}
	
	/*
	 * ��Ʒ������
	 */
	public String catelogMana()
	{
		List catelogList =catelogService.findAllList();
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("catelogList", catelogList);
		return SUCCESS;
	}
	
	/*
	 * ��Ʒ���ɾ��
	 */
	public String catelogDel()
	{
		//'��������'����ҵ-Ҫ��-����ɾ������Ʒ
		/*List goodsList = catelogService.findGoods(catelogId);
		if(goodsList.size()>0)
		{
			this.setMessage("����ɾ��������µ���Ʒ");
			this.setPath("catelogMana.action");
		}
		else
		{
			Catelog catelog=catelogService.findCatelogById(catelogId);
			catelogService.deleteCatelog(catelog);
			this.setMessage("��Ʒ���ɹ�ɾ��");
			this.setPath("catelogMana.action");
		}
		return "succeed";*/
		//'���ݿ�'����ҵ-Ҫ��-����ɾ��
		Catelog catelog=catelogService.findCatelogById(catelogId);
		catelogService.deleteCatelog(catelog);
		this.setMessage("��Ʒ���ɹ�ɾ��");
		this.setPath("catelogMana.action");
		return "succeed";
	}
	
	/*
	 * ��Ʒ����б�
	 */
	public String catelogList(){
		List catelogList =catelogService.findAllList();
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("catelogList", catelogList);
		return SUCCESS;
	}
	
	public String goodsByCatelog()
	{
        Map request=(Map)ServletActionContext.getContext().get("request");
		Catelog catelog=catelogService.findCatelogById(catelogId);
		request.put("catelogName", catelog.getCatelogName());
		Set<Goods> goodsList = catelog.getGoods();
		request.put("goodsList", goodsList);
		return SUCCESS;
	}
	
	public int getCatelogId()
	{
		return catelogId;
	}

	public void setCatelogId(int catelogId)
	{
		this.catelogId = catelogId;
	}

	public String getCatelogName()
	{
		return catelogName;
	}

	public void setCatelogName(String catelogName)
	{
		this.catelogName = catelogName;
	}

	public String getCatelogMiaoshu() {
		return catelogMiaoshu;
	}

	public void setCatelogMiaoshu(String catelogMiaoshu) {
		this.catelogMiaoshu = catelogMiaoshu;
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
