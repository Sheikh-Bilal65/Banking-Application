package k;
import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.Naming;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@SuppressWarnings({ "serial", "unused" })
@WebServlet("/CreateServlet")
public class CreateServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String  repassword=request.getParameter("repassword");
		
		String amoun=request.getParameter("amount");
		double amount=Double.parseDouble(amoun);
		
		String address=request.getParameter("adderess");
		
		String ph=request.getParameter("phone");
		double phone=Double.parseDouble(ph);
		
	    int status=RegisterUser.register(username, password, repassword, amount, address,phone);
	   
	    
		if(status>0){
			out.print("<h1>WELCOME! YOUR ACCOUNT HAS OPENED</h1>");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
		}
		else{
			out.print("<h1>Sorry,Registration failed. please try later</h1>");
			RequestDispatcher rd=request.getRequestDispatcher("create.html");
			rd.include(request, response);
		}
		
	out.close();	
	}

}
