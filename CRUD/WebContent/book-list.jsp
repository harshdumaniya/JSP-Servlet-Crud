<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Book List</title>
		<style type="text/css">
			#book {
				font-family: Arial, Helvetica, sans-serif;
				border-collapse: collapse;
				width: 100%;
			}
			#book td, #book th {
				border: 1px solid #black;
				padding: 8px;
			}
			#book th {
				padding-top: 12px;
				padding-bottom: 12px;
				text-align: left;
				background-color: grey;
				color: black;
			}
			a:link, a:visited {
				background-color: #660033;
				color: white;
				padding: 7px 9px;
				text-align: center;
				text-decoration: none;
				display: inline-block;
			}
			body {
				background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
				background-size: 400% 400%;
				animation: gradient 15s ease infinite;
				height: 100vh;
			}
			@keyframes gradient {
				0% {
					background-position: 0% 50%;
				}
				50% {
					background-position: 100% 50%;
				}
				100% {
					background-position: 0% 50%;
				}
			}
		</style>
	</head>
	<body>
		<div>
			<a href="<%=request.getContextPath()%>/add">Add new book</a>
			<table border="2" id="book">
				<thead>
					<tr>
						<th>Id</th>
						<th>Book Name</th>
						<th>Author Name</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="book" items="${bookList}">
						<tr>
							<td><c:out value="${book.id}" /></td>
							<td><c:out value="${book.bookName}" /></td>
							<td><c:out value="${book.bookAuthor}" /></td>
							<td>
								<a href="edit?id=<c:out value='${book.id}' />">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="delete?id=<c:out value='${book.id}' />">Delete</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</body>
</html>