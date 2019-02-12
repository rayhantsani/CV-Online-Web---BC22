<%-- 
    Document   : ViewWA
    Created on : Feb 11, 2019, 9:26:26 PM
    Author     : NINDA
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="models.WorkAssignment"%>
<%@page import="tools.NewHibernateUtil"%>
<%@page import="controllers.Controller"%>
<%@page import="controllers.ControllerInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page import="menu.menu" %>--%>
<%
    String id = "", position = "", company = "", description = "", employee = "", s = "", e = "", keyword = "", category = "";
    Date start = new Date(), end = new Date();

%>
<!DOCTYPE html>
<html>
    <%        SessionFactory sessionFactory = NewHibernateUtil.getSessionFactory();
        Controller<WorkAssignment> waController = new Controller(sessionFactory);
        List<WorkAssignment> lwa = new ArrayList<WorkAssignment>();
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style_1.css" rel="stylesheet" type="text/css" />
        <title>Work Assignment Page</title>
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <form method="POST" action="../index.html">
                    <td><input type="submit" value="Home"></td>
                </form>

                <form action="../SearchWAServlet" method="post">
                    <%
                        if (session.getAttribute("list") == null) {
                            lwa = waController.getAll(new WorkAssignment());
                        } else {
                            lwa = (List<WorkAssignment>) session.getAttribute("list");
                        }
                    %>

                    <tr>
                        <td>Search :</td>
                        <td><input type="text" name="keyword" value="<%= keyword%>" size="25"></td>
                        <td><select name="category"> 
                                <option value="id">Id</option>
                                <option value="position">Position</option>
                                <option value="company">Company</option>
                                <option value="description">Description</option>
                        </td></select>
                    </tr>
                    <td><input type="submit" value="Search"></td>


                </form>

                <div id="menu_top" align="center">
                    <form action="../SaveWAServlet" method="post">
                        <h4> <font size="5" face="Times New Roman" color="olive" align="center">Work Assignment</font></h4>
                        <table class="zebra-table">
                            <%
                                if (session.getAttribute("detail") != null) {
                                    WorkAssignment wa = (WorkAssignment) session.getAttribute("detail");
                                    id = wa.getId();
                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                    start = wa.getStartDate();
                                    s = sdf.format(start);
                                    end = wa.getEndDate();
                                    e = sdf.format(end);
                                    position = wa.getPosition();
                                    company = wa.getCompany();
                                    description = wa.getJobDescription();
                                    employee = wa.getEmployee().getId();

                                } else {
                                    id = (Integer.parseInt(waController.getMaxId(new WorkAssignment()).getId()) + 1) + "";
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
                                <td>Position :</td>
                                <td>:</td>
                                <td><input type="text" name="position" value="<%= position%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Company :</td>
                                <td>:</td>
                                <td><input type="text" name="company" value="<%= company%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Description :</td>
                                <td>:</td>
                                <td><input type="text" name="description" value="<%= description%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Employee :</td>
                                <td>:</td>
                                <td><input type="text" name="employee" value="<%= employee%>" size="25"></td>
                            </tr>

                            <td colspan="2"></td>
                            <td><input type="submit" value="Kirim">
                                </form>
                                <form method="POST" action="../ViewWAServlet">
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
                                    <td>Start Date</td>
                                    <td>End Date</td>
                                    <td>Position</td>
                                    <td>Company</td>
                                    <td>Description</td>
                                    <td>Employee</td>

                                    <td>Aksi Detail</td>
                                    <td>Aksi Edit</td>
                                    <td>Aksi Delete</td>
                                </tr>
                                <% int i = 1;
                                    for (WorkAssignment was : lwa) {
                                %>                
                                <tr>
                                    <td style="text-align: center"><%= i%></td>
                                    <td><%= was.getId()%></td>
                                    <td><%= was.getStartDate()%></td>
                                    <td><%= was.getEndDate()%></td>
                                    <td><%= was.getPosition()%></td>
                                    <td><%= was.getCompany()%></td>
                                    <td><%= was.getJobDescription()%></td>
                                    <td><%= was.getEmployee().getId()%></td>

                                    <td><a align = "center" href="../DetailWAServlet?id=<%= was.getId()%>"class="btn btn-outline-success btn-sm">Detail</a></td> 
                                    <td><a align = "center" href="../EditWAServlet?id=<%= was.getId()%>" class="btn btn-outline-primary btn-sm">Edit</a></td>
                                    <td><a align = "center" href="../DeleteWAServlet?id=<%= was.getId()%>"class="btn btn-outline-danger btn-sm">Delete</a></td>
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
