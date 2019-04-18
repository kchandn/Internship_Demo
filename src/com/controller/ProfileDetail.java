package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.Detail;
import com.connection.ConnectDB;

/**
 * Servlet implementation class ProfileDetail
 */
@WebServlet("/submitdetail")
public class ProfileDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		System.out.println("Profileupdate page");
		String email=request.getParameter("email");
		String title=request.getParameter("title");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String country=request.getParameter("country");
		String ccode=request.getParameter("ccode");
		String mobile=request.getParameter("mobile");
		
		Detail detail=new Detail();
		detail.setEmail(email);
		detail.setTitle(title);
		detail.setFname(fname);
		detail.setLname(lname);
		detail.setCountry(country);
		detail.setCcode(ccode);
		detail.setPhone(mobile);
		
		System.out.println(detail.toString()+"Hello");
		Connection con=null;
		ConnectDB connectDB=new ConnectDB();
		con=connectDB.connect();
		
		PreparedStatement preparedStatement=null;
		int status=0;
		RequestDispatcher rd=null;
		String query="update user set title=?, fname=?, lname=?, country=?, ccode=?, phone=? where email=?";
		try {
			preparedStatement =con.prepareStatement(query);
			preparedStatement.setString(1, detail.getTitle());
			preparedStatement.setString(2, detail.getFname());
			preparedStatement.setString(3, detail.getLname());
			preparedStatement.setString(4, detail.getCountry());
			preparedStatement.setString(5, detail.getCcode());
			preparedStatement.setString(6, detail.getPhone());
			preparedStatement.setString(7, detail.getEmail());
			status=preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(status!=0) {
			System.out.println("Profile Updated Successfully");;
			
			request.getRequestDispatcher("thankyou.jsp").forward(request, response);
		}
		else {
			System.out.println("Not updated Successfully");
			System.out.println(detail.toString());
		}
	}

}
