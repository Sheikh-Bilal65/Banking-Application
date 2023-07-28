<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Global Banking</title>
    <link href="style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        // JavaScript Function
        function ctck() {
            var sds = document.getElementById("dum");
        }
    </script>
</head>

<body>
<div id="top_links">
    <!-- Top links (if any) can be added here -->
</div>

<div id="header">
    <h1>SHEIKHBILAL - BANK<span class="style1"></span></h1>
    <h2>ExtraOrdinary Service</h2>
</div>

<div id="navigation">
    <!-- Navigation Links -->
    <ul>
        <li><a href="create.html">NEW ACCOUNT</a></li>
        <li><a href="balance1.jsp">BALANCE</a></li>
        <li><a href="deposit1.jsp">DEPOSIT</a></li>
        <li><a href="withdraw1.jsp">WITHDRAW</a></li>
        <li><a href="transfer1.jsp">TRANSFER</a></li>
        <li><a href="closeac1.jsp">CLOSE A/C</a></li>
        <li><a href="about.jsp">Contact Us</a></li>
    </ul>
</div>

<table style="width: 897px; background: #FFFFFF; margin: 0 auto;">
    <tr>
        <td width="300" valign="top" style="border-right: #666666 1px dotted;">
            <!-- Services Section -->
            <div id="services">
                <h1>Services</h1><br>
                <ul>
                    <li><a href="#">www.sheikhh.bilal@instagram.com</a></li>
                    <li><a href="#">www.sheikhh.bilal@instagram.com</a></li>
                </ul>
            </div>
        </td>

        <td width="1200" valign="top">
            <!-- Close Account Form Section -->
            <%-- Some JSP code to handle account closing --%>
            <table>
                <%  
                String num = request.getParameter("accountno");
                int accountno = Integer.parseInt(num);
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                boolean status = verifyLogin1.checkLogin(accountno, username, password);
                try {
                    if (status) {
                        out.print("Welcome    " + username);

                        Connection con = GetCon.getCon();
                        PreparedStatement ps = con.prepareStatement("delete from NEWACCOUNT where accountno='" + accountno + "'");
                        //ps.setInt(1,accountno);
                        ps.executeUpdate();

                        out.println("&nbsp;&nbsp;Your account no '" + accountno + "' has now closed.");
                        out.println("Thank you for using our service. Hope you come back soon.");

                        out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='index.html'><img src='images/home1.gif'></a>");

                    } else {
                        out.print("Please check your username and Password");
                        request.setAttribute("balance", "Please check your username and Password");
                    %>
                        <jsp:forward page="closeac1.jsp"></jsp:forward>
                    <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                %>
            </table>
            <%-- End of JSP code --%>
        </td>
    </tr>
</table>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="k.*" %>
</body>
</html>
