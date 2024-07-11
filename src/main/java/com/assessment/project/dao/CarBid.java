package com.assessment.project.dao;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="car_bidding")
public class CarBid {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long bidCarId;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="carId")
	private Car car;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="userId")
	private Users user;
	@Column(name="bidder_name")
	private String bidderName;
	@Column(name="bidding_price")
	private String bidderPrice;
	@Column(name="bidding_date")
	private Date bidDateTime;
	
	
	public Long getBidCarId() {
		return bidCarId;
	}
	public void setBidCarId(Long bidCarId) {
		this.bidCarId = bidCarId;
	}
	public Car getCar() {
		return car;
	}
	public void setCar(Car car) {
		this.car = car;
	}
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	public String getBidderName() {
		return bidderName;
	}
	public void setBidderName(String bidderName) {
		this.bidderName = bidderName;
	}
	public String getBidderPrice() {
		return bidderPrice;
	}
	public void setBidderPrice(String bidderPrice) {
		this.bidderPrice = bidderPrice;
	}
	public Date getBidDateTime() {
		return bidDateTime;
	}
	public void setBidDateTime(Date bidDateTime) {
		this.bidDateTime = bidDateTime;
	}
	
	
}
