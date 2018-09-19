<%@ page import="de.msgdavid.Artikel" %>
<%@ page import="java.util.ArrayList" %>
<?xml version="1.0" encoding="ISO-8859-1" ?>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="mystyle.css">
    <meta charset="UTF-8"/>
    <title>Administration</title>
</head>
<body>
<header>
    <jsp:include page="header.jsp"></jsp:include>
</header>
<h2>Administration:</h2>
<br/>
<div class="flex">


    <div class="box-3">
        <form action="einkaufen?action=uebernehmen" method="POST">
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
            <input type="submit" value="Artikel entfernen" class="button2"/>
        </form>

    </div>

    <div class="box-4">
        <form action="einkaufen?action=uebernehmen" method="POST">
            Neue Artikel erstellen:
            <br>
            <br>
            Schema: "Artikelname,Artikelpreis(mit Punkt);"
            <br>
            <br>
            <input type="text" class="text" name="textfeld"/>
            <br>
            <br>
            <br>
            <input type="submit" value="Artikel hinzuf&uuml;gen" class="button2"/>
        </form>
    </div>

</div>

<br>
<form action="einkaufen?action=home" method="POST">
    <input type="submit" value="Zur&uuml;ck zur Artikelauswahl" class="button"/>
</form>
<footer>
    Footer
</footer>
</body>
</html>