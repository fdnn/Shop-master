package com.xiaohai.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="t_order")
public class Order implements java.io.Serializable
{
	private Integer orderId;
	private String orderBianhao;
	private String orderDate;
	private String orderZhuangtai;
	private String orderSonghuodizhi;
	private String orderFukuangfangshi;
	//订单总价格
	private int orderAmount=0;
	//一对多
	private Set<OrderItem> orderItem;
	//多对一
	private User orderUser;
	
	public Order(){}
	
	@Id
	@GenericGenerator(name = "generator", strategy = "native")
	@GeneratedValue(generator = "generator")
	@Column(name = "order_id", length=11)
	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	
	@Column(name = "order_bianhao", length = 100)
	public String getOrderBianhao() {
		return orderBianhao;
	}

	public void setOrderBianhao(String orderBianhao) {
		this.orderBianhao = orderBianhao;
	}

	@Column(name = "order_date", length = 100)
	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	@Column(name = "order_zhuangtai", length = 100)
	public String getOrderZhuangtai() {
		return orderZhuangtai;
	}

	public void setOrderZhuangtai(String orderZhuangtai) {
		this.orderZhuangtai = orderZhuangtai;
	}

	@Column(name = "order_songhuodizhi", length = 100)
	public String getOrderSonghuodizhi() {
		return orderSonghuodizhi;
	}

	public void setOrderSonghuodizhi(String orderSonghuodizhi) {
		this.orderSonghuodizhi = orderSonghuodizhi;
	}

	@Column(name = "order_fukuangfangshi", length = 100)
	public String getOrderFukuangfangshi() {
		return orderFukuangfangshi;
	}

	public void setOrderFukuangfangshi(String orderFukuangfangshi) {
		this.orderFukuangfangshi = orderFukuangfangshi;
	}

	@Column(name = "order_amount", length = 100)
	public int getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}

	@ManyToOne      
	@JoinColumn(name="order_userId") //外键
	public User getOrderUser() {
		return orderUser;
	}

	public void setOrderUser(User orderUser) {
		this.orderUser = orderUser;
	}

	@OneToMany(cascade=CascadeType.REMOVE,mappedBy="order",fetch=FetchType.EAGER)
	public Set<OrderItem> getOrderItem() {
		return orderItem;
	}

	public void setOrderItem(Set<OrderItem> orderItem) {
		this.orderItem = orderItem;
	}
}
	