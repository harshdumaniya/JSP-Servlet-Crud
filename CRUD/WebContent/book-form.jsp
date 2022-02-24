<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Add/Update Form</title>
		<style type="text/css">
			body {
				font-family: sans-serif;
				background: linear-gradient(-45deg, red, #243b55);
			}
			.box {
				position: absolute;
				top: 50%;
				left: 50%;
				width: 500px;
				padding: 50px;
				transform: translate(-50%, -50%);
				background: rgba(0, 0, 0, .5);
				box-sizing: border-box;
				box-shadow: 0 15px 25px rgba(0, 0, 0, .6);
				border-radius: 10px;
			}
			.user-box {
				position: relative;
			}
			.user-box input {
				width: 90%;
				padding: 10px 0;
				font-size: 16px;
				color: #fff;
				margin-bottom: 30px;
				border: none;
				border-bottom: 1px solid #fff;
				outline: none;
				background: transparent;
			}
			.user-box label {
				top: 0;
				left: 0;
				padding: 10px 0;
				font-size: 16px;
				color: #fff;
				pointer-events: none;
				transition: .5s;
			}
		</style>
	</head>
	<body>
		<div class="box">
			<form action="save" method="post">
				<div class="user-box">
					<label>Id</label>
					<br>
						<input type="number" value="<c:out value='${book.id}' />" name="id" required="required">
					<br>
					<label>Book Name</label> 
						<input type="text" value="<c:out value='${book.bookName}' />" name="name" required="required">
					<br>
					<label>Book Author</label>
						<input type="text" value="<c:out value='${book.bookAuthor}' />"name="author" required="required">
					<br>
					<button type="submit">Save</button>
				</div>
			</form>
		</div>
	</body>
</html>