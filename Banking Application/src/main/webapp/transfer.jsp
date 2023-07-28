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
        <!-- Transfer Processing Section -->
        <table>
          <% 
          // Get form parameters
          String num = request.getParameter("accountno");
          int accountno = Integer.parseInt(num);

          String username = request.getParameter("username");
          String password = request.getParameter("password");

          String num1 = request.getParameter("taccountno");
          int taccountno = Integer.parseInt(num1);

          String amoun = request.getParameter("amount");
          int accoun = 0;

          try {
            accoun = Integer.parseInt(amoun);
          } catch (NumberFormatException e) {
            // Handle the NumberFormatException gracefully
            out.print("Invalid input. Please enter a valid amount for transfer.");
            request.setAttribute("balance", "Invalid input. Please enter a valid amount for transfer.");
            %>
            <jsp:forward page="transfer1.jsp"></jsp:forward>
            <%
            return; // Stop further processing
          }

          // Check login status
          boolean status = verifyLogin1.checkLogin(accountno, username, password);
          try {
            if (status) {
              // User login is successful
              out.print("Welcome " + username);
              out.print(" TARGET ACCOUNT NO DOES NOT EXIST --> " + taccountno);

              boolean targetAccountExists = false; // Flag to check if the target account exists

              // Check if target account exists
              Connection con = GetCon.getCon();
              PreparedStatement ps = con.prepareStatement("SELECT * FROM NEWACCOUNT WHERE accountno=?");
              ps.setInt(1, taccountno);
              ResultSet rs = ps.executeQuery();

              if (rs.next()) {
                // Target account exists
                targetAccountExists = true;
                int dataamount = accoun + rs.getInt(5);

                // Check if the transfer amount is valid
                if (accoun <= 0) {
                  // Display an error message if the transfer amount is zero or negative
                  out.print("Please enter a valid amount for transfer.");
                  request.setAttribute("balance", "Please enter a valid amount for transfer.");
                  %>
                  <jsp:forward page="transfer1.jsp"></jsp:forward>
                  <%
                } else {
                  // Check if the user has sufficient balance for the transfer
                  Connection con2 = GetCon.getCon();
                  PreparedStatement ps2 = con2.prepareStatement("SELECT * FROM NEWACCOUNT WHERE accountno=?");
                  ps2.setInt(1, accountno);
                  ResultSet rs2 = ps2.executeQuery();

                  int currentBalance = 0;
                  if (rs2.next()) {
                    currentBalance = rs2.getInt(5);
                  }

                  if (accoun <= currentBalance) {
                    // Update target account balance after transfer
                    Connection con1 = GetCon.getCon();
                    PreparedStatement ps1 = con1.prepareStatement("UPDATE NEWACCOUNT SET amount=? WHERE accountno=?");
                    ps1.setInt(1, dataamount);
                    ps1.setInt(2, taccountno);
                    ps1.executeUpdate();

                    // Update source account balance after transfer
                    int dataamount1 = currentBalance - accoun;
                    Connection con3 = GetCon.getCon();
                    PreparedStatement ps3 = con3.prepareStatement("UPDATE NEWACCOUNT SET amount=? WHERE accountno=?");
                    ps3.setInt(1, dataamount1);
                    ps3.setInt(2, accountno);
                    ps3.executeUpdate();

                    // Forward the updated balances to the next JSP page
                    request.setAttribute("target_account_balance", dataamount);
                    request.setAttribute("source_account_balance", dataamount1);
                    %>
                    <jsp:forward page="tbalance.jsp"></jsp:forward>
                    <%
                  } else {
                    // Display an error message if the transfer amount exceeds the balance
                    out.print("Transfer amount exceeds your balance. Please enter a valid amount.");
                    request.setAttribute("balance", "Transfer amount exceeds your balance. Please enter a valid amount.");
                    %>
                    <jsp:forward page="transfer1.jsp"></jsp:forward>
                    <%
                  }
                }
              }

              if (!targetAccountExists) {
                // Display an error message if the target account does not exist
                out.print("The target account does not exist. Please enter a valid target account number.");
                request.setAttribute("balance", "The target account does not exist. Please enter a valid target account number.");
                %>
                <jsp:forward page="transfer1.jsp"></jsp:forward>
                <%
              }
            } else {
              // Display an error message if login credentials or target account number are incorrect
              out.print("Please check your username, password, and target account number.");
              request.setAttribute("balance", "Please check your username, password, and target account number.");
              %>
              <jsp:forward page="transfer1.jsp"></jsp:forward>
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
