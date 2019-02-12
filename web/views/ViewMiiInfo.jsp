<%-- 
    Document   : ViewMiiInfo
    Created on : 11-Feb-2019, 09:50:23
    Author     : Rayhan
--%>


<%@page import="tools.NewHibernateUtil"%>
<%@page import="controllers.Controller"%>
<%@page import="controllers.ControllerInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page import="menu.menu" %>--%>
<%@page import="models.MiiInfo" %>
<%
    String ids = "", email = "", address = "", phone = "";

%>
<!DOCTYPE html>
<html>
    <%        SessionFactory sessionFactory = NewHibernateUtil.getSessionFactory();
        ControllerInterface<MiiInfo> mcon = new Controller(sessionFactory);
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style_1.css" rel="stylesheet" type="text/css" />
        <title>MII Info Page</title>
    </head>

    <body>
        <div id="wrapper">
            <div id="header">
                <form method="POST" action="../index.html"> 
                    <td><input type="submit" value="Home"></td>
                </form>

                <div id="menu_top" align="center">
                    <form action="../SaveMiiInfoServlet" method="post">
                        <h4> <font size="5" face="Times New Roman" color="olive" align="center">Mii Info</font></h4>
                        <table class="zebra-table">
                            <%
                                if (session.getAttribute("detail") != null) {
                                    MiiInfo mi = (MiiInfo) session.getAttribute("detail");
                                    ids = mi.getId();
                                    email = mi.getEmail();
                                    address = mi.getAddress();
                                    phone = mi.getPhone();
                                } else {
                                    ids = (Integer.parseInt(mcon.getMaxId(new MiiInfo()).getId()) + 1) + "";
                                }
                                if (session.getAttribute("message") != null) {
                                    out.println(session.getAttribute("message"));
                                }
                            %>
                            <tr>
                                <td>Id :</td>
                                <td><input type="text" name="id" value="<%= ids%>" size="25" readonly="readonly"></td>
                            </tr>
                            <tr>
                                <td>Email :</td>
                                <td><input type="text" name="email" value="<%= email%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Address :</td>
                                <td><input type="text" name="address" value="<%= address%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Phone :</td>
                                <td><input type="text" name="phone" value="<%= phone%>" size="25"></td>
                            </tr>

                            <td colspan="2"></td>
                            <td><input type="submit" value="Kirim">
                    </form>
                                <form method="POST" action="../ViewMiiInfoServlet"> 
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
                                    <td>Phone</td>
                                    <td>Email</td>
                                    <td>Aksi Detail</td>
                                    <td>Aksi Edit</td>
                                    <td>Aksi Delete</td>
                                </tr>
                                <% int i = 1;
                                    for (MiiInfo info : mcon.getAll(new MiiInfo())) {%>                
                                <tr>
                                    <td style="text-align: center"><%= i%></td>
                                    <td><%= info.getId()%></td>
                                    <td><%= info.getAddress()%></td>
                                    <td><%= info.getPhone()%></td>
                                    <td><%= info.getEmail()%></td>
                                    <td><a align = "center" href="../DetailMiiInfoServlet?id=<%= info.getId()%>"class="btn btn-outline-success btn-sm">Detail</a></td> 
                                    <td><a align = "center" href="../EditMiiInfoServlet?id=<%= info.getId()%>" class="btn btn-outline-primary btn-sm">Edit</a></td>
                                    <td><a align = "center" href="../DeleteMiiInfoServlet?id=<%= info.getId()%>"class="btn btn-outline-danger btn-sm">Delete</a></td>
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
