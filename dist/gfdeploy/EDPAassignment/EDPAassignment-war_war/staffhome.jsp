<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservation's Staff Page</title>
    </head>
    <body>
        <h1 style="text-align: center">
            Reservation's Staff Menu Page
        </h1>
        <div align="center">
            <jsp:include page="link.jsp"/>
        <script type="text/javascript">
            function OnSubmitForm()
            {
                if (document.pressed == "Edit Profile")
                {
                    document.myform.action = "updatestaff.jsp"
                } else
                if (document.pressed == 'Approve Reservation')
                {
                    document.myform.action = "approveaudi.jsp"
                } 
                if (document.pressed == 'Assign FM')
                {
                    document.myform.action = "assignfm.jsp"
                } 
                return true;
            }
        </script>
        <form name="myform" onsubmit="return OnSubmitForm();">
            <input type="submit" name="button" onclick="document.pressed = this.value" value="Edit Profile">
            <input type="submit" name="button" onclick="document.pressed = this.value" value="Approve Reservation">
            <input type="submit" name="button" onclick="document.pressed = this.value" value="Assign FM">
        </form>
        </div>
    </body>
</html>
