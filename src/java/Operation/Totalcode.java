/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Operation;
import beans.Addcartbeans;
import beans.Changeaddressbeans;
import beans.Productbeans;
import beans.Signupbeans;
import beans.Signinbeans;
import beans.Viewcartbeans;
import conn.Dao;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.ListIterator;
/**
 *
 * @author srivathsan
 */
public class Totalcode {
     
     int i;
       int j=0;
     
     
          public int signup(Signupbeans s) {
       try{
        Dao d=new Dao();
        Connection con=d.getConnection();

        PreparedStatement p=con.prepareStatement("insert into users values(?,?,?,?,?,?,?)");
        p.setString(1,s.getUser());
        p.setString(2,s.getPass());
        p.setString(3,s.getEmail());
        p.setString(4,s.getUserid());
        p.setString(5,s.getAddress());
        p.setString(6,s.getState());
        p.setString(7,s.getPincode());

       i= p.executeUpdate();
        
       }
       catch(Exception e){
           System.out.println("update failure");
       }
       return i;
     }

     public String signin(Signinbeans s){
         String userid ="";
         try{
              System.out.println(s.getName());
                            System.out.println(s.getPassword());

        Dao d=new Dao();
        Connection con=d.getConnection();
        PreparedStatement p=con.prepareStatement("select * from users where email=?");
        p.setString(1,s.getName());
        ResultSet rs=p.executeQuery();
        if(rs.next())
        {
            String pass=rs.getString(2);
            if(pass.equals(s.getPassword())){
              userid=rs.getString(4);
           }
        }        
        }
         catch(Exception e){
             System.out.println(" sign in Exception");
         }
        
         return userid;
     }
     public  ArrayList<Productbeans> productlist(String id){
         
         ArrayList<Productbeans> ar=new ArrayList();
          Dao d=new Dao();
             Blob blob;
             int size;
             byte[] bloarr;
             String imgDataBase64;
            
         try{             
             Connection con=d.getConnection();
        PreparedStatement p=con.prepareStatement("select * from product where catagories=?");
        p.setString(1,id);
             ResultSet rs=p.executeQuery();
             while(rs.next()){
                  Productbeans pb=new Productbeans();
                 pb.setProductname(rs.getString(1));
                 pb.setQuantity(rs.getInt(2));
                 pb.setPrize(rs.getInt(3));
                 blob=rs.getBlob(4);  
                 size=(int)blob.length();
                  bloarr=blob.getBytes(1,size);
                          imgDataBase64=new String(Base64.getEncoder().encode(bloarr));
                 pb.setImage(imgDataBase64);
                 pb.setProductid(rs.getInt(5));
                 pb.setProductdesc(rs.getString(6));
                 pb.setCatagories(rs.getString(7));
                 ar.add(pb);                 
             }
            
             
             
         }
         
         catch(Exception e){
             
         }
        return ar; 
     }
    
