package com.mkproducts.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.mkproducts.project.model.TemporaryCustomer;

public interface TemporaryCustomerRepository extends JpaRepository<TemporaryCustomer, Integer> {
    TemporaryCustomer findByEmail(String email);
    void deleteByEmail(String email);
}
