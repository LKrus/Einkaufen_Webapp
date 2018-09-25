<%@ page import="de.msgdavid.Artikel" %>
<%@ page import="java.util.ArrayList" %>
<?xml version="1.0" encoding="ISO-8859-1" ?>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="mystyle.css">
    <meta charset="UTF-8"/>
    <title>Administration</title>
    <%--<script src="js.js"/>--%>
    <jsp:include page="header.jsp"></jsp:include>
</head>
<div class="background-body">
    <body>
    <h2>Administration:</h2>
    <br/>
    <div class="flex">
        <div class="box-3">
            <form action="zuadmin?action=uebernehmen" method="POST">
                Bisherige Auswahl:
                <br>
                <br>
                <%
                    ArrayList<Artikel> list = (ArrayList<Artikel>) request.getAttribute("list");
                    for (Artikel artikel : list) {
                %>
                <label>
                    <input type="checkbox" name="markierteartikel" value="<%= artikel.getName() %>" checked/>
                </label><%= artikel.getName() %>, <%= artikel.getPreis() %>&#8364;
                <br>
                <%
                    }
                %>
                <br>
                zum Entfernen eines Artikel den Haken entfernen
                <br>
                <br>
                <input type="submit" value="Artikel neu laden" class="button2"/>
            </form>

        </div>

        <div class="box-4">
            <form action="zuadmin?action=uebernehmen" method="POST">
                Neue Artikel erstellen:
                <br>
                <br>
                Artikelname: <input type="text" class="text" name="textfeld" id="textfeld"/>
                <br>
                <br>
                Preis: Euro: <input type="number" class="number" name="euro" value="0" min="0"/>
                Cent : <input type="number" class="number" name="cent" value="0" min="0" max="99"/>
                <br>
                <br>
                <br>
                <input type="submit" value="Artikel hinzuf&uuml;gen" class="button2"/>
            </form>
        </div>
    </div>
    <br>
    <form action="einkaufen" method="POST">
        <input type="submit" value="Zur&uuml;ck zur Artikelauswahl" class="button"/>
    </form>

    <%
        String errorr = request.getParameter("errorr");
        if (errorr != null) {
    %>
    <div class="box-2">
        <%
            out.println("Fehler: " + errorr);
        %>
    </div>
    <%
        }
    %>
    <footer>
        Footer
    </footer>
    </body>
</div>
</html>