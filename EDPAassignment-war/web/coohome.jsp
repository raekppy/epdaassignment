<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CooHome Page</title>
    </head>
    <body>
        <h1 style="text-align: center">
            Chief Operating Officer Menu Page
        </h1>
        <div align="center">
            <jsp:include page="link.jsp"/>
            <script type="text/javascript">
                function OnSubmitForm()
                {
                    if (document.pressed == 'User Function')
                    {
                        document.myform.action = "userfunction.jsp"
                    } else
                    if (document.pressed == 'Auditorium Function')
                    {
                        document.myform.action = "audifunction.jsp"
                    }
                    return true;
                }
            </script>
            <form name="myform" onsubmit="return OnSubmitForm();">
                <input type="submit" name="button" onclick="document.pressed = this.value" value="User Function">
                <input type="submit" name="button" onclick="document.pressed = this.value" value="Auditorium Function">
            </form>
        </div>
    </body>
</html>
