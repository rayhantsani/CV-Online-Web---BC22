<%-- 
    Document   : ViewTraining
    Created on : Feb 11, 2019, 5:07:07 PM
    Author     : NINDA
--%>


<%@page import="models.Employee"%>
<%@page import="models.Training"%>
<%@page import="tools.NewHibernateUtil"%>
<%@page import="controllers.Controller"%>
<%@page import="controllers.ControllerInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page import="menu.menu" %>--%>
<%
    String id = "", name = "", description = "", certificate = "", employee = "";

%>
<!DOCTYPE html>
<html>
    <%        
        SessionFactory sessionFactory = NewHibernateUtil.getSessionFactory();
        ControllerInterface<Training> tcon = new Controller(sessionFactory);
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style_1.css" rel="stylesheet" type="text/css" />
        <title>Training Page</title>
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <form method="POST" action="../index.html">
                    <td><input type="submit" value="Home"></td>
                </form>

                <div id="menu_top" align="center">
                    <form action="../SaveTrainingServlet" method="post">
                        <h4> <font size="5" face="Times New Roman" color="olive" align="center">Training</font></h4>
                        <table class="zebra-table">
                            <%
                                if (session.getAttribute("detail") != null) {
                                    Training t = (Training) session.getAttribute("detail");
                                    id = t.getId();
                                    name = t.getName();
                                    description = t.getDescription();
                                    certificate = t.getCertificate();
                                    employee = t.getEmployee().getId();
                                } else {
                                    id = (Integer.parseInt(tcon.getMaxId(new Training()).getId()) + 1) + "";
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
                                <td>name :</td>
                                <td>:</td>
                                <td><input type="text" name="name" value="<%= name%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Description :</td>
                                <td>:</td>
                                <td><input type="text" name="description" value="<%= description%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Certificate :</td>
                                <td>:</td>
                                <td><input type="text" name="certificate" value="<%= certificate%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Employee :</td>
                                <td>:</td>
                                <td><input type="text" name="employee" value="<%= employee%>" size="25"></td>
                            </tr>

                            <td colspan="2"></td>
                            <td><input type="submit" value="Kirim">
                                </form>
                                <form method="POST" action="../ViewTrainingServlet">
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
                                    <td>Description</td>
                                    <td>Certificate</td>
                                    <td>Employee</td>

                                    <td>Aksi Detail</td>
                                    <td>Aksi Edit</td>
                                    <td>Aksi Delete</td>
                                </tr>
                                <% int i = 1;
                                    for (Training train : tcon.getAll(new Training())) {%>                
                                <tr>

                                    <td style="text-align: center"><%= i%></td>
                                    <td><%= train.getId()%></td>
                                    <td><%= train.getName()%></td>
                                    <td><%= train.getDescription()%></td>
                                    <td><%= train.getCertificate()%></td>
                                    <td><%= train.getEmployee().getId()%></td>

                                    <td><a align = "center" href="../DetailTrainingServlet?id=<%= train.getId()%>"class="btn btn-outline-success btn-sm">Detail</a></td> 
                                    <td><a align = "center" href="../EditTrainingServlet?id=<%= train.getId()%>" class="btn btn-outline-primary btn-sm">Edit</a></td>
                                    <td><a align = "center" href="../DeleteTrainingServlet?id=<%= train.getId()%>"class="btn btn-outline-danger btn-sm">Delete</a></td>
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






