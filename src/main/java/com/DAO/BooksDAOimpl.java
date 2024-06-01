package com.DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.entity.BookDtls;

public class BooksDAOimpl implements BooksDAO {
	private Connection conn;

	public BooksDAOimpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addBooks(BookDtls b) {
		boolean f = false;
		try {
			String sql = "insert into book(bookname,author,price,bookCategory,status,photo,useremail) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhotoname());
			ps.setString(7, b.getUseremail());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public List<BookDtls> getAllBooks() {
		// TODO Auto-generated method stub
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {

			String sql = "select*from book";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDtls(); // Instantiate a new BookDtls object for each iteration

				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setUseremail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BookDtls getBookById(int id) {
		// TODO Auto-generated method stub
		BookDtls b = null;

		try {
			String sql = "Select* from book where bookid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id); // Set the value for the parameter

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDtls();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setUseremail(rs.getString(8));

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return b;
	}

	@Override
	public boolean updateEditBooks(BookDtls b) {
		boolean f = false;
		try {
			String sql = "update book set bookname=?,author=?,price=?,status=? where bookid=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookid());

			int i = ps.executeUpdate();
			if (i == 1) {

				f = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;

	}

	@Override
	public boolean deleteBooks(int id) {
		boolean f = false;
		try {

			String sql = "delete from book where bookid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return f;
	}
	@Override
	public boolean deleteAllOldBooksByUser(String useremail) {
	    boolean f = false;
	    try {
	        String sql = "DELETE FROM book WHERE  bookCategory = 'old' AND useremail=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1,useremail);
	        int rowsAffected = ps.executeUpdate();
	        if (rowsAffected > 0) {
	            f = true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return f;
	}

	@Override
	public List<BookDtls> getNewBook() {
		// TODO Auto-generated method stub
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;

		try {
			String sql = "select*from book  where bookCategory=? and status=? order by bookid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDtls();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setUseremail(rs.getString(8));

				list.add(b);
				i++;

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getRecentBooks() {
		// TODO Auto-generated method stub
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;

		try {
			String sql = "select*from book  where status=? order by bookid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDtls();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setUseremail(rs.getString(8));

				list.add(b);
				i++;

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getOldBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;

		try {
			String sql = "select*from book  where bookCategory=? and status=? order by bookid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDtls();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setUseremail(rs.getString(8));

				list.add(b);
				i++;

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllRecentBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;

		try {
			String sql = "select*from book  where status=? order by bookid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new BookDtls();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setUseremail(rs.getString(8));

				list.add(b);

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllNewBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;

		try {
			String sql = "select*from book  where bookCategory=? and status=? order by bookid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDtls();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setUseremail(rs.getString(8));

				list.add(b);

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllOldBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;

		try {
			String sql = "select*from book  where bookCategory=? and status=? order by bookid DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next()) {
				b = new BookDtls();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setUseremail(rs.getString(8));

				list.add(b);

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getBookByOld(String useremail, String cat) {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "select*from book where useremail=? and bookCategory=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, useremail);
			ps.setString(2, cat);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDtls();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setUseremail(rs.getString(8));

				list.add(b);

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean OldBookDelete(String useremail, String cat,int id) {
		boolean f = false;
		try {

			String sql="delete from book where useremail=? and bookCategory=? and bookid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, useremail);
			ps.setString(2, cat);
			ps.setInt(3, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookDtls> getBookBySearch(String ch) {

		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "select*from book where bookname like? or author like ? or bookCategory like? and status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDtls();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoname(rs.getString(7));
				b.setUseremail(rs.getString(8));

				list.add(b);

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
		
		
	}

	

}
