<head>
<jsp:include page="header.jsp"></jsp:include>
</head>
<%@ page import="de.msgdavid.Artikel" %>
    <%@ page import="java.util.ArrayList" %>
<div class="background-body">
<h2>Angebot:</h2>
<br/>
<form action="einkaufen?action=auswahl" method="POST">
    <div class="box-1">


        <%
            ArrayList<Artikel> list = (ArrayList<Artikel>) request.getAttribute("list");
            String sArtikel = (String) session.getAttribute("artikelstring");
            boolean vorhanden;
            if (sArtikel == null) {
                for (Artikel artikel : list) {
        %>
        <label>
            <input type="checkbox" name="artikel" value="<%= artikel.getName() %>"/>
        </label><%= artikel.getName() %>, <%= artikel.getPreis() %>&#8364;
        <br>
        <%
            }
        } else if (sArtikel != null) {
            String[] selectedArtikel = sArtikel.split(",");
            for (Artikel artikel : list) {
                vorhanden = false;
                for (int j = 0; j < selectedArtikel.length; j++) {
                    if (selectedArtikel[j].equals(artikel.getName())) {
                        vorhanden = true;
                    }
                }
                if (vorhanden) {
        %>
        <label>
            <input type="checkbox" class="checkbox" name="artikel" value="<%= artikel.getName() %>" checked/>
        </label><%= artikel.getName() %>, <%= artikel.getPreis() %>&#8364;
        <br>
        <%
        } else if (!vorhanden) {
        %>
        <label>
            <input type="checkbox" class="checkbox" name="artikel" value="<%= artikel.getName() %>"/>
        </label><%= artikel.getName() %>, <%= artikel.getPreis() %>&#8364;
        <br>
        <%
                    }
                }
            }
        %>
    </div>
    <br>

    <input type="submit" value="In den Warenkorb" name="submit" onclick="" class="button"/>
</form>
<form action="einkaufen?action=administration" method="POST" class="buttonborder">
    <input type="submit" value="Administration" name="submit" onclick="" class="button"/>
</form>
</div>

<footer>
<jsp:include page="footer.jsp"></jsp:include>
</footer>