     public  ArrayList<Productbeans> desclist(int id){
         
         ArrayList<Productbeans> ar1=new ArrayList();
          Dao d=new Dao();
             Blob blob;
             int size;
             byte[] bloarr;
             String imgDataBase64;
            
         try{             
             Connection con=d.getConnection();
        PreparedStatement p=con.prepareStatement("select * from product where productid=?");
        p.setInt(1,id);
             ResultSet rs=p.executeQuery();
             while(rs.next()){
                  Productbeans pb=new Productbeans();
                 pb.setProductname(rs.getString(1));
                 pb.setQuantity(rs.getInt(2));
                 pb.setPrize(rs.getInt(3));
                 blob=rs.getBlob(4);  
                 size=(int)blob.length();
                  bloarr=blob.getBytes(1,size);
                          imgDataBase64=new String(Base64.getEncoder().encode(bloarr));
                 pb.setImage(imgDataBase64);
                 pb.setProductid(rs.getInt(5));
                 pb.setProductdesc(rs.getString(6));
                 pb.setCatagories(rs.getString(7));
                 ar1.add(pb);                 
             }
            
             
             
         }
         
         catch(Exception e){
             
         }
        return ar1; 
     }
   public  int addcart(Addcartbeans ac,int quan){
       int i=0;
        Dao d=new Dao();
        try{
             Connection con=d.getConnection();
             PreparedStatement ps1=con.prepareStatement("select quantity from cart where productid=?");
             ps1.setInt(1,ac.getProductid());
             
             ResultSet rs=ps1.executeQuery();
             if(rs.next()){
                 if(quan<=rs.getInt(1)){
                     
               
                 int quantity=rs.getInt(1)+ac.getQuantity();
                 PreparedStatement ps2=con.prepareStatement("update cart set quantity=? where productid=? ");
                 ps2.setInt(1,quantity);
                 ps2.setInt(2,ac.getProductid());
               i=  ps2.executeUpdate();
                 }
                
            
             }
             else{
        PreparedStatement ps=con.prepareStatement("insert into cart values(?,?,?,?,?)");
        ps.setString(1, ac.getProductname());
                ps.setInt(2, ac.getQuantity());
                ps.setInt(3, ac.getPrize());
                ps.setString(4, ac.getUserid());
                ps.setInt(5, ac.getProductid());
                i=ps.executeUpdate();
                                        
             }                 

        }
        catch(Exception e){
            System.out.println("Add cart Exception");
        }
        return i;
    }   
   public ArrayList <Viewcartbeans> viewcart(String userid){
       Dao d=new Dao();
       
       ArrayList <Viewcartbeans>al=new ArrayList();
       try{
        Connection con=d.getConnection();
        PreparedStatement ps=con.prepareStatement("select * from cart where userid=?");
        ps.setString(1, userid);
        ResultSet rs=ps.executeQuery();
        while(rs.next()){
            Viewcartbeans v=new Viewcartbeans();
            v.setName(rs.getString(1));
            v.setQuantity(rs.getInt(2));
            v.setPrize(rs.getInt(3));
            v.setUserid(rs.getString(4));
            v.setProductid(rs.getInt(5));
          al.add(v);   
        }
       }
       catch(Exception e){
           System.out.println("viewcart class error");
       }
       return al;
   }
   public ArrayList <Viewcartbeans> showcart(String userid){
       Dao d=new Dao();
       
       ArrayList <Viewcartbeans>al=new ArrayList();
       try{
        Connection con=d.getConnection();
        PreparedStatement ps=con.prepareStatement("select * from confirm where userid=?");
        ps.setString(1, userid);
        ResultSet rs=ps.executeQuery();
        while(rs.next()){
            Viewcartbeans v=new Viewcartbeans();
            v.setName(rs.getString(1));
            v.setQuantity(rs.getInt(2));
            v.setPrize(rs.getInt(3));
            v.setUserid(rs.getString(4));
            v.setProductid(rs.getInt(5));
          al.add(v);   
        }
       }
       catch(Exception e){
           System.out.println("viewcart class error");
       }
       return al;
   }
    public String image(int id){
    
          byte[] bloarr;
         String str="";
         
          Dao d=new Dao();
          try{
          Connection con=d.getConnection();
           PreparedStatement ps=con.prepareStatement("select image from product where productid=?");
           ps.setInt(1,id);
           
           ResultSet rs=ps.executeQuery();
           while(rs.next()){
               
            Blob   blob=rs.getBlob(1);  
               int  size=(int)blob.length();
                 bloarr=blob.getBytes(1,size);
                   str=new String(Base64.getEncoder().encode(bloarr));
               
           }
           
           
          }
          catch(Exception e){
              System.out.println("image function");
          }
          return str;
    }
          public int editcart(int proid,int qua){
              int i=0;
              Dao d=new Dao();
          try{
          Connection con=d.getConnection();
          PreparedStatement ps=con.prepareStatement("update cart set quantity=? where productid=?");
          ps.setInt(1,qua);
          ps.setInt(2,proid);
                  i=ps.executeUpdate();
                  
              }
              catch(Exception e){
                  System.out.println("editcart exception");
                  
              }
              return i;
          }
          public int deletecart(int proid){
              int i=0;
              Dao d=new Dao();
              try{
                  Connection con=d.getConnection();
          PreparedStatement ps=con.prepareStatement("delete cart where productid=?");
    ps.setInt(1,proid);
    i=ps.executeUpdate();
              }
              catch(Exception e){
                 System.out.println("deletecart");
              }
              return i;
              
          }
         public ArrayList <Signupbeans> userdetails(String userid){
              
              ArrayList<Signupbeans> al=new ArrayList();
              Dao d=new Dao();
              try{
              Connection con=d.getConnection();
              PreparedStatement ps=con.prepareStatement("select * from users where userid=?");
              ps.setString(1,userid);
              ResultSet rs=ps.executeQuery();
              while(rs.next()){
                  Signupbeans s=new Signupbeans();
                  s.setUser(rs.getString(1));
                  s.setPass(rs.getString(2));
                  s.setEmail(rs.getString(3));
                  s.setUserid(rs.getString(4));
                  s.setAddress(rs.getString(5));
                  s.setState(rs.getString(6));
                  s.setPincode(rs.getString(7));
                  al.add(s);
                  
              }
              }
              catch(Exception e){
                  System.out.println("userdetails exception");
              }
              return al;
          }
          public int changeaddress(Changeaddressbeans cb){
              int i=0;
              Dao d=new Dao();
              try{
              Connection con=d.getConnection();
              PreparedStatement ps=con.prepareStatement("update users set address=?,state=?,pincode=? where userid=?");
              ps.setString(1,cb.getAddress());
              ps.setString(2,cb.getState());
              ps.setString(3,cb.getPincode());
              ps.setString(4,cb.getUserid());
              i=ps.executeUpdate();
              }
              catch(Exception e){
                 System.out.println("changea address servlet"); 
              }
              
              
              return i; 
          }
          
