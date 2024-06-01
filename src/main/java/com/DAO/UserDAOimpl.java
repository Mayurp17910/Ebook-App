package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;
import com.entity.User;

public class UserDAOimpl implements UserDAO {
	private Connection conn;
	private boolean f;

	public UserDAOimpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean userRegister(User us) {
		boolean f = false;
		try {
			String sql = "insert into user(name,email,phno,password) values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setString(4, us.getPassword());
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
	public User login(String email, String password) {
		// TODO Auto-generated method stub
		User us = null;
		try {
			String sql = "select*from user where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setPin(rs.getString(10));

			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return us;
	}

	@Override
	public boolean checkPassword(int id, String ps) {

		boolean f = false;
		try {
			String sql = "select * from user where id=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, ps);

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	@Override
	public boolean updateProfile(User us) {
		boolean f = false;
		try {
			String sql = "update user set name=?,email=?,phno=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setInt(4, us.getId());
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
	public boolean checkUser(String email, String phno) {
		boolean f = true;
		try {
			String sql = "select* from user where email=? or phno=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, phno);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}

	@Override
	public List<User> getAllUsers() {
		List<User> userlist = new ArrayList<>();

		try {
			String sql = "SELECT * FROM user";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPhno(rs.getString("phno"));

				user.setPassword(rs.getString("password"));
				userlist.add(user);
			}

		} catch (Exception e) {
			e.printStackTrace();
			// Handle or log the exception as needed
		}

		return userlist;

	}

	@Override
	public boolean UserDelete(int id) {

		boolean f = false;
		try {

			String sql = "delete from user where id=?";
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
	public User getUserById(int id) {
		// TODO Auto-generated method stub
		User u = null;

		try {
			String sql = "Select* from user where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id); // Set the value for the parameter

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u = new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPhno(rs.getString(4));
				u.setPassword(rs.getString(5));
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return u;
	}
	
	@Override
	public boolean updateEditUser(User u) {
		boolean f = false;
		try {
			String sql = "update user set name=?,email=?,phno=?,password=? where id=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPhno());
			ps.setString(4, u.getPassword());
			ps.setInt(5, u.getId());

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

}
