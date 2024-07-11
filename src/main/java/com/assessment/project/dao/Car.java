package com.assessment.project.dao;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "car")
public class Car {

	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private Long carId;
	@NotNull
	@Column(name = "car_name")
	private String carName;
	@NotNull
	@Column(name = "car_make")
	private String carMake;
	@NotNull
	@Column(name = "car_model")
	private String carModel;
	@NotNull
	@Column(name = "car_registration")
	private String carRegistration;
	@NotNull
	@Column(name = "car_price")
	private String carPrice;
	@Column(name = "car_image")
	private String carImage;
	@Column(name = "user_name")
	private String userName;
	public Long getCarId() {
		return carId;
	}
	public void setCarId(Long carId) {
		this.carId = carId;
	}
	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public String getCarMake() {
		return carMake;
	}
	public void setCarMake(String carMake) {
		this.carMake = carMake;
	}
	public String getCarModel() {
		return carModel;
	}
	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}
	public String getCarRegistration() {
		return carRegistration;
	}
	public void setCarRegistration(String carRegistration) {
		this.carRegistration = carRegistration;
	}
	public String getCarPrice() {
		return carPrice;
	}
	public void setCarPrice(String carPrice) {
		this.carPrice = carPrice;
	}
	public String getCarImage() {
		return carImage;
	}
	public void setCarImage(String carImage) {
		this.carImage = carImage;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
}
