<%-- 
    Document   : DetailProjectEmployee
    Created on : Feb 10, 2019, 6:52:03 PM
    Author     : NINDA
--%>

<%@page import="controllers.ControllerInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.util.List"%>
<%@page import="models.ProjectEmployee"%>
<%@page import="tools.NewHibernateUtil"%>
<%@page import="controllers.Controller"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Project Employee</title>
    </head>
    <body>
        <h1>Detail Project Employee</h1>
        <div>
            <% ControllerInterface<ProjectEmployee> mcon = new Controller(NewHibernateUtil.getSessionFactory());
                ProjectEmployee mi = (ProjectEmployee) session.getAttribute("info");%>
        </div>
        <form method="POST" action="../ViewPEServlet"> 
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
                        <input type="label" name="start" value="<%=mi.getStartDate()%>"readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>Phone :</td>
                    <td>
                        <input type="label" name="end" value="<%=mi.getEndDate()%>"readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>Job Description :</td>
                    <td>
                        <input type="label" name="job" value="<%=mi.getJobDescription()%>"readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>Status :</td>
                    <td>
                        <input type="label" name="job" value="<%=mi.getProjectEmployeeStatus()%>"readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>Employee :</td>
                    <td>
                        <input type="label" name="job" value="<%=mi.getEmployee().getUserMii().getName()%>"readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>Project :</td>
                    <td>
                        <input type="label" name="job" value="<%=mi.getProject().getName()%>"readonly="readonly">
                    </td>
                </tr>

            </table>
            <input type="submit" name="btnSave" value="Back">
        </form>
    </body>
</html>
