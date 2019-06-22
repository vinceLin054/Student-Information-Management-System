package system.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="student")
public class Student {
	
	@Id
	@GeneratedValue(generator = "paymentableGenerator")    
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")  
	private String studentId;
	
	@Column
	private String studentNo; 
	
	@Column
	private String studentName; 
	
	@Column
	private String studentSex; 
	
	@Column
	private String studentPhone; 
	
	@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="classId")
	private Clazz clazz;
	
	public String getStudentNo() {
		return studentNo;
	}
	public String getStudentName() {
		return studentName;
	}
	public String getStudentSex() {
		return studentSex;
	}
	public String getStudentPhone() {
		return studentPhone;
	}
	public Clazz getClazz() {
		return clazz;
	}
	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public void setStudentSex(String studentSex) {
		this.studentSex = studentSex;
	}
	public void setStudentPhone(String studentPhone) {
		this.studentPhone = studentPhone;
	}
	public void setClazz(Clazz clazz) {
		this.clazz = clazz;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	
}
