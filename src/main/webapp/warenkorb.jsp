<?xml version="1.0" encoding="ISO-8859-1" ?>
<html>
<head>
<%@ page import="de.msgdavid.Artikel, java.util.ArrayList"%>
<meta  charset="UTF-8"/>
<title>Warenkorb</title>
</head>
<body>
<h3>Warenkorb:</h3>
<%
String artikelstring="";
%>
<form action="einkaufen?action=warenkorb"method="POST">

<%
String [] selectedArtikel=request.getParameterValues("artikel");

 if(selectedArtikel!=null){
  for(int i=0;i<selectedArtikel.length;i++){
   out.println(" " +selectedArtikel[i]);
   artikelstring+=selectedArtikel[i]+",";
   %>
   <input type="number" name="i" value="0" min="0"/>
   </br>
   <%
  }
 }else{
   out.println("nichts gewählt");
}
session.setAttribute("artikelstring", artikelstring);
%>
  <input type="submit" value="Zur Kasse" name="submit" onclick=""/>
</form>
</br>
</br>
<form action="einkaufen?action=home"method="POST">
  <input type="submit" value="Warenkorb aendern" name="submit" onclick=""/>
</form>

</body>
</html>