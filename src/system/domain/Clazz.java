package system.domain;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="clazz")
public class Clazz {
	
	@Id
	@GeneratedValue(generator = "paymentableGenerator")    
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
	private String classId;
	
	@Column
	private String className;
	
	@OneToMany(fetch=FetchType.LAZY,mappedBy="clazz")
	Set<Student> students =new HashSet<Student>();

	public String getClassId() {
		return classId;
	}

	public String getClassName() {
		return className;
	}

	public Set<Student> getStudents() {
		return students;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public void setStudents(Set<Student> students) {
		this.students = students;
	}
}
