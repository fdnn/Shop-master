package com.xiaohai.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="t_goods")
public class Goods implements java.io.Serializable
{
	private Integer goodsId;
	//多对一
	private Catelog goodsCatelogId;
	//一对一
	private OrderItem goodsOrderItem;
	private String goodsName;
	private String goodsMiaoshu;
	private String goodsPic;
	private Integer goodsShichangjia;
	private Integer goodsTejia;
	private String goodsIsnottejia;
	private String goodsIsnottuijian;
	private int goodsKucun;
	
	@Id
	@GenericGenerator(name = "generator", strategy = "native")
	@GeneratedValue(generator = "generator")
	@Column(name = "goods_id", length=11)
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	
	@Column(name = "goods_name", length = 100)
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	
	@Column(name = "goods_miaoshu", length = 1000)
	public String getGoodsMiaoshu() {
		return goodsMiaoshu;
	}
	public void setGoodsMiaoshu(String goodsMiaoshu) {
		this.goodsMiaoshu = goodsMiaoshu;
	}
	
	@Column(name = "goods_pic", length = 1000)
	public String getGoodsPic() {
		return goodsPic;
	}
	public void setGoodsPic(String goodsPic) {
		this.goodsPic = goodsPic;
	}
	
	@Column(name = "goods_shichangjia", length = 100)
	public Integer getGoodsShichangjia() {
		return goodsShichangjia;
	}
	public void setGoodsShichangjia(Integer goodsShichangjia) {
		this.goodsShichangjia = goodsShichangjia;
	}
	
	@Column(name = "goods_tejia", length = 100)
	public Integer getGoodsTejia() {
		return goodsTejia;
	}
	public void setGoodsTejia(Integer goodsTejia) {
		this.goodsTejia = goodsTejia;
	}
	
	@Column(name = "goods_isnottejia", length = 100)
	public String getGoodsIsnottejia() {
		return goodsIsnottejia;
	}
	public void setGoodsIsnottejia(String goodsIsnottejia) {
		this.goodsIsnottejia = goodsIsnottejia;
	}
	
	@Column(name = "goods_isnottuijian", length = 100)
	public String getGoodsIsnottuijian() {
		return goodsIsnottuijian;
	}
	public void setGoodsIsnottuijian(String goodsIsnottuijian) {
		this.goodsIsnottuijian = goodsIsnottuijian;
	}

	@ManyToOne  
	@JoinColumn(name="goods_catelogId") //外键
	public Catelog getGoodsCatelogId() {
		return goodsCatelogId;
	}
	public void setGoodsCatelogId(Catelog goodsCatelogId) {
		this.goodsCatelogId = goodsCatelogId;
	}
	
	@OneToOne(mappedBy = "goods")
	public OrderItem getGoodsOrderItem() {
		return goodsOrderItem;
	}
	public void setGoodsOrderItem(OrderItem goodsOrderItem) {
		this.goodsOrderItem = goodsOrderItem;
	}
	@Column(name = "goods_kucun", length = 100)
	public int getGoodsKucun() {
		return goodsKucun;
	}
	public void setGoodsKucun(int goodsKucun) {
		this.goodsKucun = goodsKucun;
	}
}