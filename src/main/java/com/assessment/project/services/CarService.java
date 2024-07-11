package com.assessment.project.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.assessment.project.dao.Car;

@Service
public interface CarService {
	public Car saveCar(Car car);
	public List<Car> viewCars();
	public Car getCarById(Long carId);
	public void deleteCar(Long carId);
	public List<Car> searchCarByName(String keyword);
}