<%-- 
    Document   : DetailQE
    Created on : Feb 11, 2019, 2:43:51 PM
    Author     : NINDA
--%>
<%@page import="controllers.ControllerInterface"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.util.List"%>
<%@page import="models.QualificationEmployee"%>
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
               <h1>Detail Qualification Employee</h1>
        <div>
            <% ControllerInterface<QualificationEmployee> qeController = new Controller(NewHibernateUtil.getSessionFactory());
                QualificationEmployee qe = (QualificationEmployee) session.getAttribute("info");%>
        </div>
        <form method="POST" action="../ViewQEServlet"> 
            <table>
                <tr>
                    <td>Id :</td>
                    <td>
                        <input type="label" name="id" value="<%=qe.getId()%>" readonly="readonly">
                    </td>
                </tr>
                <tr>
                    <td>Employee :</td>
                    <td>
                        <input type="label" name="phone" value="<%=qe.getEmployee().getUserMii().getName()%>"readonly="readonly">
                    </td>
                </tr>

                <tr>
                    <td>Qualification :</td>
                    <td>
                        <input type="label" name="address" value="<%=qe.getQualification().getName()%>"readonly="readonly">
                    </td>
                </tr>

            </table>
                   <input type="submit" name="btnSave" value="Back">
        </form>
    </body>
</html>
