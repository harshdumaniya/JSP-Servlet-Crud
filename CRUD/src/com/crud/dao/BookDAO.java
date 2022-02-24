package com.crud.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.crud.util.*;
import com.crud.model.Book;

public class BookDAO extends BookQuery {

	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultset = null;

	public void saveBook(Book book) throws SQLException {
		System.out.println("INSERT_BOOK");
		try (Connection connection = DatabaseConnection.connection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BOOK)) {
			preparedStatement.setString(1, book.getBookName());
			preparedStatement.setString(2, book.getBookAuthor());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			if (connection != null) {
				connection.close();
			}
		}
	}

	public Book selectBook(int id) throws SQLException {
		Book book = null;
		try (Connection connection = DatabaseConnection.connection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOK_BY_ID)) {
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				String bookName = resultSet.getString("name");
				String bookAuthor = resultSet.getString("author");
				book = new Book(id, bookName, bookAuthor);
			} 
		} catch (SQLException e) {
			System.out.println(e);
		} finally {
			if (resultset != null) {
				resultset.close();
			}
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			if (connection != null) {
				connection.close();
			}
		}
		return book;
	}

	public List<Book> selectAllBook() throws SQLException {
		List<Book> bookList = new ArrayList<>();
		try (Connection connection = DatabaseConnection.connection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BOOKS)) {
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				String bookName = resultSet.getString("name");
				String bookAuthor = resultSet.getString("author");
				bookList.add(new Book(id, bookName, bookAuthor));
			}
		} catch (SQLException e) {
			System.out.println(e);
		} finally {
			if (resultset != null) {
				resultset.close();
			}
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			if (connection != null) {
				connection.close();
			}
		}
		return bookList;
	}

	public boolean deleteBook(int id) throws SQLException {
		boolean deleted;
		try (Connection connection = DatabaseConnection.connection();
				PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BOOK)) {
			preparedStatement.setInt(1, id);
			deleted = preparedStatement.executeUpdate() > 0;
		} finally {
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			if (connection != null) {
				connection.close();
			}
		}
		return deleted;
	}

}