<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.Viewcartbeans"%>
<%@page import="Operation.Totalcode"%>
<%@page import="conn.Dao"%>

<%@ include file = "header1.jsp" %>

<%HttpSession ses=request.getSession();
String str1=(String)ses.getAttribute("userid");
%>

     <%
         Dao d=new Dao();
            Totalcode t=new Totalcode();
            ArrayList <Viewcartbeans>ar=t.viewcart(str1);
           
            
            %>
            
	<!-- main -->
		<div class="main">
			<h1>Shopping Cart Widget</h1>
			<div class="main-grid1">
				<ul>
					<li><a href="cart.jsp" class="car">BACK TO CART</a></li>
				</ul>
			</div>
                        
			<div class="main-grid2">
				<h2>My Shopping Bag</h2>
                                <div class="cart_box">
                                    <% int prize1=0;%>
                                 <% for(Viewcartbeans vb:ar)
         {
             
                     String str= t.image(vb.getProductid());
                     int prize=vb.getPrize();
                     String name=vb.getName();
                     int quantity=vb.getQuantity();
                     prize1=(prize*quantity)+prize1;
                     
          String productid=String.valueOf(vb.getProductid());
          
         %>
				<form action="Editcartservlet" >
					<div class="message">
						 <div class="alert-close"> </div> 
						<div class="list_img"><img src="data:image/gif;base64, <%=str %>" class="img-responsive" alt="" /></div>
                                                
                                       <h4><%=name%></h4>
                                        <a href="Deletecartservlet?productid=<%=vb.getProductid()%>">remove</a>

                                                <br>
                                                <br>
                                      PRIZE:<%=prize%><br>
                                      previous quantity:<% out.println(quantity);%><br>
                                      new quantity     :<input type="number" name="quantity" value="1"  >
  
  <input type="hidden" name="productid" value="<%=vb.getProductid()%>">
  
  

                                    
  
						<div class="list_desc"><h4></h4><span class="actual">
						 </span></div>
						  <div class="clear"></div>
					</div>
  <input type="submit" value="Save">
				</form>
           
				<% }%>
                                
                                </div>
				<div class="total">
					<div class="total-left">
						<p>Total :<span><%=prize1%></span></p>
					</div>
					<div class="">
                                            <a href="confirmorder.jsp"><button>Check Out</button></a>
					</div>
					<div class="clear"> </div>
				</div>
			</div>
			
		</div>
	
</body>
</html>