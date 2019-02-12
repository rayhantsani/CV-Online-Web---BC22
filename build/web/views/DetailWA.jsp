<%-- 
    Document   : DetailWA
    Created on : Feb 11, 2019, 9:26:37 PM
    Author     : NINDA
--%>

<%@page import="controllers.ControllerInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.util.List"%>
<%@page import="models.WorkAssignment"%>
<%@page import="tools.NewHibernateUtil"%>
<%@page import="controllers.Controller"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Organization</title>
    </head>
    <body>
        <h1>Detail Organization</h1>
        <div>
            <% ControllerInterface<WorkAssignment> waController = new Controller(NewHibernateUtil.getSessionFactory());
                WorkAssignment wa = (WorkAssignment) session.getAttribute("info");%>
        </div>
        <form method="POST" action="../ViewWAServlet"> 
            <table>
                <tr>
                    <td>Id :</td>
                    <td>
                        <input type="label" name="id" value="<%=wa.getId()%>" readonly="readonly">
                    </td>
                </tr>
                
                                <tr>
                    <td>Start Date :</td>
                    <td>
                        <input type="label" name="start" value="<%=wa.getStartDate()%>"readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>End Date :</td>
                    <td>
                        <input type="label" name="end" value="<%=wa.getEndDate()%>"readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>Position :</td>
                    <td>
                        <input type="label" name="position" value="<%=wa.getPosition()%>"readonly="readonly">
                    </td>
                </tr>

                <tr>

                <tr>
                    <td>Company :</td>
                    <td>
                        <input type="label" name="company" value="<%=wa.getCompany()%>"readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td>Job Description :</td>
                    <td>
                        <input type="label" name="email" value="<%=wa.getJobDescription()%>"readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td>Employee Name :</td>
                    <td>
                        <input type="label" name="email" value="<%=wa.getEmployee().getUserMii().getName()%>"readonly="readonly">
                    </td>
                </tr>

            </table>
            <input type="submit" name="btnSave" value="Back">
        </form>
    </body>
</html>
