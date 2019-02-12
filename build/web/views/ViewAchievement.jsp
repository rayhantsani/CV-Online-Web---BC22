<%-- 
    Document   : ViewAchievement
    Created on : Feb 11, 2019, 1:29:18 PM
    Author     : Rayhan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="models.Employee"%>
<%@page import="models.Achievement"%>
<%@page import="tools.NewHibernateUtil"%>
<%@page import="controllers.Controller"%>
<%@page import="controllers.ControllerInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page import="menu.menu" %>--%>
<%@page import="models.MiiInfo" %>
<%
    String id = "", name = "", description = "", employee = "", keyword = "", category = "";

%>
<!DOCTYPE html>
<html>
    <%        SessionFactory sessionFactory = NewHibernateUtil.getSessionFactory();
        ControllerInterface<Achievement> acon = new Controller(sessionFactory);
        List<Achievement> ac = new ArrayList<Achievement>();
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style_1.css" rel="stylesheet" type="text/css" />
        <title>Achievement Page</title>
    </head>
    <body>
        <div id="wrapper">
            <div id="header">

                <form method="POST" action="../index.html"> 
                    <td><input type="submit" value="Home"></td>
                </form>

                <form action="../SearchAchievementServlet" method="post">
                    <%
                        if (session.getAttribute("list") == null) {
                            ac = acon.getAll(new Achievement());
                        } else {
                            ac = (List<Achievement>) session.getAttribute("list");
                        }
                    %>

                    <tr>
                        <td>Search :</td>
                        <td><input type="text" name="keyword" value="<%= keyword%>" size="25"></td>
                        <td><select name="category"> 
                                <option value="id">Id</option>
                                <option value="name">Name</option>
                                <option value="description">Description</option>
                        </td></select>
                    </tr>
                    <td><input type="submit" value="Search"></td>
                    

                </form>

                <div id="menu_top" align="center">
                    <form action="../SaveAchievementServlet" method="post">
                        <h4> <font size="5" face="Times New Roman" color="olive" align="center">Achievement</font></h4>
                        <table class="zebra-table">
                            <%
                                if (session.getAttribute("detail") != null) {
                                    Achievement a = (Achievement) session.getAttribute("detail");
                                    id = a.getId();
                                    name = a.getName();
                                    description = a.getDescription();
                                    employee = a.getEmployee().getId();

                                } else {
                                    id = (Integer.parseInt(acon.getMaxId(new Achievement()).getId()) + 1) + "";
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
                                <td>Description :</td>
                                <td><input type="text" name="description" value="<%= description%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Employee :</td>
                                <td><input type="text" name="employee" value="<%= employee%>" size="25"></td>
                            </tr>

                            <td colspan="2"></td>
                            <td><input type="submit" value="Kirim"></td>
                    </form>
                    <form method="POST" action="../ViewAchievementServlet"> 
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
                                    <td>Employee</td>
                                    <td>Aksi Detail</td>
                                    <td>Aksi Edit</td>
                                    <td>Aksi Delete</td>
                                </tr>
                                <% int i = 1;
                                    for (Achievement achievement : ac) {
                                %>

                                <tr>
                                    <td style="text-align: center"><%= i%></td>
                                    <td><%= achievement.getId()%></td>
                                    <td><%= achievement.getName()%></td>
                                    <td><%= achievement.getDescription()%></td>
                                    <td><%= achievement.getEmployee().getId()%></td>
                                    <td><a align = "center" href="../DetailAchievementServlet?id=<%= achievement.getId()%>"class="btn btn-outline-success btn-sm">Detail</a></td> 
                                    <td><a align = "center" href="../EditAchievementServlet?id=<%= achievement.getId()%>" class="btn btn-outline-primary btn-sm">Edit</a></td>
                                    <td><a align = "center" href="../DeleteAchievementServlet?id=<%= achievement.getId()%>"class="btn btn-outline-danger btn-sm">Delete</a></td>
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
