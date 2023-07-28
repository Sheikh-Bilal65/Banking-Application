<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- JavaScript Function for Form Validation -->
<script LANGUAGE="JavaScript">
	function validateForm(form) {
		for (var i = 0; i < form.elements.length; i++) {
			if (form.elements[i].value === "") {
				alert("Fill out all Fields");
				document.F1.accountno.focus();
				return false;
			}
		}

		if (isNaN(document.F1.accountno.value)) {
			alert("A/C No. must be a number & can't be null");
			document.F1.accountno.value = "";
			document.F1.accountno.focus();
			return false;
		}

		if (!isNaN(document.F1.username.value)) {
			alert("User Name must be characters & can't be null");
			document.F1.username.value = "";
			document.F1.username.focus();
			return false;
		}

		if (!isNaN(document.F1.password.value)) {
			alert("Password must be characters & can't be null");
			document.F1.password.value = "";
			document.F1.password.focus();
			return false;
		}

		if (isNaN(document.F1.taccountno.value)) {
			alert("Target account must be a number & can't be null");
			document.F1.taccountno.value = "";
			document.F1.taccountno.focus();
			return false;
		}

		if (document.F1.accountno.value === document.F1.taccountno.value) {
			alert("Change target accountno");
			document.F1.taccountno.value = "";
			document.F1.taccountno.focus();
			return false;
		}

		if (isNaN(document.F1.amount.value)) {
			alert("Amount must be a number & can't be null");
			document.F1.amount.value = "";
			document.F1.amount.focus();
			return false;
		}

		return true;
	}
</script>

<!-- JavaScript Function -->
<script type="text/javascript">
	function ctck() {
		var sds = document.getElementById("dum");
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Global Banking</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div id="top_links">
		<!-- Top links (if any) can be added here -->
	</div>

	<div id="header">
		<h1>
			SHEIKHBILAL - BANK<span class="style1"></span>
		</h1>
		<h2>ExtraOrdinary Service</h2>
		<a href="index.html"><img src="images/home1.gif" alt="Home"></a>
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
			<li><a href="about.jsp">ABOUT US</a></li>
		</ul>
	</div>

	<table style="width: 800px; background: #FFFFFF; margin: 0 auto;">
		<tr>
			<td width="100" valign="top"
				style="border-right: #666666 1px dotted;">
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

			<td width="450" valign="top">
				<!-- Transfer Form Section -->
				<div id="welcome" style="border-right: #666666 1px dotted;">
					<h1>TRANSFER FORM</h1>
					<br>
					<table align="center" bgcolor="white">
						<tr>
							<!-- Balance Message (if any) -->
						</tr>
						<tr>
							<td>
								<div>
									<%
									if (request.getAttribute("balance") != null) {
										out.print(request.getAttribute("balance"));
									}
									%>
								</div>
								<form name="F1" onSubmit="return validateForm(this)"
									action="transfer.jsp">
									<table cellspacing="5" cellpadding="3">
										<tr>
											<td>ACCOUNT NO:</td>
											<td><input type="text" name="accountno" /></td>
										</tr>
										<tr>
											<td>USER NAME:</td>
											<td><input type="text" name="username" /></td>
										</tr>
										<tr>
											<td>PASSWORD:</td>
											<td><input type="password" name="password" /></td>
										</tr>
										<tr>
											<td>TARGET ACCOUNT NO:</td>
											<td><input type="text" name="taccountno" /></td>
										</tr>
										<tr>
											<td>AMOUNT:</td>
											<td><input type="text" name="amount" /></td>
										</tr>
										<tr>
											<td></td>
											<td><input type="submit" value="Submit" /> <input
												type="reset" value="CLEAR"></td>
										</tr>
									</table>
								</form>
							</td>
						</tr>
					</table>
				</div>
			</td>

			<td width="250" valign="top">
				<!-- Welcome Section -->
				<div id="welcome" style="border-right: #666666 1px dotted;">
					<h1>Welcome</h1>
					<br>
					<center>
						<img src="images/globe_10.gif" alt="business" width="196"
							height="106">
					</center>
					<br>
					<p>Each people plan their site layouts depending upon their
						business type. Here comes a free designer template which provides
						you with a selection of different kinds of web design starting
						from business template, fashion template, media template, Science
						template, Arts template and much more.</p>
				</div>
			</td>
		</tr>
	</table>

	<div id="footer_top">
		<div id="footer_navigation">
			<!-- Footer navigation links (if any) can be added here -->
		</div>

		<div id="footer_copyright">
			<center>
				<img alt="business" width="196" height="106">
			</center>
			<br>
			<p>Each people plan their site layouts depending upon their
				business type. Here comes a free designer template which provides
				you with a selection of different kinds of web design starting from
				business template, fashion template, media template, Science
				template, Arts template and much more.</p>
			Copyright ©SHEIKHH.BILAL@INSTAGRAM
		</div>
	</div>

	<script type="text/javascript">
		// Call the JavaScript function when the document is loaded
		document.onload = ctck();
	</script>
</body>
</html>
