package system.web.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import system.domain.Clazz;
import system.service.ClazzService;

@Controller
public class ClazzAction extends ActionSupport implements ModelDriven<Clazz>{
	
	@Autowired
	private ClazzService clazzService;
	
	private Clazz clazz=new Clazz();
	
	public String list() throws Exception{
		List<Clazz> list = clazzService.getAll();
		ActionContext.getContext().put("clazzList",list);
		return "class";
	}
	
	public String save() throws Exception{
		clazzService.save(clazz);
		return "toList";
	}
	
	public String delete() throws Exception{
		clazzService.delete(clazz.getClassId());;
		return "toList";
	}
	
	public String update() throws Exception{
		clazzService.update(clazz);;
		return "toList";
	}
	
	public String toStudent() throws Exception{
		List<Clazz> list = clazzService.getAll();
		ActionContext.getContext().put("clazzList",list);
		return "student";
	}
	
	@Override
	public Clazz getModel() {
		return clazz;
	}
	
}
