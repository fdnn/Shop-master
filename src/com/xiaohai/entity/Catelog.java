package com.xiaohai.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="t_catelog")
public class Catelog implements java.io.Serializable
{
	private Integer catelogId;
	private String catelogName;
	private String catelogMiaoshu;
	//һ�Զ�
	private Set<Goods> goods;
	
	public Catelog(){}
	
	@Id
	@GenericGenerator(name = "generator", strategy = "native")
	@GeneratedValue(generator = "generator")
	@Column(name = "catelog_id", length=11)
	public Integer getCatelogId() {
		return catelogId;
	}

	public void setCatelogId(Integer catelogId) {
		this.catelogId = catelogId;
	}

	@Column(name = "catelog_name", length = 100)
	public String getCatelogName() {
		return catelogName;
	}

	public void setCatelogName(String catelogName) {
		this.catelogName = catelogName;
	}

	@Column(name = "catelog_miaoshu", length = 1000)
	public String getCatelogMiaoshu() {
		return catelogMiaoshu;
	}

	public void setCatelogMiaoshu(String catelogMiaoshu) {
		this.catelogMiaoshu = catelogMiaoshu;
	}
	//Catelog����м������������Լ���ɾ�����޸�
	//��fetch�������ó�ֱ�ӻ�ȡ
	@OneToMany(cascade=CascadeType.ALL,mappedBy="goodsCatelogId",fetch=FetchType.EAGER)   
	public Set<Goods> getGoods() {
		return goods;
	}

	public void setGoods(Set<Goods> goods) {
		this.goods = goods;
	}
}