package com.mkproducts.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.mkproducts.project.model.Customer;

@Repository
public interface CustomerRepository extends JpaRepository<Customer,Integer>
{
	
	@Query("select c from Customer c where c.email=?1 and c.password=?2 ")
	public Customer checkCustomerLogin(String email, String password);

}