package com.assessment.project.repository;

import java.util.List;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.assessment.project.dao.Car;
import com.assessment.project.dao.CarBid;

@Repository
public interface BidRepository extends JpaRepository<CarBid, Long>{

	@Query("SELECT b FROM CarBid b WHERE b.carId in :carId")
	List<CarBid> findBycar(@Param("carId") Car car);
}
