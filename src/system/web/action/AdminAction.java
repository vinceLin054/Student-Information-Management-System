package system.web.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import system.domain.Admin;
import system.service.AdminService;

@Controller()
@Scope(value = "prototype")
public class AdminAction extends ActionSupport implements ModelDriven<Admin>{
	
	private Admin admin=new Admin();
	@Autowired
	private AdminService adminService;

	@Override
	public Admin getModel() {
		return admin;
	}
	
	public String login() {
		Admin getAdmin = adminService.getByNamePassword(admin.getAdminName(),admin.getAdminPassword());
		if(getAdmin!=null) {
			ActionContext.getContext().getSession().put("admin",getAdmin);
			return "toClassList";
		}
		else {
			ActionContext.getContext().put("message","账号或密码错误");
			return "index";
		}
	}
	
	public String logout() {
		ActionContext.getContext().getSession().remove("admin");
		return "index";
	}
	
}
