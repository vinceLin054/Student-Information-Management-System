package system.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import system.domain.Clazz;
@Repository
public class ClazzDao extends HibernateDaoSupport{
	
	public void save(Clazz clazz) {
		getHibernateTemplate().save(clazz);
	}
	
	public List<Clazz> getAll() {
		DetachedCriteria criteria=DetachedCriteria.forClass(Clazz.class);
		return (List<Clazz>) getHibernateTemplate().findByCriteria(criteria);
	}
	
	public Clazz getById(String id){
		return getHibernateTemplate().get(Clazz.class,id);
	}
	
	public void update(Clazz clazz) {
		getHibernateTemplate().update(clazz);
	}
	
	public void delete(String id) {
		Clazz clazz = getById(id);
		getHibernateTemplate().delete(clazz);
	}
	
	@Resource(name = "sessionFactory")
	private void setMySessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
}
