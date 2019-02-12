<%-- 
    Document   : QualificationEmployee
    Created on : Feb 11, 2019, 1:19:18 PM
    Author     : NINDA
--%>
<%@page import="models.Employee"%>
<%@page import="models.Qualification"%>
<%@page import="models.QualificationEmployee"%>
<%@page import="tools.NewHibernateUtil"%>
<%@page import="controllers.Controller"%>
<%@page import="controllers.ControllerInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page import="menu.menu" %>--%>
<%
    String id = "", qualification = "", employee = "";

%>
<!DOCTYPE html>
<html>
    <%        SessionFactory sessionFactory = NewHibernateUtil.getSessionFactory();
        Controller<QualificationEmployee> qeController = new Controller(sessionFactory);
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
                    <form action="../SaveQEServlet" method="post">
                        <h4> <font size="5" face="Times New Roman" color="olive" align="center">Qualification Employee</font></h4>
                        <table class="zebra-table">
                            <%
                                if (session.getAttribute("detail") != null) {
                                    QualificationEmployee qe = (QualificationEmployee) session.getAttribute("detail");
                                    id = qe.getId();
                                    qualification = qe.getQualification().getId();
                                    employee = qe.getEmployee().getId();
                                } else {
                                    id = (Integer.parseInt(qeController.getMaxId(new QualificationEmployee()).getId()) + 1) + "";
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
                                <td>Employee :</td>
                                <td>:</td>
                                <td><input type="text" name="employee" value="<%= employee%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Qualification :</td>
                                <td>:</td>
                                <td><input type="text" name="qualification" value="<%= qualification%>" size="25"></td>
                            </tr>


                            <td colspan="2"></td>
                            <td><input type="submit" value="Kirim">
                                </form>
                                <form method="POST" action="../ViewQEServlet">
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
                                    <td>Employee</td>
                                    <td>Qualification</td>

                                    <td>Aksi Detail</td>
                                    <td>Aksi Edit</td>
                                    <td>Aksi Delete</td>
                                </tr>
                                <% int i = 1;
                                    for (QualificationEmployee qe : qeController.getAll(new QualificationEmployee())) {%>                
                                <tr>
                                    <td style="text-align: center"><%= i%></td>
                                    <td><%= qe.getId()%></td>
                                    <td><%= qe.getEmployee().getId()%></td>
                                    <td><%= qe.getQualification().getId()%></td>

                                    <td><a align = "center" href="../DetailQEServlet?id=<%= qe.getId()%>"class="btn btn-outline-success btn-sm">Detail</a></td> 
                                    <td><a align = "center" href="../EditQEServlet?id=<%= qe.getId()%>" class="btn btn-outline-primary btn-sm">Edit</a></td>
                                    <td><a align = "center" href="../DeleteQEServlet?id=<%= qe.getId()%>"class="btn btn-outline-danger btn-sm">Delete</a></td>
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

