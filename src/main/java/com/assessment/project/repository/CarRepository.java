package com.assessment.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.assessment.project.dao.Car;

@Repository
public interface CarRepository extends JpaRepository<Car, Long>{

		@Query(value = "SELECT c FROM Car c WHERE c.carName LIKE '%' || :keyword || '%'")
		public List<Car> searchCarsByName(@Param("keyword") String keyword);
}
