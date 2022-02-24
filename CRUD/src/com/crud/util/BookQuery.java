package com.crud.util;

public class BookQuery {

	protected static final String INSERT_BOOK = "INSERT INTO book(name, author) VALUES (?, ?);";
	protected static final String SELECT_BOOK_BY_ID = "SELECT id, name, author FROM book WHERE id = ?;";
	protected static final String SELECT_ALL_BOOKS = "SELECT * FROM book;";
	protected static final String DELETE_BOOK = "DELETE FROM book WHERE id = ?;";

}