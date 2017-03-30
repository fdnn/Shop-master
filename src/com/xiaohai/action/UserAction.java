package com.xiaohai.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.xiaohai.entity.User;
import com.xiaohai.service.UserService;

public class UserAction extends ActionSupport
{
    private int userId;
	private String userName;
	private String userPw;
	private String userRealname;
	private String userAddress;
	private String userSex;
	private String userTel;
	private String userEmail;
	private String userQq;
	
	private String message;
	private String path;
	
	@Resource
	private UserService userService;
	
	/*
	 * 用户添加
	 */
	public String userAdd()
	{
		User user=new User();
		user.setUserName(userName);
		user.setUserPw(userPw);
		user.setUserRealname(userRealname);
		user.setUserAddress(userAddress);
		user.setUserSex(userSex);
		user.setUserTel(userTel);
		user.setUserEmail(userEmail);
		user.setUserQq(userQq);
		userService.saveUser(user);
		Map session= ServletActionContext.getContext().getSession();
		session.put("user", user);
		return "successAdd";
	}
	
	/*
	 * 用户更新
	 */
	public String userUpdate()
	{
		Map session= ServletActionContext.getContext().getSession();
		User user=(User)session.get("user");
		user.setUserName(userName);
		user.setUserPw(userPw);
		user.setUserRealname(userRealname);
		user.setUserAddress(userAddress);
		user.setUserSex(userSex);
		user.setUserTel(userTel);
		user.setUserEmail(userEmail);
		user.setUserQq(userQq);
		userService.updateUser(user);
		session.put("user", user);
		this.setMessage("信息修改成功");
		this.setPath("shopping.jsp");
		return "succeed";
	}
	
	/*
	 * 用户登录
	 */
	public String userLogin()
	{
		User user =new User();
		user.setUserName(userName);
		user.setUserPw(userPw);
		List<User> userList=userService.findUserByNameAndPassword(user);
		if(userList.size()==0)
		{
			this.setMessage("用户名或密码错误");
			this.setPath("shopping.jsp");
		}
		else
		{
			 Map session= ServletActionContext.getContext().getSession();
			 User currentUser = (User)userList.get(0);
			 session.put("user", currentUser);
			 
			 this.setMessage("成功登录");
			 this.setPath("shopping.jsp");
		}
		return "succeed";
	}

	/*
	 * 用户注册
	 */
	public String userReg()
	{
		User user=new User();
		user.setUserName(userName);
		user.setUserPw(userPw);
		user.setUserRealname(userRealname);
		user.setUserAddress(userAddress);
		user.setUserSex(userSex);
		user.setUserTel(userTel);
		user.setUserEmail(userEmail);
		user.setUserQq(userQq);
		userService.saveUser(user);
		
		return "success_close";
	}
	
	/*
	 * 用户退出
	 */
	public String userLogout()
	{
		Map session= ServletActionContext.getContext().getSession();
		session.remove("user");
		return SUCCESS;
	}
	
	/*
	 * 删除用户
	 */
	public String userDel()
	{
		User user=userService.findUserById(userId);
		userService.deleteUser(user);
		this.setMessage("删除成功");
		this.setPath("userMana.action");
		return "succeed";
	}
	
	
	public String userXinxi()
	{
		User user=userService.findUserById(userId);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("user", user);
		return SUCCESS;
	}
	
	public String userMana()
	{
		List userList=userService.findAllList();
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}
	
	


	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserRealname() {
		return userRealname;
	}

	public void setUserRealname(String userRealname) {
		this.userRealname = userRealname;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserQq() {
		return userQq;
	}

	public void setUserQq(String userQq) {
		this.userQq = userQq;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
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
