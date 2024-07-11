package com.assessment.project.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.assessment.project.dao.Car;
import com.assessment.project.dao.CarBid;

@Service
public interface BidService {
	public CarBid saveBid(CarBid carBid);
	public List<CarBid> listAll();
	public List<CarBid> listBidInfo(Car car);
}
