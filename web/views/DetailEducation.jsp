<%-- 
    Document   : DetailEducation
    Created on : Feb 11, 2019, 10:02:53 PM
    Author     : Rayhan
--%>

<%@page import="controllers.ControllerInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.util.List"%>
<%@page import="models.Education"%>
<%@page import="tools.NewHibernateUtil"%>
<%@page import="controllers.Controller"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Education Info</title>
    </head>
    <body>
        <h1>Detail Education Info Page</h1>
        <div>
            <%Education c = (Education) session.getAttribute("info");%>
        </div>
        <form method="POST" action="../ViewEducationServlet"> 
            <table>
                <tr>
                    <td>Id :</td>
                    <td>
                        <input type="label" name="id" value="<%=c.getId()%>" readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td>Start :</td>
                    <td>
                        <input type="label" name="id" value="<%=c.getStartDate() %>" readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td>End :</td>
                    <td>
                        <input type="label" name="id" value="<%=c.getEndDate() %>" readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>Ip :</td>
                    <td>
                        <input type="label" name="address" value="<%=c.getIp()%>"readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>Major University :</td>
                    <td>
                        <input type="label" name="phone" value="<%=c.getMajorUniversity().getId()%>"readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>Employee :</td>
                    <td>
                        <input type="label" name="email" value="<%=c.getEmployee().getUserMii().getName() %>"readonly="readonly">
                    </td>
                </tr>

            </table>
            <input type="submit" name="btnSave" value="Back">
        </form>
    </body>
</html>
