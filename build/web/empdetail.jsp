<%-- 
    Document   : login
    Created on : 10 May, 2021, 11:00:48 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head><title>JSP Page</title></head>
<body>
<%
        String s=request.getParameter("submit");
        Class.forName ("org.h2.Driver"); 
        Connection conn = DriverManager.getConnection ("jdbc:h2:tcp://localhost/~/test", "sa",""); 
        Statement st = conn.createStatement(); 
        out.println("<center>");
        out.println("Employee Details");
       
                      
                
                
                
        out.println("</center><br>");
        if(s.equals("insert"))
            {
                int eid=Integer.parseInt(request.getParameter("eid"));
                String ename=request.getParameter("ename");
                int age=Integer.parseInt(request.getParameter("age"));
                int bpay=Integer.parseInt(request.getParameter("bpay"));
                int allow=Integer.parseInt(request.getParameter("allow"));
                int dedu=Integer.parseInt(request.getParameter("dedu"));
                int gpay=Integer.parseInt(request.getParameter("gpay"));
                st.executeUpdate("insert into emptable values("+eid+",'"+ename+"',"+age+","+bpay+","+allow+","+dedu+","+gpay+")");
                out.println("inserted");
                conn.close();
            }
            else
            {
               // int eid=Integer.parseInt(request.getParameter("eid"));
                ResultSet rs=st.executeQuery("select * from emptable ");
                out.println("<table border=2 width=100>");
                while(rs.next())
                {
                    
                    out.print("<tr><td>"+rs.getInt("eid")+"</td>");
                    out.print("<td>"+rs.getString("ename")+"</td>");
                    out.print("<td>"+rs.getInt("age")+"</td>");
                    out.print("<td>"+rs.getInt("bpay")+"</td>");
                    out.print("<td>"+rs.getInt("allow")+"</td>");
                    out.print("<td>"+rs.getInt("dedu")+"</td>");
                    out.print("<td>"+rs.getInt("gpay")+"</td></tr>");
                   
               
                }
 out.println("</table>");
            }

%>

</body>
</html>
