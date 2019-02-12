<%-- 
    Document   : ViewEmployee
    Created on : Feb 11, 2019, 11:03:07 PM
    Author     : Rayhan
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="tools.NewHibernateUtil"%>
<%@page import="controllers.Controller"%>
<%@page import="controllers.ControllerInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page import="menu.menu" %>--%>
<%@page import="models.Employee" %>
<%
    String ids = "", religion = "", phone = "", marital_status = "", nationality = "", b = "", s = "", e = "", is_delete = "";
    Date birth = new Date(), start = new Date(), end = new Date();
%>
<!DOCTYPE html>
<html>
    <%        SessionFactory sessionFactory = NewHibernateUtil.getSessionFactory();
        ControllerInterface<Employee> mcon = new Controller(sessionFactory);
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
                    <form action="../SaveEmployeeServlet" method="post">
                        <h4> <font size="5" face="Times New Roman" color="olive" align="center">Employee Info</font></h4>
                        <table class="zebra-table">
                            <%
                                if (session.getAttribute("detail") != null) {
                                    Employee mi = (Employee) session.getAttribute("detail");
                                    ids = mi.getId();
                                    religion = mi.getReligion();
                                    phone = mi.getPhone();
                                    marital_status = mi.getMaritalStatus();
                                    nationality = mi.getNationality();
                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                    birth = mi.getBirthDate();
                                    b = sdf.format(birth);
                                    start = mi.getStartDate();
                                    s = sdf.format(start);

                                    if (mi.getEndDate() != null) {
                                        end = mi.getEndDate();
                                        e = sdf.format(end);
                                    } else {
                                        e = null;
                                    }
                                    is_delete = mi.getIsDelete();
                                } else {
                                    ids = (Integer.parseInt(mcon.getMaxId(new Employee()).getId()) + 1) + "";
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
                                <td>Religion :</td>
                                <td><input type="text" name="religion" value="<%= religion%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Phone :</td>
                                <td><input type="text" name="phone" value="<%= phone%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Marital Status :</td>
                                <td><input type="text" name="marital_status" value="<%= marital_status%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Nationality :</td>
                                <td><input type="text" name="nationality" value="<%= nationality%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Birth Date :</td>
                                <td><input type="date" name="birth" value="<%= b%>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Start Date :</td>
                                <td><input type="date" name="start" value="<%= s %>" size="25"></td>
                            </tr>
                            <tr>
                                <td>End Date :</td>
                                <td><input type="date" name="end" value="<%= e %>" size="25"></td>
                            </tr>
                            <tr>
                                <td>Is Delete :</td>
                                <td><input type="text" name="is_delete" value="<%= is_delete%>" size="25"></td>
                            </tr>

                            <td colspan="2"></td>
                            <td><input type="submit" value="Kirim">
                                </form>
                                <form method="POST" action="../ViewEmployeeServlet"> 
                                    <td><input type="submit" name="btnSave" value="Reset"></td>
                                </form>
                                </tr>
                        </table>
                </div>
                <div id="content">
                    <div class ="content">
                        <center><table border="1">
                                <tr><td>No</td>
                                    <td>Id</td>
                                    <td>Religion</td>
                                    <td>Phone</td>
                                    <td>Marital Status</td>
                                    <td>Nationality</td>
                                    <td>Birth</td>
                                    <td>Start</td>
                                    <td>End</td>
                                    <td>Is Delete</td>
                                    <td>Aksi Detail</td>
                                    <td>Aksi Edit</td>
                                    <td>Aksi Delete</td>
                                </tr>
                                <% int i = 1;
                                    for (Employee info : mcon.getAll(new Employee())) {%>                
                                <tr>
                                    <td style="text-align: center"><%= i%></td>
                                    <td><%= info.getId()%></td>
                                    <td><%= info.getReligion()%></td>
                                    <td><%= info.getPhone()%></td>
                                    <td><%= info.getMaritalStatus()%></td>
                                    <td><%= info.getNationality()%></td>
                                    <td><%= info.getBirthDate()%></td>
                                    <td><%= info.getStartDate()%></td>
                                    <td><%= info.getEndDate()%></td>
                                    <td><%= info.getIsDelete()%></td>
                                    <td><a align = "center" href="../DetailEmployeeServlet?id=<%= info.getId()%>"class="btn btn-outline-success btn-sm">Detail</a></td> 
                                    <td><a align = "center" href="../EditEmployeeServlet?id=<%= info.getId()%>" class="btn btn-outline-primary btn-sm">Edit</a></td>
                                    <td><a align = "center" href="../DeleteEmployeeServlet?id=<%= info.getId()%>"class="btn btn-outline-danger btn-sm">Delete</a></td>
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
