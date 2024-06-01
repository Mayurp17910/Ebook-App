package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book_Orders;

public class BookOrdersimpl implements BookOrdersDAO {

	private Connection conn;

	public BookOrdersimpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean saveOrders(List<Book_Orders> blist) {
		boolean f = false;
		try {

			String sql = "insert into orders(order_id,user_name,email,address,phone,book_name,author,price,payment) values(?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);

			for (Book_Orders b : blist) {
				ps.setString(1, b.getOrder_id());
				ps.setString(2, b.getUserName());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getFulladd());
				ps.setString(5, b.getPhno());
				ps.setString(6, b.getBookName());
				ps.setString(7, b.getAuthor());
				ps.setString(8, b.getPrice());
				ps.setString(9, b.getPayment());
				ps.addBatch();

			}

			int[] count = ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);

		} catch (Exception e) {
			e.printStackTrace();
			try {
				// Rollback if there's an exception
				conn.rollback();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}

		return f;
	}

	@Override
	public List<Book_Orders>getBook(String email) {
    List<Book_Orders> list=new ArrayList<Book_Orders>();
	Book_Orders o=null;
	try {
		String sql="select * from orders where email=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, email);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			o=new Book_Orders();
			o.setId(rs.getInt(1));
			o.setOrder_id(rs.getString(2));
			o.setUserName(rs.getString(3));
			o.setEmail(rs.getString(4));
			o.setFulladd(rs.getString(5));
			o.setPhno(rs.getString(6));
			o.setBookName(rs.getString(7));
			o.setAuthor(rs.getString(8));
			o.setPrice(rs.getString(9));
			o.setPayment(rs.getString(10));
			list.add(o);
		}
	} catch (Exception e) {
             e.printStackTrace();
             
	}
	return list;

}

	@Override
	public List<Book_Orders> getAllBookOrders() {
		List<Book_Orders> list=new ArrayList<Book_Orders>();
		Book_Orders o=null;
		try {
			String sql="select * from orders";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				o=new Book_Orders();
				o.setId(rs.getInt(1));
				o.setOrder_id(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setBookName(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPayment(rs.getString(10));
				list.add(o);
			}
		} catch (Exception e) {
	             e.printStackTrace();
	             
		}
		return list;
	}
	public boolean updateOrderStatus(String order_id, String orderstatus) {
	    boolean success = false;
	    try {
	        String sql = "UPDATE orders SET orderstatus = ? WHERE order_id = ?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, orderstatus);
	        ps.setString(2, order_id);
	        int rowsAffected = ps.executeUpdate();
	        if (rowsAffected > 0) {
	            success = true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return success;
	}

	public String getOrderStatus(String orderId) {
	    String status = null;
	    try {
	        String sql = "SELECT orderstatus FROM orders WHERE order_id = ?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, orderId);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            status = rs.getString("orderstatus");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return status;
	}


	
}