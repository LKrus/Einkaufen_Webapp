<html>
<head>
    <%@ page import="de.msgdavid.Artikel" %>
    <%@ page import="java.util.ArrayList" %>
    <title>Einkaufen</title>
    <link rel="stylesheet" type="text/css" href="mystyle.css">
</head>
<body>
<header>
   Header

    <ul>
        <li><a href="#home.jsp">Home</a></li>
        <li><a href="#warenkorb.jsp">Warenkorb</a></li>
        <li><a href="#kassenbon.jsp">Kasse</a></li>
    </ul>
</header>
<h2>Angebot:</h2>
<br/>
<div class="box-1">

    <form action="einkaufen?action=auswahl" method="POST">
            <%
ArrayList<Artikel> list =(ArrayList<Artikel>) request.getAttribute("list");
String sArtikel = (String) session.getAttribute("artikelstring");
boolean vorhanden=false ;
if (sArtikel==null){
  for(Artikel artikel : list){
%>
        <label>
            <input type="checkbox" name="artikel" value="<%= artikel.getName() %>"/>
        </label><%= artikel.getName() %>
        <br>
            <%
}
}else if (sArtikel!=null){
    String [] selectedArtikel = sArtikel.split(",");
    for(Artikel artikel : list){
        vorhanden =false;
        for (int j =0; j<selectedArtikel.length;j++){
          if (selectedArtikel[j].equals(artikel.getName())){
              vorhanden=true;
           }
           }
              if(vorhanden){
            %>
        <label>
            <input type="checkbox" class="checkbox" name="artikel" value="<%= artikel.getName() %>" checked/>
        </label><%= artikel.getName() %>
        <br>
            <%
        }else if(!vorhanden) {
             %>
        <label>
            <input type="checkbox" class="checkbox" name="artikel" value="<%= artikel.getName() %>"/>
        </label><%= artikel.getName() %>
        <br>
            <%
        }
    }
}
%>
</div>
<br>
<input type="submit" value="In den Warenkorb" name="submit" onclick="" class="button"/>


<footer>
    Footer
</footer>

</body>
</html>