<%@page import="beans.Viewcartbeans"%>
<%@page import="conn.Dao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.Productbeans"%>
<%@page import="Operation.Totalcode"%>
<%@ include file = "header1.jsp" %>


     <%
         
        
                      HttpSession ses=request.getSession();
                     String str1=(String) ses.getAttribute("userid");

         
         Dao d=new Dao();
            Totalcode t=new Totalcode();
            ArrayList <Viewcartbeans>ar=t.viewcart(str1);
           
            
            %>
            
	<!-- main -->
		<div class="main">
			<h1>Shopping Cart Widget</h1>
			<div class="main-grid1">
				<ul>
					<li><a href="editcart.jsp" class="car">EDIT CART</a></li>
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
                     
         
         %>
				
					<div class="message">
						 <div class="alert-close"> </div> 
						<div class="list_img"><img src="data:image/gif;base64, <%=str %>" class="img-responsive" alt="" /></div>
                                                
                                       <h4><%=name%></h4>
                                                <br>
                                                <br>
                                      PRIZE:&#8377;<%=prize%>
                                      quantity:<%=quantity%>
                                     
						<div class="list_desc"><h4></h4><span class="actual">
						 </span></div>
						  <div class="clear"></div>
					</div>
				
				<% }%>
                                </div>
				<div class="total">
					<div class="total-left">
						<p>Total :<span><%=prize1%></span></p>
					</div>
                                        <br>
					<div class="">
                                            <a href="confirmorder.jsp"><button>Confirm Order</button></a>
					</div>
					<div class="clear"> </div>
				</div>
			</div>
			
		</div>
	<!-- //main -->
</body>
</html>