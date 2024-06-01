package com.DAO;

import java.util.List;

import com.entity.Book_Orders;

public interface BookOrdersDAO {
public boolean saveOrders(List<Book_Orders> b);
public List<Book_Orders>getBook(String email);
public List<Book_Orders>getAllBookOrders();
public boolean updateOrderStatus(String order_id, String orderstatus);
public String getOrderStatus(String order_id);

}
