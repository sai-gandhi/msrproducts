package com.mkproducts.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mkproducts.project.model.Contactus;

@Repository
public interface ContactusRepository extends JpaRepository<Contactus, Integer>{

}
