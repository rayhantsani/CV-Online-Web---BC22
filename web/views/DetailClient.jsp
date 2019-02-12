<%-- 
    Document   : DetailClient
    Created on : Feb 11, 2019, 8:37:11 PM
    Author     : Rayhan
--%>


<%@page import="controllers.ControllerInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.util.List"%>
<%@page import="models.Client"%>
<%@page import="tools.NewHibernateUtil"%>
<%@page import="controllers.Controller"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Client Info</title>
    </head>
    <body>
        <h1>Detail Client Info Page</h1>
        <div>
            <%Client c = (Client) session.getAttribute("info");%>
        </div>
        <form method="POST" action="../ViewClientServlet"> 
            <table>
                <tr>
                    <td>Id :</td>
                    <td>
                        <input type="label" name="id" value="<%=c.getId()%>" readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>Address :</td>
                    <td>
                        <input type="label" name="address" value="<%=c.getAddress()%>"readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>Bussiness :</td>
                    <td>
                        <input type="label" name="phone" value="<%=c.getBusiness()%>"readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>Is Delete :</td>
                    <td>
                        <input type="label" name="email" value="<%=c.getIsDelete()%>"readonly="readonly">
                    </td>
                </tr>

            </table>
            <input type="submit" name="btnSave" value="Back">
        </form>
    </body>
</html>

