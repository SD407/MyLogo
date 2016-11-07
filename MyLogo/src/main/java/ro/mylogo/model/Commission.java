package ro.mylogo.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

//TODO dao, services and all that

@Entity
@Table(name="COMMISSIONS")
public class Commission implements Serializable{

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@NotEmpty
	@Column(name="ORDER_DETAILS", unique=true, nullable=false)
	private String orderDetails;
	
	@NotEmpty
	@Column(name="ORDER_STATUS", unique=true, nullable=false)
	private boolean orderStatus;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "USERS_USER_COMMISSION", 
             joinColumns = { @JoinColumn(name = "USER_ID") }, 
             inverseJoinColumns = { @JoinColumn(name = "USER_COMMISSION_ID") })
	private Set<Commission> userCommissions = new HashSet<Commission>();

	/**
	 * @return the id to get
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * @return the orderDetails to get
	 */
	public String getOrderDetails() {
		return orderDetails;
	}

	/**
	 * @param orderDetails the orderDetails to set
	 */
	public void setOrderDetails(String orderDetails) {
		this.orderDetails = orderDetails;
	}

	/**
	 * @return the orderStatus to get
	 */
	public boolean isOrderStatus() {
		return orderStatus;
	}

	/**
	 * @param orderStatus the orderStatus to set
	 */
	public void setOrderStatus(boolean orderStatus) {
		this.orderStatus = orderStatus;
	}

	/**
	 * @return the userCommissions to get
	 */
	public Set<Commission> getUserCommissions() {
		return userCommissions;
	}

	/**
	 * @param userCommissions the userCommissions to set
	 */
	public void setUserCommissions(Set<Commission> userCommissions) {
		this.userCommissions = userCommissions;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((orderDetails == null) ? 0 : orderDetails.hashCode());
		result = prime * result + (orderStatus ? 1231 : 1237);
		result = prime * result + ((userCommissions == null) ? 0 : userCommissions.hashCode());
		return result;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Commission other = (Commission) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (orderDetails == null) {
			if (other.orderDetails != null)
				return false;
		} else if (!orderDetails.equals(other.orderDetails))
			return false;
		if (orderStatus != other.orderStatus)
			return false;
		if (userCommissions == null) {
			if (other.userCommissions != null)
				return false;
		} else if (!userCommissions.equals(other.userCommissions))
			return false;
		return true;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Commission [id=" + id + ", orderDetails=" + orderDetails + ", orderStatus=" + orderStatus
				+ ", userCommissions=" + userCommissions + "]";
	}

}
