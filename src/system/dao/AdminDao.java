package system.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import system.domain.Admin;

@Repository
public class AdminDao extends HibernateDaoSupport {

	public Admin getByNamePassword(String name, String password) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Admin.class);
		criteria.add(Restrictions.eq("adminName", name));
		criteria.add(Restrictions.eq("adminPassword", password));
		List<Admin> list = (List<Admin>) getHibernateTemplate().findByCriteria(criteria);
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Resource(name = "sessionFactory")
	private void setMySessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

}
