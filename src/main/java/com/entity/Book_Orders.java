package com.entity;

public class Book_Orders {
	private int id;
	private String order_id;
	private String userName;
	private String email;
	private String phno;
	private String fulladd;

	private String bookName;
	private String author;
	private String Price;

	private String payment;
private String orderstatus;
	public Book_Orders() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public String getOrderstatus() {
		return orderstatus;
	}


	public void setOrderstatus(String orderstatus) {
		this.orderstatus = orderstatus;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhno() {
		return phno;
	}

	public void setPhno(String phno) {
		this.phno = phno;
	}

	public String getFulladd() {
		return fulladd;
	}

	public void setFulladd(String fulladd) {
		this.fulladd = fulladd;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPrice() {
		return Price;
	}

	public void setPrice(String price) {
		Price = price;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	@Override
	public String toString() {
		return "Book_Orders [id=" + id + ", order_id=" + order_id + ", userName=" + userName + ", email=" + email
				+ ", phno=" + phno + ", fulladd=" + fulladd + ", bookName=" + bookName + ", author=" + author
				+ ", Price=" + Price + ", payment=" + payment + "]";
	}

}