          public int payment(String userid){
          
           
              try{
                  Dao d=new Dao();
                  Connection con=d.getConnection();
                  PreparedStatement ps=con.prepareStatement("insert into confirm select * from cart where userid=?");
                  ps.setString(1, userid);
                  i=ps.executeUpdate();
                  PreparedStatement ps3=con.prepareStatement("select productid,quantity from cart");
                  ResultSet rs=ps3.executeQuery();
                  while(rs.next()){
                      Productbeans pb=new Productbeans();
                  pb.setProductid(rs.getInt(1));
                  pb.setQuantity(rs.getInt(2));
                      
                      PreparedStatement ps2=con.prepareStatement("select quantity from product where productid=?");
                      ps2.setInt(1,pb.getProductid());
                      ResultSet rs1=ps2.executeQuery();
                      if(rs1.next())
                      {
                        int quantity=rs1.getInt(1);
                        quantity=quantity-pb.getQuantity();
                        PreparedStatement ps4=con.prepareStatement("update product set quantity=? where productid=?");
                        ps4.setInt(1,quantity);
                        ps4.setInt(2,pb.getProductid());
                      i=  ps4.executeUpdate();
                      }
                  } 
                  
                  if(i>0){
                      
                      PreparedStatement ps2=con.prepareStatement("delete from cart where userid=?");
                      ps2.setString(1, userid);
                    i=  ps2.executeUpdate();
                  }
                  
              }
              catch(Exception e){
                  System.out.println("payment method");
              }
              
              
              return i;
          }
          
       public  ArrayList<Productbeans> allist(){
         
         ArrayList<Productbeans> ar=new ArrayList();
          Dao d=new Dao();
             Blob blob;
             int size;
             byte[] bloarr;
             String imgDataBase64;
             int i=0;
            
         try{             
             Connection con=d.getConnection();
        PreparedStatement p=con.prepareStatement("select * from product ");
             ResultSet rs=p.executeQuery();
             while(rs.next() && i<5){
                  Productbeans pb=new Productbeans();
                 pb.setProductname(rs.getString(1));
                 pb.setQuantity(rs.getInt(2));
                 pb.setPrize(rs.getInt(3));
                 blob=rs.getBlob(4);  
                 size=(int)blob.length();
                  bloarr=blob.getBytes(1,size);
                          imgDataBase64=new String(Base64.getEncoder().encode(bloarr));
                 pb.setImage(imgDataBase64);
                 pb.setProductid(rs.getInt(5));
                 pb.setProductdesc(rs.getString(6));
                 pb.setCatagories(rs.getString(7));
                 ar.add(pb);    
                 i++;
             }
            
             
             
         }
         
         catch(Exception e){
             
         }
        return ar; 
     }
    
     }


