package com.uday.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.uday.entity.CitizenPlan;

public interface CitizenPlanRepository extends JpaRepository<CitizenPlan, Integer> {

	// DropDown
	@Query("select distinct (planName) from CitizenPlan")
	public List<String> getPlanNames();

	// DropDown
	@Query("select distinct (planStatus) from CitizenPlan")
	public List<String> getPlanStauts();

}
