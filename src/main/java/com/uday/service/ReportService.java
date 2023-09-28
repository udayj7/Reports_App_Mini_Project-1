package com.uday.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.uday.entity.CitizenPlan;
import com.uday.request.SearchRequest;

public interface ReportService {

	// Abstract Methods
	public List<String> getPlanName();

	public List<String> getPlanStatuses();

	public List<CitizenPlan> search(SearchRequest request);

	public boolean exportExcel(HttpServletResponse response) throws Exception;

	public boolean pdfExport(HttpServletResponse response) throws Exception;

}
