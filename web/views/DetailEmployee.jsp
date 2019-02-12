<%-- 
    Document   : DetailEmployee
    Created on : Feb 11, 2019, 11:02:54 PM
    Author     : Rayhan
--%>

<%@page import="controllers.ControllerInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.util.List"%>
<%@page import="models.Employee"%>
<%@page import="tools.NewHibernateUtil"%>
<%@page import="controllers.Controller"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail Employee Info</title>
    </head>
    <body>
        <h1>Detail Employee Info Page</h1>
        <div>
            <%Employee mi = (Employee) session.getAttribute("info");%>
        </div>
        <form method="POST" action="../ViewEmployeeServlet"> 
            <table>
                <tr>
                    <td>Id :</td>
                    <td>
                        <input type="label" name="id" value="<%=mi.getId()%>" readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>Religion :</td>
                    <td>
                        <input type="label" name="religion" value="<%=mi.getReligion()%>"readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>Phone :</td>
                    <td>
                        <input type="label" name="phone" value="<%=mi.getPhone()%>"readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>Marital Status :</td>
                    <td>
                        <input type="label" name="marital_status" value="<%=mi.getMaritalStatus()%>"readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td>Nationality :</td>
                    <td>
                        <input type="label" name="nationality" value="<%=mi.getNationality()%>"readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td>Birth :</td>
                    <td>
                        <input type="label" name="nationality" value="<%=mi.getBirthDate()%>"readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td>Start :</td>
                    <td>
                        <input type="label" name="nationality" value="<%=mi.getStartDate()%>"readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td>End :</td>
                    <td>
                        <input type="label" name="nationality" value="<%=mi.getEndDate()%>"readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td>Is Delete :</td>
                    <td>
                        <input type="label" name="is_delete" value="<%=mi.getIsDelete()%>"readonly="readonly">
                    </td>
                </tr>

            </table>
            <input type="submit" name="btnSave" value="Back">
        </form>
    </body>
</html>

