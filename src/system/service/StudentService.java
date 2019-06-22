package system.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import system.dao.StudentDao;
import system.domain.Student;

@Service
public class StudentService {

	@Autowired
	private StudentDao studentDao;
	
	public List<Student> getAll() {
		return studentDao.getAll();
	}
	
	public Student getById(String id){
		return studentDao.getById(id);
	}
	
	public List<Student> getByClassId(String classId){
		return studentDao.getByClassId(classId);
	}
	
	public void save(Student student) {
		studentDao.save(student);
	}
	
	public void update(Student student) {
		studentDao.update(student);
	}
	
	public void delete(String id) {
		studentDao.delete(id);
	}
	
}
