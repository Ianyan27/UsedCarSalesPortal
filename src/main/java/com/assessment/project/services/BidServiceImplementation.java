package com.assessment.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.assessment.project.dao.Car;
import com.assessment.project.dao.CarBid;
import com.assessment.project.repository.BidRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class BidServiceImplementation implements BidService{

	@Autowired
	private BidRepository bidRepo;
	@Override
	public CarBid saveBid(CarBid carBid) {
		return bidRepo.save(carBid);
	}

	@Override
	public List<CarBid> listAll() {
		return (List<CarBid>) bidRepo.findAll();
	}

	@Override
	public List<CarBid> listBidInfo(Car car) {
		return (List<CarBid>) bidRepo.findBycar(car);
	}

}
