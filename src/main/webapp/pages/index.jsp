<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Report App</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
</head>
<body>

	<div class="container">
		<h3 class="pb-3 pt-3">Report Project App</h3>

		<form:form action="search" modelAttribute="search" method="POST">

			<table>
				<tr>
					<td>Plan Name:</td>
					<td><form:select path="planName">
							<form:option value="">
							-Select-
						</form:option>
							<form:options items="${names}" />

						</form:select></td>
					<td>Plan Status:</td>
					<td><form:select path="planStatus">
							<form:option value="">
							-Select-
						</form:option>
							<form:options items="${status}" />

						</form:select></td>

					<td>Gender:</td>
					<%-- 		<td><form:radiobutton path="gender" value="Male" /> Male <form:radiobutton
							path="gender" value="Fe-Male" /> Fe-male</td> --%>
					<td><form:select path="gender">
							<form:option value="">
							-Select-
						</form:option>
							<form:option value="Male">
							Male
						</form:option>
							<form:option value="Fe-Male">
							Fe-Male
						</form:option>
						</form:select></td>
				</tr>

				<tr>
					<td>Start Date:</td>
					<td><form:input path="startDate" type="date"
							date-date-format="mm-dd-yyyy" /></td>
					<td>End Date:</td>
					<td><form:input type="date" path="endDate" /></td>
				</tr>

				<tr>
					<td><a href="/" class="btn btn-secondary">Reset</a>
					<td><input type="submit" value="Search"
						class="btn btn-primary"></td>
				</tr>
			</table>

		</form:form>

		<hr />

		<table class="table table-striped table-hover">
			<thread>
			<tr>
				<th>Sl.No</th>
				<th>Holder Name</th>
				<th>Gender</th>
				<th>Plan Name</th>
				<th>Plan Status</th>
				<th>Start Date</th>
				<th>End Date</th>
			</tr>
			</thread>

			<tbody>
				<c:forEach items="${plans}" var="p" varStatus="index">
					<tr>
						<%-- <td>${p.citizenId}</td> --%>
						<td>${index.count}</td>
						<td>${p.citizenName}</td>
						<td>${p.gender}</td>
						<td>${p.planName}</td>
						<td>${p.planStatus}</td>
						<td>${p.planStartDate}</td>
						<td>${p.planEndDate}</td>
					</tr>
				</c:forEach>
				<c:if test="${empty plans}">

					<td colspan="8" style="text-align: center">No Records found</td>

				</c:if>

			</tbody>
		</table>
		<hr />

		Export : <a href="excel">Excel</a> <a href="pdf">Pdf</a>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>