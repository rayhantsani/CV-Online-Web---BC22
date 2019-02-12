<%-- 
    Document   : DetailProject
    Created on : Feb 10, 2019, 6:52:03 PM
    Author     : NINDA
--%>

<%@page import="controllers.ControllerInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.util.List"%>
<%@page import="models.Project"%>
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
        <h1>Detail Mii Info</h1>
        <div>
            <% ControllerInterface<Project> mcon = new Controller(NewHibernateUtil.getSessionFactory());
                Project mi = (Project) session.getAttribute("info");%>
        </div>
        <form method="POST" action="../ViewProjectServlet"> 
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
                        <input type="label" name="name" value="<%=mi.getName()%>"readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>Start Date :</td>
                    <td>
                        <input type="label" name="start" value="<%=mi.getStartDate()%>"readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>End Date :</td>
                    <td>
                        <input type="label" name="end" value="<%=mi.getEndDate() %>"readonly="readonly">
                    </td>
                </tr>
                
                <tr>
                    <td>Assessment :</td>
                    <td>
                        <input type="label" name="assessment" value="<%=mi.getAssessment() %>"readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td>Specification :</td>
                    <td>
                        <input type="label" name="specification" value="<%=mi.getProjectSpecification() %>"readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td>Status :</td>
                    <td>
                        <input type="label" name="assessment" value="<%=mi.getProjectStatus() %>"readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td>Client :</td>
                    <td>
                        <input type="label" name="client" value="<%=mi.getClient().getUserMii().getName() %>"readonly="readonly">
                    </td>
                </tr>

            </table>
            <input type="submit" name="btnSave" value="Back">
        </form>
    </body>
</html>
