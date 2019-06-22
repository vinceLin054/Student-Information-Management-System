package system.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import system.dao.ClazzDao;
import system.domain.Clazz;

@Service
public class ClazzService {

	@Autowired
	private ClazzDao clazzDao;
	
	public List<Clazz> getAll(){
		return clazzDao.getAll();
	}
	
	public Clazz getById(String id) {
		return clazzDao.getById(id);
	}
	
	public void save(Clazz clazz) {
		clazzDao.save(clazz);
	}
	
	public void update(Clazz clazz) {
		clazzDao.update(clazz);
	}
	
	public void delete(String id) {
		clazzDao.delete(id);
	}
}
