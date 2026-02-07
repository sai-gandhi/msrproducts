package com.mkproducts.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


import com.mkproducts.project.model.CropAdvisory;

@Repository
public interface CropAdvisoryRepository extends JpaRepository<CropAdvisory, Long> {
	List<CropAdvisory> findBySeasonIgnoreCase(String season);

    List<CropAdvisory> findByCropNameIgnoreCase(String cropName);
}

