<%-- 
    Document   : admin
    Created on : 14 May, 2018, 6:39:04 PM
    Author     : srivathsan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <html>
<head>
<title>File Upload to Database Demo</title>
</head>
<body>
    <a href="index.jsp">back</a>
    
<!--
	Author: W3layouts
	Author URL: http://w3layouts.com
	License: Creative Commons Attribution 3.0 Unported
	License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="zxx">
<!-- Head -->

<head>
    <title>Border Register Form Flat Responsive Widget Template :: w3layouts</title>
    <!-- Meta-Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta name="keywords" content="Border Register Form a Responsive Web Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible Web Template, Smartphone Compatible Web Template, Free Webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design">
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- //Meta-Tags -->
    <!-- Index-Page-CSS -->
    <link rel="stylesheet" href="css/style6.css" type="text/css" media="all">
    <!-- //Custom-Stylesheet-Links -->
    <!--fonts -->
    <!-- //fonts -->
    <link rel="stylesheet" href="css/font-awesome.css" type="text/css" media="all">
    <!-- //Font-Awesome-File-Links -->
	
	<!-- Google fonts -->
	<link href="//fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;subset=latin-ext,vietnamese" rel="stylesheet">

	<!-- Google fonts -->

</head>
<!-- //Head -->
<!-- Body -->

<body>
    <h1 class="title-agile text-center">ADMIN LOGIN</h1>
    <div class="content-w3ls">
        <div class="content-bottom">
			<h2>Login here <i class="fa fa-hand-o-down" aria-hidden="true"></i></h2>
            <form action="Adminservlet" method="post">
                <div class="field-group">
                    <div class="wthree-field">
                        <input name="aname"  type="text" value="" placeholder="Adminid" required>
                    </div>
                </div>
                <div class="field-group">
                    <div class="wthree-field">
                        <input name="apassword" type="password" value="" placeholder="password" required>
                    </div>
                </div>
                
                <div class="wthree-field">
                    <input id="saveForm" name="saveForm" type="submit" value="login" />
                </div>
				
            </form>
        </div>
    </div>
    
</body>
<!-- //Body -->
</html>
