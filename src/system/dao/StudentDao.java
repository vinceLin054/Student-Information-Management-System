package system.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import system.domain.Student;

@Repository
public class StudentDao extends HibernateDaoSupport{
	public void save(Student student) {
		getHibernateTemplate().save(student);
	}
	
	public List<Student> getAll() {
		DetachedCriteria criteria=DetachedCriteria.forClass(Student.class);
		return (List<Student>) getHibernateTemplate().findByCriteria(criteria);
	}
	
	public Student getById(String id){
		return getHibernateTemplate().get(Student.class,id);
	}
	
	public List<Student> getByClassId(String classId){
		DetachedCriteria criteria=DetachedCriteria.forClass(Student.class);
		criteria.add(Restrictions.eq("clazz.classId",classId));
		return (List<Student>) getHibernateTemplate().findByCriteria(criteria);
	}
	
	public void update(Student student) {
		getHibernateTemplate().update(student);
	}
	
	public void delete(String id) {
		Student student = getById(id);
		getHibernateTemplate().delete(student);
	}
	
	@Resource(name = "sessionFactory")
	private void setMySessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
}
