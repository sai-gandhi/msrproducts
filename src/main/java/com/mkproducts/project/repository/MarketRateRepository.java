package com.mkproducts.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mkproducts.project.model.MarketRate;

@Repository
public interface MarketRateRepository extends JpaRepository<MarketRate, Integer> {

}
