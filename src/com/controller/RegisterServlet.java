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
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		Detail detail=new Detail();
		detail.setEmail(email);
		detail.setPassword(password);
		
		
		Connection con=null;
		ConnectDB connectDB=new ConnectDB();
		con=connectDB.connect();
		
		PreparedStatement preparedStatement=null;
		HttpSession session=request.getSession();
		int status=0;
		RequestDispatcher rd=null;
		String query="insert into user values(?,?,?,?,?,?,?,?)";
		try {
			preparedStatement =con.prepareStatement(query);
			preparedStatement.setString(1, detail.getEmail());
			preparedStatement.setString(2, detail.getPassword());
			preparedStatement.setString(3, detail.getTitle());
			preparedStatement.setString(4, detail.getFname());
			preparedStatement.setString(5, detail.getLname());
			preparedStatement.setString(6, detail.getCountry());
			preparedStatement.setString(7, detail.getCcode());
			preparedStatement.setString(8, detail.getPhone());
			status=preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(status!=0) {
			System.out.println("Registered Successfully");;
			System.out.println(detail.toString());
			session.setAttribute("USERNAME", email);
			request.getRequestDispatcher("profileDetails.jsp").forward(request, response);
		}
		else {
			System.out.println("Not Registered Successfully");
			System.out.println(detail.toString());
		}
	}

}
