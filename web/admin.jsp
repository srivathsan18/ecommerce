
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
<a href="index.jsp"><button>SIGNOUT</button></a>
<body>
    <h1 class="title-agile text-center">Product Register form</h1>
    <div class="content-w3ls">
        <div class="content-bottom">
			<h2>Register Here <i class="fa fa-hand-o-down" aria-hidden="true"></i></h2>
        <form method="post" action="Uploadservlet" enctype="multipart/form-data">
                <div class="field-group">
                    <div class="wthree-field">
                        <input type="text" name="productname"  placeholder="Productname" required>
                    </div>
                </div>
                <div class="field-group">
                    <div class="wthree-field">
                        <input type="number" name="quantity"  placeholder="quantity" required>
                    </div>
                </div>
                <div class="field-group">
                    <div class="wthree-field">
                        <input type="number" name="prize"  placeholder="prize" required>
                    </div>
                </div>
                <div class="field-group">
                    <div class="wthree-field">
                        <input type="file" name="photo" >
                    </div>
                </div>
                <div class="field-group">
                    <div class="wthree-field">
                        <input name="productdesc"  type="text" placeholder="productdesc">
                    </div>
                </div>
                <div class="field-group">
                    <div class="wthree-field">
                        <h6 style="color: white"> Catagories:</h6>
                        <select name="catagories">
                            <option value="electronic">electronic</option>
                            <option value="menswear">menswear</option>
                            <option value="womenswear">womenswear</option>
                        </select>
                    </div>
                </div>
                <div class="wthree-field">
                    <input id="saveForm" name="saveForm" type="submit" value="Register" />
                </div>
				
            </form>
        </div>
    </div>
    
</body>
<!-- //Body -->
</html>
