<%@ page import="java.sql.*, java.io.*, javax.servlet.*, k.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>Global Banking</title>
  <link href="style.css" rel="stylesheet" type="text/css">
  <script type="text/javascript">
    function ctck() {
      var sds = document.getElementById("dum");
    }
  </script>
</head>
<body>
  <div id="top_links">
    <!-- Header, Navigation, and other HTML content here -->
  </div>

  <table style="width: 897px; background: #FFFFFF; margin: 0 auto;">
    <tr>
      <td width="300" valign="top" style="border-right: #666666 1px dotted;">
        <!-- Services Section -->
        <div id="services">
          <h1>Services</h1>
          <br>
          <ul>
            <li><a href="#">www.sheikhh.bilal@instagram.com</a></li>
            <li><a href="#">www.sheikhh.bilal@instagram.com</a></li>
          </ul>
        </div>
      </td>
      <td width="1200" valign="top">
        <!-- Deposit Processing Section -->
        <table>
          <% 
          // Get form parameters
          String num = request.getParameter("accountno");
          String amoun = request.getParameter("amount");

          int accountno = 0;
          int accoun = 0;

          try {
            accountno = Integer.parseInt(num);
            accoun = Integer.parseInt(amoun);
          } catch (NumberFormatException e) {
            // Handle the NumberFormatException gracefully
            out.print("Invalid input. Please enter valid account number and amount.");
            request.setAttribute("balance", "Invalid input. Please enter valid account number and amount.");
            %>
            <jsp:forward page="deposit1.jsp"></jsp:forward>
            <%
            return; // Stop further processing
          }

          String username = request.getParameter("username");
          String password = request.getParameter("password");
          
          // Verify user login credentials
          boolean status = verifyLogin1.checkLogin(accountno, username, password);
          
          try {
            if (status) {
              out.print("Welcome " + username);
              Connection con = GetCon.getCon();
              PreparedStatement ps = con.prepareStatement("Select * from NEWACCOUNT where accountno=?");
              ps.setInt(1, accountno);
              ResultSet rs = ps.executeQuery();
              int dataamount = 0;

              if (accoun <= 0) {
                // Display an error message if the new balance would be negative or zero
                out.print("Please enter a valid amount for deposit (non-negative & non-zero).");
                request.setAttribute("balance", "Please enter a valid amount for deposit (non-negative & non-zero).");
              %>
              <jsp:forward page="deposit1.jsp"></jsp:forward>
              <%
              } else if (rs.next()) {
                dataamount = accoun + rs.getInt(5);
              }

              // Check if the new balance will be non-negative before updating
              if (dataamount >= 0) {
                Connection con1 = GetCon.getCon();
                PreparedStatement ps1 = con1.prepareStatement("update NEWACCOUNT set amount=? where accountno=?");
                ps1.setInt(1, dataamount);
                ps1.setInt(2, accountno);
                ps1.executeUpdate();

                out.print("Your balance has increased ");
                request.setAttribute("totaldataamount", dataamount);
                request.setAttribute("balance", "Your balance has increased ");
              %>
              <jsp:forward page="Totalbalance.jsp"></jsp:forward>
              <%
              } else {
                // Display an error message if the new balance would be negative
                out.print("Please enter a valid amount for deposit (non-negative).");
                request.setAttribute("balance", "Please enter a valid amount for deposit (non-negative).");
              %>
              <jsp:forward page="deposit1.jsp"></jsp:forward>
              <%
              }
            } else {
              out.print("Please check your username and Password");
              request.setAttribute("balance", "Please check your username and Password");
            %>
            <jsp:forward page="deposit1.jsp"></jsp:forward>
            <%
            }
          } catch (SQLException e) {
            e.printStackTrace();
          }
          %>
        </table>
      </td>
    </tr>
  </table>
</body>
</html>
