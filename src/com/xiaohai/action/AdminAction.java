package com.xiaohai.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.xiaohai.entity.Admin;
import com.xiaohai.service.AdminService;

@Controller
public class AdminAction extends ActionSupport implements ServletRequestAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private HttpServletRequest request;

	@Resource
	private AdminService adminService;

	private Admin admin;
	private int userId;
	private String userName;
	private String userPw;
	
	private String message;
	private String path;
	private String error;

	public Admin getUser() {
		return admin;
	}

	public void setUser(Admin admin) {
		this.admin = admin;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
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

	public int getUserId()
	{
		return userId;
	}

	public void setUserId(int userId)
	{
		this.userId = userId;
	}

	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

	public String getUserPw()
	{
		return userPw;
	}

	public void setUserPw(String userPw)
	{
		this.userPw = userPw;
	}

	// 这里写的有点复杂，反正都一样的啦
	public String login() throws Exception {
		HttpSession session = request.getSession();
		Admin admin = new Admin();
		admin.setUserName(request.getParameter("userName"));
		admin.setUserPw(request.getParameter("password"));
		Admin currentUser = adminService.findUserByNameAndPassword(admin);
		if (currentUser != null) {
			session.setAttribute("currentUser", currentUser);
			return SUCCESS;
		} else {
			error = "用户名或者密码错误！";
			return ERROR;
		}
	}

	public String pwEdit() throws Exception {
		HttpSession session = request.getSession();
		Admin admin = (Admin)session.getAttribute("currentUser");
		admin.setUserPw(request.getParameter("userPw2"));
		adminService.updateUser(admin);
		session.setAttribute("admin", admin);
		this.setMessage("密码修改成功");
		this.setPath("admin/index/userinfo.jsp");
		return "succeed";
	}
	
	public String adminAdd()
	{
		Admin admin=new Admin();
		admin.setUserName(userName);
		admin.setUserPw(userPw);
		adminService.saveUser(admin);
		this.setMessage("添加成功");
		this.setPath("adminManage.action");
		return "succeed";
	}
	
	public String adminManage()
	{
		List<Admin> adminList=adminService.findAllList();
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("adminList", adminList);
		return SUCCESS;
	}
	
	public String logout(){
		request.getSession().removeAttribute("currentUser");
		return SUCCESS;
	}
	public String adminDel(){
		adminService.deleteUser(adminService.findUserById(userId));
		this.setMessage("删除成功");
		this.setPath("adminManage.action");
		return "succeed";
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
	}

}
