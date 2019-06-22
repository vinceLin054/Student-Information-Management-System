package system.web.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import system.domain.Student;
import system.domain.Student;
import system.service.StudentService;
@Controller
public class StudentAction extends ActionSupport implements ModelDriven<Student>{
	@Autowired
	private StudentService studentService;

	private Student student=new Student();
	
	@Override
	public Student getModel() {
		return student;
	}
	
	public String list() throws Exception{
		List<Student> list;
		if(student.getClazz()!=null && student.getClazz().getClassId()!=null && !student.getClazz().getClassId().equals("0")) {
			list=studentService.getByClassId(student.getClazz().getClassId());
			ActionContext.getContext().put("classId",student.getClazz().getClassId());
		}
		else {
			list = studentService.getAll();
		}
		ActionContext.getContext().put("studentList",list);
		return "clazzList";
	}
	
	public String save() throws Exception{
		studentService.save(student);
		return "toList";
	}
	
	public String delete() throws Exception{
		studentService.delete(student.getStudentId());;
		return "toList";
	}
	
	public String update() throws Exception{
		studentService.update(student);;
		return "toList";
	}
	
	public String toStudent() throws Exception{
		List<Student> list = studentService.getAll();
		ActionContext.getContext().put("studentList",list);
		return "student";
	}
	
}
