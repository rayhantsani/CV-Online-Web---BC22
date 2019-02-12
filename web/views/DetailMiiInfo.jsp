<%-- 
    Document   : DetailMiiInfo
    Created on : Feb 10, 2019, 6:52:03 PM
    Author     : NINDA
--%>

<%@page import="controllers.ControllerInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.util.List"%>
<%@page import="models.MiiInfo"%>
<%@page import="tools.NewHibernateUtil"%>
<%@page import="controllers.Controller"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Mii Info</title>
    </head>
    <body>
        <h1>Detail Mii Info Page</h1>
        <div>
            <%MiiInfo mi = (MiiInfo) session.getAttribute("info");%>
        </div>
        <form method="POST" action="../ViewMiiInfoServlet"> 
            <table>
                <tr>
                    <td>Id :</td>
                    <td>
                        <input type="label" name="id" value="<%=mi.getId()%>" readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>Address :</td>
                    <td>
                        <input type="label" name="address" value="<%=mi.getAddress()%>"readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>Phone :</td>
                    <td>
                        <input type="label" name="phone" value="<%=mi.getPhone()%>"readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>Email :</td>
                    <td>
                        <input type="label" name="email" value="<%=mi.getEmail()%>"readonly="readonly">
                    </td>
                </tr>

            </table>
            <input type="submit" name="btnSave" value="Back">
        </form>
    </body>
</html>
