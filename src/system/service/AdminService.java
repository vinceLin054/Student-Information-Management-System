package system.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import system.dao.AdminDao;
import system.domain.Admin;
@Service
public class AdminService {
	
	@Autowired
	private AdminDao adminDao;
	
	public Admin getByNamePassword(String name,String password) {
		return adminDao.getByNamePassword(name,password);
	}
	
}
