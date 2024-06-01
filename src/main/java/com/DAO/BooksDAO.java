package com.DAO;

import java.util.List;

import com.entity.BookDtls;

public interface BooksDAO {
public boolean addBooks(BookDtls b);
public List<BookDtls> getAllBooks();

public BookDtls getBookById(int id);
public boolean updateEditBooks(BookDtls b);
public boolean deleteBooks(int id);
public boolean deleteAllOldBooksByUser(String useremail);
public List <BookDtls> getNewBook();
public List<BookDtls> getRecentBooks();
public List<BookDtls> getOldBooks();
public List<BookDtls>getAllRecentBooks();
public List<BookDtls>getAllNewBooks();
public List<BookDtls>getAllOldBooks();
public List<BookDtls>getBookByOld(String useremail,String cat);
public boolean OldBookDelete(String useremail, String cat,int id);
public List<BookDtls>getBookBySearch(String ch);


}