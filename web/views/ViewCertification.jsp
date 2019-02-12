<%-- 
    Document   : ViewCertification
    Created on : Feb 11, 2019, 7:30:03 PM
    Author     : Rayhan
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="models.Employee"%>
<%@page import="models.Certification"%>
<%@page import="tools.NewHibernateUtil"%>
<%@page import="controllers.Controller"%>
<%@page import="controllers.ControllerInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = "", name = "", description = "", employee = "", e = "";
    Date expired = new Date();


%>
<!DOCTYPE html>
<html>
    <%        SessionFactory sessionFactory = NewHibernateUtil.getSessionFactory();
        ControllerInterface<Certification> ccon = new Controller(sessionFactory);
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style_1.css" rel="stylesheet" type="text/css" />
        <title>Certification Page</title>
    </head>

    <body>
        <div id="wrapper">
            <div id="header">

                <form method="POST" action="../index.html"> 
                    <td><input type="submit" value="Home"></td>
                </form>
                <div id="menu_top" align="center">
                    <form action="../SaveCertificationServlet" method="post">
                        <h4> <font size="5" face="Times New Roman" color="olive" align="center">Certification</font></h4>
                        <table class="zebra-table">
                            <%
                                if (session.getAttribute("detail") != null) {
                                    Certification c = (Certification) session.getAttribute("detail");
                                    id = c.getId();
                                    name = c.getName();
                                    name = c.getName();
                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                    if (c.getExpiredDate() != null) {
                                        expired = c.getExpiredDate();
                                        e = sdf.format(expired);
                                    }
                                    else{
                                        e = null;
                                    }
                                    
                                    description = c.getDescription();
                                    employee = c.getEmployee().getId();

                                } else {
                                    id = (Integer.parseInt(ccon.getMaxId(new Certification()).getId()) + 1) + "";
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
                                <td>Name :</td>
                                <td><input type="text" name="name" value="<%= name%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Expired Date :</td>
                                <td><input type="date" name="expired" value="<%= e%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Description :</td>
                                <td><input type="text" name="description" value="<%= description%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Employee :</td>
                                <td><input type="text" name="employee" value="<%= employee%>" size="25"></td>
                            </tr>

                            <td colspan="2"></td>
                            <td><input type="submit" value="Kirim">
                                </form>
                                <form method="POST" action="../ViewCertificationServlet"> 
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
                                    <td>Expired Date</td>
                                    <td>Description</td>
                                    <td>Employee</td>
                                    <td>Aksi Detail</td>
                                    <td>Aksi Edit</td>
                                    <td>Aksi Delete</td>
                                </tr>
                                <% int i = 1;
                                    for (Certification certification : ccon.getAll(new Certification())) {%>                
                                <tr>
                                    <td style="text-align: center"><%= i%></td>
                                    <td><%= certification.getId()%></td>
                                    <td><%= certification.getName()%></td>
                                    <td><%= certification.getExpiredDate()%></td>
                                    <td><%= certification.getDescription()%></td>
                                    <td><%= certification.getEmployee().getId()%></td>
                                    <td><a align = "center" href="../DetailCertificationServlet?id=<%= certification.getId()%>"class="btn btn-outline-success btn-sm">Detail</a></td> 
                                    <td><a align = "center" href="../EditCertificationServlet?id=<%= certification.getId()%>" class="btn btn-outline-primary btn-sm">Edit</a></td>
                                    <td><a align = "center" href="../DeleteCertificationServlet?id=<%= certification.getId()%>"class="btn btn-outline-danger btn-sm">Delete</a></td>
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