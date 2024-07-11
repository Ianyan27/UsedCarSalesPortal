package com.assessment.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.assessment.project.dao.Car;
import com.assessment.project.repository.CarRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class CarServiceImplementation implements CarService{

	@Autowired
	private CarRepository carRepo;
	@Override
	public Car saveCar(Car car) {
		return carRepo.save(car);
	}

	@Override
	public List<Car> viewCars() {
		return carRepo.findAll();
	}

	@SuppressWarnings("deprecation")
	@Override
	public Car getCarById(Long carId) {
		return carRepo.getById(carId);
	}

	@Override
	public void deleteCar(Long carId) {
		carRepo.deleteById(carId);
		
	}

	@Override
	public List<Car> searchCarByName(String keyword) {
		return carRepo.searchCarsByName(keyword);
	}
	
}
