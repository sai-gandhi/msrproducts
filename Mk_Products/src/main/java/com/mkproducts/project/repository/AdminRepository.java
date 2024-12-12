package com.mkproducts.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.mkproducts.project.model.Admin;

@Repository
public interface AdminRepository extends JpaRepository<Admin, String> {

	@Query("select a from Admin a where a.name=?1 and a.password=?2")
	Admin checkAdminLogin(String name, String password);

}
