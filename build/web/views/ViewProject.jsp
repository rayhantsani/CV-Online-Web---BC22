<%-- 
    Document   : ViewProject
    Created on : 11-Feb-2019, 09:50:23
    Author     : kresna92
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="tools.NewHibernateUtil"%>
<%@page import="controllers.Controller"%>
<%@page import="controllers.ControllerInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page import="menu.menu" %>--%>
<%@page import="models.Project" %>
<%
    String ids = "", name = "", assessment = "", specification = "", status = "", client = "", s = "", e = "";
    Date start = null, end = null;

%>
<!DOCTYPE html>
<html>
    <%        SessionFactory sessionFactory = NewHibernateUtil.getSessionFactory();
        Controller<Project> mcon = new Controller(sessionFactory);
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
                    <form action="../SaveProjectServlet" method="post">
                        <h4> <font size="5" face="Times New Roman" color="olive" align="center">Project Employee</font></h4>
                        <table class="zebra-table">
                            <%
                                if (session.getAttribute("detail") != null) {
                                    Project project = (Project) session.getAttribute("detail");
                                    ids = project.getId();
                                    name = project.getName();
                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                    start = project.getStartDate();
                                    s = sdf.format(start);
                                    end = project.getEndDate();
                                    e = sdf.format(end);
                                    assessment = project.getAssessment();
                                    specification = project.getProjectSpecification();
                                    status = project.getProjectStatus();
                                    client = project.getClient().getId();
                                }
                                if (session.getAttribute("message") != null) {
                                    out.println(session.getAttribute("message"));
                                }
                            %>
                            <tr>
                                <td>Id </td>
                                <td>:</td>
                                <td><input type="text" name="id" value="<%= ids%>" size="25"></td>
                            </tr>
                            <tr>
                            <tr>
                                <td>Name </td>
                                <td>:</td>
                                <td><input type="text" name="name" value="<%= name%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Start </td>
                                <td>:</td>
                                <td><input type="date" name="start"  value="<%= s%>"></td>
                            </tr>
                            <tr>
                                <td>End </td>
                                <td>:</td>
                                <td><input type="date" name="end"  value="<%= e%>"></td>
                            </tr>

                            <tr>
                                <td>Assessment </td>
                                <td>:</td>
                                <td><input type="text" name="assessment" value="<%= assessment%>" size="25"></td>
                            </tr>
                            <tr>
                            <tr>
                                <td>Specification </td>
                                <td>:</td>
                                <td><input type="text" name="specification" value="<%= specification%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Status </td>
                                <td>:</td>
                                <td><input type="text" name="status" value="<%= status%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Client </td>
                                <td>:</td>
                                <td><input type="text" name="client" value="<%= client%>" size="25"></td>
                            </tr>

                            <td colspan="2"></td>
                            <td><input type="submit" value="Kirim">
                                </form>
                                <form action="../ViewProjectServlet" method="post">
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
                                    <td>Start Date</td>
                                    <td>End Date</td>
                                    <td>Aksi Detail</td>
                                    <td>Aksi Edit</td>
                                    <td>Aksi Delete</td>
                                </tr>
                                <% int i = 1;
                                    for (Project project : mcon.getAll(new Project())) {
                                        start = project.getStartDate();
                                        end = project.getEndDate();
                                        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
                                        String st = sdf.format(start);
                                        String en = sdf.format(end);%>                
                                <tr>
                                    <td style="text-align: center"><%= i%></td>
                                    <td><%= project.getId()%></td>
                                    <td><%= project.getName()%></td>
                                    <td><%= st%></td>
                                    <td><%= en%></td>
                                    <td><a align = "center" href="../DetailProjectServlet?id=<%= project.getId()%>" class="btn btn-outline-primary btn-sm">Detail</a></td>
                                    <td><a align = "center" href="../EditProjectServlet?id=<%= project.getId()%>" class="btn btn-outline-primary btn-sm">Edit</a></td>
                                    <td><a align = "center" href="../DeleteProjectServlet?id=<%= project.getId()%>"class="btn btn-outline-danger btn-sm">Delete</a></td>
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
