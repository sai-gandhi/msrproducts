package com.mkproducts.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mkproducts.project.model.Feedback;

public interface FeedbackRepository extends JpaRepository<Feedback, Integer> {

}
