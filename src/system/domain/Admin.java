package system.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="admin")
public class Admin {
	
	@Id
	@GeneratedValue(generator = "paymentableGenerator")    
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")  
	private String adminId;
	
	@Column
	private String adminName;
	
	@Column
	private String adminPassword;
	
	public String getAdminId() {
		return adminId;
	}
	public String getAdminName() {
		return adminName;
	}
	public String getAdminPassword() {
		return adminPassword;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
	
}
