<%-- 
    Document   : DetailOrganization
    Created on : Feb 10, 2019, 6:52:03 PM
    Author     : NINDA
--%>

<%@page import="controllers.ControllerInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.util.List"%>
<%@page import="models.Organization"%>
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
            <% ControllerInterface<Organization> mcon = new Controller(NewHibernateUtil.getSessionFactory());
                Organization mi = (Organization) session.getAttribute("info");%>
        </div>
        <form method="POST" action="../ViewOrganizationServlet"> 
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
                    <td>Position :</td>
                    <td>
                        <input type="label" name="phone" value="<%=mi.getPosition()%>"readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>Start Date :</td>
                    <td>
                        <input type="label" name="email" value="<%=mi.getStartDate()%>"readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>End Date :</td>
                    <td>
                        <input type="label" name="email" value="<%=mi.getEndDate()%>"readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>Employee Name :</td>
                    <td>
                        <input type="label" name="email" value="<%=mi.getEmployee().getUserMii().getName()%>"readonly="readonly">
                    </td>
                </tr>

            </table>
            <input type="submit" name="btnSave" value="Back">
        </form>
    </body>
</html>
