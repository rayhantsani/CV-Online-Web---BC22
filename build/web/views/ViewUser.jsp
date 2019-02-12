<%-- 
    Document   : ViewUser
    Created on : Feb 11, 2019, 9:00:58 PM
    Author     : NINDA
--%>

<%@page import="models.UserMii"%>
<%@page import="tools.NewHibernateUtil"%>
<%@page import="controllers.Controller"%>
<%@page import="controllers.ControllerInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page import="menu.menu" %>--%>
<%
    String id = "", password = "", name = "", email = "", role = "";

%>
<!DOCTYPE html>
<html>
    <%        SessionFactory sessionFactory = NewHibernateUtil.getSessionFactory();
        Controller<UserMii> uController = new Controller(sessionFactory);
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style_1.css" rel="stylesheet" type="text/css" />
        <title>JSP Page</title>
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <form method="POST" action="../index.html">
                    <td><input type="submit" value="Home"></td>
                </form>

                <div id="menu_top" align="center">
                    <form action="../SaveUserServlet" method="post">
                        <h4> <font size="5" face="Times New Roman" color="olive" align="center">User</font></h4>
                        <table class="zebra-table">
                            <%
                                if (session.getAttribute("detail") != null) {
                                    UserMii u = (UserMii) session.getAttribute("detail");
                                    id = u.getId();
                                    password = u.getPassword();
                                    name = u.getName();
                                    email = u.getEmail();
                                    role = u.getRole().getId();
                                } else {
                                    id = (Integer.parseInt(uController.getMaxId(new UserMii()).getId()) + 1) + "";
                                }
                                if (session.getAttribute("message") != null) {
                                    out.println(session.getAttribute("message"));
                                }
                            %>
                            <tr>
                                <td>Id :</td>
                                <td>:</td>
                                <td><input type="text" name="id" value="<%= id%>" size="25" readonly="readonly"></td>
                            </tr>
                            <tr>
                                <td>Password :</td>
                                <td>:</td>
                                <td><input type="text" name="password" value="<%= password%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Name :</td>
                                <td>:</td>
                                <td><input type="text" name="name" value="<%= name%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Email :</td>
                                <td>:</td>
                                <td><input type="text" name="email" value="<%= email%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Role :</td>
                                <td>:</td>
                                <td><input type="text" name="role" value="<%= role%>" size="25"></td>
                            </tr>

                            <td colspan="2"></td>
                            <td><input type="submit" value="Kirim">
                                </form>
                                <form method="POST" action="../ViewUserServlet">
                                    <td><input type="submit" value="Reset"></td>
                                </form>
                                </tr>
                        </table>
                </div>
                <div id="content">
                    <div class ="content">
                        <center><table border="1">
                                <tr><td>No</td>
                                    <td>Id</td>
                                    <td>Name</td>
                                    <td>Email</td>
                                    <td>Role</td>

                                    <td>Aksi Detail</td>
                                    <td>Aksi Edit</td>
                                    <td>Aksi Delete</td>
                                </tr>
                                <% int i = 1;
                                    for (UserMii u : uController.getAll(new UserMii())) {%>                
                                <tr>
                                    <td style="text-align: center"><%= i%></td>
                                    <td><%= u.getId()%></td>
                                    <td><%= u.getName()%></td>
                                    <td><%= u.getEmail()%></td>
                                    <td><%= u.getRole().getId()%></td>

                                    <td><a align = "center" href="../DetailUserServlet?id=<%= u.getId()%>"class="btn btn-outline-success btn-sm">Detail</a></td> 
                                    <td><a align = "center" href="../EditUserServlet?id=<%= u.getId()%>" class="btn btn-outline-primary btn-sm">Edit</a></td>
                                    <td><a align = "center" href="../DeleteUserServlet?id=<%= u.getId()%>"class="btn btn-outline-danger btn-sm">Delete</a></td>
                                </tr>
                                <% i++;
                                    }%>
                        </center></table></div>

                </div></div>
    </body> 
    <%  session.removeAttribute("detail");
        session.removeAttribute("message");
    %>
</html>
