<%-- 
    Document   : DetailCertification
    Created on : Feb 11, 2019, 7:30:25 PM
    Author     : Rayhan
--%>

<%@page import="controllers.ControllerInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.util.List"%>
<%@page import="models.Certification"%>
<%@page import="tools.NewHibernateUtil"%>
<%@page import="controllers.Controller"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Certification</title>
    </head>
    <body>
        <h1>Detail Certification Page</h1>
        <div>
            <% Certification mi = (Certification) session.getAttribute("info");%>
        </div>
        <form method="POST" action="../ViewCertificationServlet"> 
            <table>
                <tr>
                    <td>Id :</td>
                    <td>
                        <input type="label" name="id" value="<%=mi.getId()%>" readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>Name :</td>
                    <td>
                        <input type="label" name="address" value="<%=mi.getName()%>"readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td>Expired Date :</td>
                    <td>
                        <input type="label" name="expired" value="<%=mi.getExpiredDate()%>"readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>Description :</td>
                    <td>
                        <input type="label" name="phone" value="<%=mi.getDescription()%>"readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>Employee :</td>
                    <td>
                        <input type="label" name="email" value="<%=mi.getEmployee().getUserMii().getName() %>"readonly="readonly">
                    </td>
                </tr>

            </table>
                   <input type="submit" name="btnSave" value="Back">
        </form>
    </body>
</html>
