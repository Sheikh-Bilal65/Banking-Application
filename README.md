Banking Application


Description

The Banking Application is a web-based platform developed using Servlet, JSP, Oracle SQL, HTML, CSS, and Bootstrap. It enables users to create accounts, make deposits, withdraw funds, and transfer money between accounts. This application provides a secure and user-friendly experience for managing finances efficiently.

Note: The application currently does not store recent transaction details.
Key Features

    Account Creation: Users can register and create their bank accounts it will automatically generate
    & give unique account numbers to every user.
    Deposit and Withdraw: Users can make deposits and withdrawals from their accounts securely.
    Account Transfers: Transfer funds between registered users with proper authorization.
    Transaction History: A transaction history is not currently implemented in the application.
    Account Summary: View account details, including balance and account information, on a user dashboard 
    and user can also close there account it will delete the account from database.
    Responsive Design: The UI is designed with HTML, CSS, and Bootstrap to provide a seamless experience across devices.
    Database Integration: Oracle SQL is used to efficiently manage user data and account information.

Usage Instructions

    Clone the repository to your local machine open it on eclipse IDE.
    Set up a web server (e.g., Apache Tomcat) and deploy the application.
    Configure the DBinitializer and change the username/password and connection details.
    it will automatically create the sequence and tables at the time of deploying, as i have maded 
    accounttableinitiazerListener it will execute at the time of deploying and create the tables.  
    Ensure the web server and database are running.
