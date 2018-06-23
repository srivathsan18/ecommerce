<%@page import="java.util.ArrayList"%>
<%@page import="beans.Productbeans"%>
<%@page import="Operation.Totalcode"%>
<%@ include file = "header.jsp" %>
	
	
       <%
            Totalcode t=new Totalcode();
            ArrayList <Productbeans>ar=t.productlist("electronic");
            
            
            %>
            <div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">
    <% for(Productbeans pb:ar)
         {
         String str=String.valueOf(pb.getProductid());
          
         %>
         

  <!-- First Photo Grid-->
  <div class="agile_ecommerce_tabs">
								<div class="col-md-4 agile_ecommerce_tab_left">									
										<img src="data:image/gif;base64,<%=pb.getImage()%> " alt="" >																										
									<h5><% out.println(pb.getProductname());%></h5><br>
                                                                        PRIZE:&#8377;<%out.println(pb.getPrize());%>

									<form action="single.jsp" method="post">
						<input type="hidden" name="productname" value="<%=pb.getProductname()%>">
                                                <input type="hidden" name="prize" value="<%=pb.getPrize()%>"> 
						<input type="hidden" name="productid" value="<%=pb.getProductid()%>"> 
						<input type="hidden" name="catagories" value="<%=pb.getCatagories()%>">   
						<button type="submit" class="w3ls-cart">Add to cart</button>
					</form>
                                                                        
                                                                </div>
									

     
</div>
                                                                                <% } %>
			        
     </div>      
                                                                              
                                                                                <div class="clearfix"> </div>
                     
		
  
            <%@ include file = "footer.jsp" %>          