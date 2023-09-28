package com.uday.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.uday.entity.CitizenPlan;
import com.uday.request.SearchRequest;
import com.uday.service.ReportService;

@Controller
public class ReportController {

	@Autowired
	private ReportService service;

	@PostMapping("/search")
//	public String handleSearch(@ModelAttribute("search")SearchRequest request, Model model) {
//		System.out.println(request);
//		List<CitizenPlan> plans = service.search(request);

	public String handleSearch(@ModelAttribute("search") SearchRequest search, Model model) {

		List<CitizenPlan> plans = service.search(search);
		model.addAttribute("plans", plans);
		init(model);
		return "index";
	}

	/**
	 * This method is used to load index page
	 * 
	 * @param model
	 * @return String
	 */
	@GetMapping("/")
	public String indexPage(Model model) {
//		SearchRequest serachObject = new SearchRequest();
//		model.addAttribute("search", serachObject);
		model.addAttribute("search", new SearchRequest());
		init(model);

		return "index";
	}

	private void init(Model model) {
//		model.addAttribute("search", new SearchRequest());
		model.addAttribute("names", service.getPlanName());
		model.addAttribute("status", service.getPlanStatuses());
	}

	@GetMapping("/excel")
	public void excelExport(HttpServletResponse response) throws Exception {
		response.setContentType("application/octet-stream");
		response.addHeader("Content-Disposition", "attachment; filename=plans.xls");
		service.exportExcel(response);
	}

	@GetMapping("/pdf")
	public void excelPdf(HttpServletResponse response) throws Exception {
		response.setContentType("application/octet-stream");
		response.addHeader("Content-Disposition", "attachment; filename=plans.pdf");
		service.pdfExport(response);
	}

}
