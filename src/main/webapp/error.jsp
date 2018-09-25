<?xml version="1.0" encoding="ISO-8859-1" ?>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="mystyle.css">
    <meta charset="UTF-8"/>
    <title>Fehlerseite</title>
    <jsp:include page="header.jsp"></jsp:include>
</head>
<div class="background-body">
    <body>
    <h2>Fehlerseite</h2>
    <br/>
    <div class="box-2">
        <p>hier ist etwas kaputt..</p>
        <%
            String error = request.getParameter("error");
            if (error != null) {
                out.println("Fehler: " + error);
            }
        %>
    </div>

    <form action="einkaufen?action=administration" method="POST">
        <input type="submit" value="Zur&uuml;ck zum login" class="button"/>
    </form>

    <footer>
        Footer
    </footer>
    </body>
</div>
</html>