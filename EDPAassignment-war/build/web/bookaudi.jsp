<%@page import="model.AuditoriumFacade"%>
<%@page import="java.util.List"%>
<%@page import="model.Auditorium"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%!
    Context ct;
    AuditoriumFacade AuditoriumFacade;
%>
<%
    ct = new InitialContext();
    AuditoriumFacade = (AuditoriumFacade) ct.lookup("java:global/EDPAassignment/EDPAassignment-ejb/AuditoriumFacade");
%>

<script>
    function showAudi()
    {
        var aid = document.getElementById("id").value;
        var adate = document.getElementById("bdate").value;

        document.getElementById("selectedAudi").innerHTML = aid;
        document.getElementById("selectedDate").innerHTML = adate;
        document.getElementById("myDate").min = new Date().getFullYear() + "-" +  parseInt(new Date().getMonth() + 1 ) + "-" + new Date().getDate()
    }
    function dateenable()
    {
        document.getElementById("bdate").disabled = false;


    }
</script>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Auditorium Page</title>
    </head>
    <body>
        <h1 style="text-align: center">
            Book Auditorium Page
        </h1>
        <div align="center">
            <jsp:include page="link.jsp"/>
            <form action="BookAudi" method="POST">
                <table> 
                    <tr>
                        <td>Select Auditorium:</td>
                        <td>

                            <select name="id" id="id" onchange="dateenable()">
                                <%
                                    List<Auditorium> rm = AuditoriumFacade.findAll();
                                    for (Auditorium j : rm) {
                                %>
                                <option value="<%=j.getId()%>"><%=j.getId()%></option>
                                <%
                                    }
                                %>
                            </select>           
                        </td> </tr>     
                    <td>
                        Booking time:
                        <select id="time" name="time">
                            <option value="" disabled="disabled" selected="selected">Select time</option>
                            <option value="0800-0900">0800-0900</option>
                            <option value="0900-1000">0900-1000</option>
                            <option value="1000-1100">1000-1100</option>
                            <option value="1200-1300">1200-1300</option>
                            <option value="1300-1400">1300-1400</option>
                            <option value="1400-1500">1400-1500</option>
                            <option value="1500-1600">1500-1600</option>
                            <option value="1600-1700">1600-1700</option>
                            <option value="1700-1800">1700-1800</option>
                        </select>
                    </td>
                </table>
                Select a date: 
                <input id="schedule_date" type="date" name="schedule_date">
                <br>
                <input class="button" type="submit" value="Booking Auditorium" onclick="showAudi();" >
            </form>
        </div>
    </body>
</html>
