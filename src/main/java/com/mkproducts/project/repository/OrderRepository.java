package com.mkproducts.project.repository;
import com.mkproducts.project.model.Customer;
import com.mkproducts.project.model.Order;
import com.mkproducts.project.model.OrderStatus;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {
    List<Order> findByCustomer(Customer customer);
    List<Order> findByStatus(OrderStatus status);
    Order findByOrderId(String orderId);

    

}

