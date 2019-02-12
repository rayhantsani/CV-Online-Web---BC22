<%-- 
    Document   : ViewClient
    Created on : Feb 11, 2019, 8:36:56 PM
    Author     : Rayhan
--%>

<%@page import="tools.NewHibernateUtil"%>
<%@page import="controllers.Controller"%>
<%@page import="controllers.ControllerInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Client" %>
<%
    String id = "", address = "", bussiness = "", is_delete = "";

%>
<!DOCTYPE html>
<html>
    <%        SessionFactory sessionFactory = NewHibernateUtil.getSessionFactory();
        ControllerInterface<Client> ccon = new Controller(sessionFactory);
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style_1.css" rel="stylesheet" type="text/css" />
        <title>Client Info Page</title>
    </head>

    <body>
        <div id="wrapper">
            <div id="header">
                <form method="POST" action="../index.html"> 
                    <td><input type="submit" value="Home"></td>
                </form>

                <div id="menu_top" align="center">
                    <form action="../SaveClientServlet" method="post">
                        <h4> <font size="5" face="Times New Roman" color="olive" align="center">Client Info</font></h4>
                        <table class="zebra-table">
                            <%
                                if (session.getAttribute("detail") != null) {
                                    Client c = (Client) session.getAttribute("detail");
                                    id = c.getId();
                                    address = c.getAddress();
                                    bussiness = c.getBusiness();
                                    is_delete = c.getIsDelete();
                                } else {
                                    id = (Integer.parseInt(ccon.getMaxId(new Client()).getId()) + 1) + "";
                                }
                                if (session.getAttribute("message") != null) {
                                    out.println(session.getAttribute("message"));
                                }
                            %>
                            <tr>
                                <td>Id :</td>
                                <td><input type="text" name="id" value="<%= id%>" size="25" readonly="readonly"></td>
                            </tr>
                            <tr>
                                <td>Address :</td>
                                <td><input type="text" name="address" value="<%= address%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Bussiness :</td>
                                <td><input type="text" name="bussiness" value="<%= bussiness%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Is Delete :</td>
                                <td><input type="text" name="is_delete" value="<%= is_delete%>" size="25"></td>
                            </tr>

                            <td colspan="2"></td>
                            <td><input type="submit" value="Save">
                                </form>
                                <form method="POST" action="../ViewClientServlet"> 
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
                                    <td>Address</td>
                                    <td>Bussiness</td>
                                    <td>Is Delete</td>
                                    <td>Aksi Detail</td>
                                    <td>Aksi Edit</td>
                                    <td>Aksi Delete</td>
                                </tr>
                                <% int i = 1;
                                    for (Client info : ccon.getAll(new Client())) {%>                
                                <tr>
                                    <td style="text-align: center"><%= i%></td>
                                    <td><%= info.getId()%></td>
                                    <td><%= info.getAddress()%></td>
                                    <td><%= info.getBusiness()%></td>
                                    <td><%= info.getIsDelete()%></td>
                                    <td><a align = "center" href="../DetailClientServlet?id=<%= info.getId()%>"class="btn btn-outline-success btn-sm">Detail</a></td> 
                                    <td><a align = "center" href="../EditClientServlet?id=<%= info.getId()%>" class="btn btn-outline-primary btn-sm">Edit</a></td>
                                    <td><a align = "center" href="../DeleteClientServlet?id=<%= info.getId()%>"class="btn btn-outline-danger btn-sm">Delete</a></td>
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