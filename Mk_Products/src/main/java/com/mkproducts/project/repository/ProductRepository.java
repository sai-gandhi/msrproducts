package com.mkproducts.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mkproducts.project.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer>{

}
