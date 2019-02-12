<%-- 
    Document   : DetailUser
    Created on : Feb 11, 2019, 9:25:34 PM
    Author     : NINDA
--%>

<!DOCTYPE html>
<%@page import="controllers.ControllerInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.util.List"%>
<%@page import="models.UserMii"%>
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
            <% ControllerInterface<UserMii> uController = new Controller(NewHibernateUtil.getSessionFactory());
                UserMii u = (UserMii) session.getAttribute("info");%>
        </div>
        <form method="POST" action="../ViewUserServlet"> 
            <table>
                <tr>
                    <td>Id :</td>
                    <td>
                        <input type="label" name="id" value="<%=u.getId()%>" readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td>Password :</td>
                    <td>
                        <input type="label" name="password" value="<%=u.getPassword()%>"readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td>Name :</td>
                    <td>
                        <input type="label" name="phone" value="<%=u.getName()%>"readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td>Email :</td>
                    <td>
                        <input type="label" name="email" value="<%=u.getEmail()%>"readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td>Role :</td>
                    <td>
                        <input type="label" name="role" value="<%=u.getRole().getId()%>"readonly="readonly">
                    </td>
                </tr>

            </table>
            <input type="submit" name="btnSave" value="Back">
        </form>
    </body>
</html>
