<%-- 
    Document   : ViewExperience
    Created on : 11-Feb-2019, 09:50:23
    Author     : kresna92
--%>


<%@page import="tools.NewHibernateUtil"%>
<%@page import="controllers.Controller"%>
<%@page import="controllers.ControllerInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page import="menu.menu" %>--%>
<%@page import="models.Experience" %>
<%
    String ids = "", name = "", description = "", emp = "";

%>
<!DOCTYPE html>
<html>
    <%        SessionFactory sessionFactory = NewHibernateUtil.getSessionFactory();
        Controller<Experience> mcon = new Controller(sessionFactory);
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style_1.css" rel="stylesheet" type="text/css" />
        <title>CV Online</title>
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <form action="../index.html" method="post">
                    <td><input type="submit" value="Home"></td>
                </form>
                <div id="menu_top" align="center">
                    <form action="../SaveExperienceServlet" method="post">
                        <h4> <font size="5" face="Times New Roman" color="olive" align="center">Experience</font></h4>
                        <table class="zebra-table">
                            <%
                                if (session.getAttribute("detail") != null) {
                                    Experience ex = (Experience) session.getAttribute("detail");
                                    ids = ex.getId();
                                    name = ex.getName();
                                    description = ex.getDescription();
                                    emp = ex.getEmployee().getId();
                                }
                                if (session.getAttribute("message") != null) {
                                    out.println(session.getAttribute("message"));
                                }
                            %>
                            <tr>
                                <td>Id :</td>
                                <td>:</td>
                                <td><input type="text" name="id" value="<%= ids%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Name :</td>
                                <td>:</td>
                                <td><input type="text" name="name" value="<%= name%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Description :</td>
                                <td>:</td>
                                <td><input type="text" name="description" value="<%= description%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Employee :</td>
                                <td>:</td>
                                <td><input type="text" name="emp" value="<%= emp%>" size="25"></td>
                            </tr>
                            <td colspan="2"></td>
                            <td><input type="submit" value="Kirim">
                                </form>
                                <form action="../ViewExperienceServlet" method="post">
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
                                    <td>Employee Name</td>
                                    <td>Aksi Edit</td>
                                    <td>Aksi Delete</td>
                                </tr>
                                <% int i = 1;
                                    for (Experience info : mcon.getAll(new Experience())) {%>                
                                <tr>
                                    <td style="text-align: center"><%= i%></td>
                                    <td><%= info.getId()%></td>
                                    <td><%= info.getName()%></td>
                                    <td><%= info.getDescription()%></td>
                                    <td><%= info.getEmployee().getId()%></td>
                                    <td><a align = "center" href="../EditExperienceServlet?id=<%= info.getId()%>" class="btn btn-outline-primary btn-sm">Edit</a></td>
                                    <td><a align = "center" href="../DeleteExperienceServlet?id=<%= info.getId()%>"class="btn btn-outline-danger btn-sm">Delete</a></td>
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
