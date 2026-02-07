package com.mkproducts.project.repository;

import com.mkproducts.project.model.Order;
import com.mkproducts.project.model.OrderItem;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderItemRepository extends JpaRepository<OrderItem, Integer> {

	List<OrderItem> findByOrder(Order order);
}