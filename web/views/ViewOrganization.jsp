<%-- 
    Document   : ViewOrganization
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
<%@page import="models.Organization" %>
<%
    String ids = "", name = "", position = "", emp = "", s = "", e = "";
    Date start = new Date(), end = new Date();

%>
<!DOCTYPE html>
<html>
    <%        SessionFactory sessionFactory = NewHibernateUtil.getSessionFactory();
        Controller<Organization> mcon = new Controller(sessionFactory);
    %>
    <head>
    </script>
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
                <form action="../SaveOrganizationServlet" method="post">
                    <h4> <font size="5" face="Times New Roman" color="olive" align="center">Organization</font></h4>
                    <table class="zebra-table">
                        <%
                            if (session.getAttribute("detail") != null) {
                                Organization or = (Organization) session.getAttribute("detail");
                                ids = or.getId();
                                name = or.getName();
                                position = or.getPosition();
                                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                start = or.getStartDate();
                                s = sdf.format(start);
                                end = or.getEndDate();
                                e = sdf.format(end);
                                emp = or.getEmployee().getId();
                            }
                            if (session.getAttribute("message") != null) {
                                out.println(session.getAttribute("message"));
                            }
                        %>
                        <input type="hidden" name="id" value="<%= ids%>" size="25"></td>

                        <td>Name </td>
                        <td>:</td>
                        <td><input type="text" name="name" value="<%= name%>" size="25"></td>
                        </tr>
                        <tr>
                            <td>Position </td>
                            <td>:</td>
                            <td><input type="text" name="position" value="<%= position%>" size="25"></td>
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
                        </tr>
                        <tr>
                            <td>Employee Id </td>
                            <td>:</td>
                            <td><input type="text" name="emp" value="<%= emp%>" size="25"></td>
                        </tr>


                        <td colspan="2"></td>
                        <td><input type="submit" value="Kirim">
                            </form>
                            <form action="../ViewOrganizationServlet" method="post">
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
                                for (Organization or : mcon.getAll(new Organization())) {
                                    start = or.getStartDate();
                                    end = or.getEndDate();
                                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                    String st = sdf.format(start);
                                    String en = sdf.format(end);
                            %>                
                            <tr>
                                <td style="text-align: center"><%= i%></td>
                                <td><%= or.getId()%></td>
                                <td><%= or.getName()%></td>
                                <td><%= start%></td>
                                <td><%= end%></td>
                                <td><a align = "center" href="../DetailOrganizationServlet?id=<%= or.getId()%>" class="btn btn-outline-primary btn-sm">Detail</a></td>
                                <td><a align = "center" href="../EditOrganizationServlet?id=<%= or.getId()%>" class="btn btn-outline-primary btn-sm">Edit</a></td>
                                <td><a align = "center" href="../DeleteOrganizationServlet?id=<%= or.getId()%>"class="btn btn-outline-danger btn-sm">Delete</a></td>
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
