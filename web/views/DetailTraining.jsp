<%-- 
    Document   : DetailTraining
    Created on : Feb 11, 2019, 5:07:25 PM
    Author     : NINDA
--%>

<%@page import="controllers.ControllerInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.util.List"%>
<%@page import="models.Training"%>
<%@page import="tools.NewHibernateUtil"%>
<%@page import="controllers.Controller"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Detail Training</h1>
        <div>
            <% ControllerInterface<Training> tController = new Controller(NewHibernateUtil.getSessionFactory());
                Training train = (Training) session.getAttribute("info");%>
        </div>
        <form method="POST" action="../ViewTrainingServlet"> 
            <table>
                <tr>
                    <td>Id :</td>
                    <td>
                        <input type="label" name="id" value="<%=train.getId()%>" readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td>Name :</td>
                    <td>
                        <input type="label" name="name" value="<%=train.getName()%>"readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td>Description :</td>
                    <td>
                        <input type="label" name="description" value="<%=train.getDescription()%>"readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td>Certificate :</td>
                    <td>
                        <input type="label" name="certificate" value="<%=train.getCertificate()%>"readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td>Employee :</td>
                    <td>
                        <input type="label" name="employee" value="<%=train.getEmployee().getUserMii().getName()%>"readonly="readonly">
                    </td>
                </tr>

            </table>
            <input type="submit" name="btnSave" value="Back">
        </form>
    </body>
</html>

