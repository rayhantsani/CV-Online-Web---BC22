<%-- 
    Document   : ViewEducation
    Created on : Feb 11, 2019, 10:02:39 PM
    Author     : Rayhan
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="models.Employee"%>
<%@page import="models.Education"%>
<%@page import="tools.NewHibernateUtil"%>
<%@page import="controllers.Controller"%>
<%@page import="controllers.ControllerInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Education" %>
<%
    String id = "", ip = "", major_university = "", s = "", e = "", employee = "";
    Date start = new Date(), end = new Date();

%>
<!DOCTYPE html>
<html>
    <%        SessionFactory sessionFactory = NewHibernateUtil.getSessionFactory();
        ControllerInterface<Education> acon = new Controller(sessionFactory);
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style_1.css" rel="stylesheet" type="text/css" />
        <title>Education Page</title>
    </head>
    <body>
        <div id="wrapper">
            <div id="header">

                <form method="POST" action="../index.html"> 
                    <td><input type="submit" value="Home"></td>
                </form>
                <div id="menu_top" align="center">
                    <form action="../SaveEducationServlet" method="post">
                        <h4> <font size="5" face="Times New Roman" color="olive" align="center">Education</font></h4>
                        <table class="zebra-table">
                            <%
                                if (session.getAttribute("detail") != null) {
                                    Education a = (Education) session.getAttribute("detail");
                                    id = a.getId();
                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                    start = a.getStartDate();
                                    s = sdf.format(start);
                                    end = a.getEndDate();
                                    e = sdf.format(end);
                                    ip = a.getIp();
                                    major_university = a.getMajorUniversity().getId();
                                    employee = a.getEmployee().getId();

                                } else {
                                    id = (Integer.parseInt(acon.getMaxId(new Education()).getId()) + 1) + "";
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
                                <td>Start :</td>
                                <td><input type="date" name="start" value="<%= s%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>End :</td>
                                <td><input type="date" name="end" value="<%= e%>" size="25" ></td>
                            </tr>
                            <tr>
                                <td>ip :</td>
                                <td><input type="text" name="ip" value="<%= ip%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Major University :</td>
                                <td><input type="text" name="major_university" value="<%= major_university%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Employee :</td>
                                <td><input type="text" name="employee" value="<%= employee%>" size="25"></td>
                            </tr>

                            <td colspan="2"></td>
                            <td><input type="submit" value="Kirim">
                                </form>
                                <form method="POST" action="../ViewEducationServlet"> 
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
                                    <td>Start</td>
                                    <td>End</td>
                                    <td>IP</td>
                                    <td>Major University</td>
                                    <td>Employee</td>
                                    <td>Aksi Detail</td>
                                    <td>Aksi Edit</td>
                                    <td>Aksi Delete</td>
                                </tr>
                                <% int i = 1;
                                    for (Education education : acon.getAll(new Education())) {%>                
                                <tr>
                                    <td style="text-align: center"><%= i%></td>
                                    <td><%= education.getId()%></td>
                                    <td><%= education.getStartDate() %></td>
                                    <td><%= education.getEndDate() %></td>
                                    <td><%= education.getIp()%></td>
                                    <td><%= education.getMajorUniversity().getId()%></td>
                                    <td><%= education.getEmployee().getId()%></td>
                                    <td><a align = "center" href="../DetailEducationServlet?id=<%= education.getId()%>"class="btn btn-outline-success btn-sm">Detail</a></td> 
                                    <td><a align = "center" href="../EditEducationServlet?id=<%= education.getId()%>" class="btn btn-outline-primary btn-sm">Edit</a></td>
                                    <td><a align = "center" href="../DeleteEducationServlet?id=<%= education.getId()%>"class="btn btn-outline-danger btn-sm">Delete</a></td>
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
