<html>
<head>
<%@ page import="de.msgdavid.Artikel, java.util.ArrayList"%>
<title>Einkaufen</title>
<link rel="stylesheet" type="text/css" href="mystyle.css">
</head>
<body>
  <h2>Angebot:</h2>
<br/>
<div class="box-1">

<form action="einkaufen?action=auswahl" method="POST">
<%

ArrayList<Artikel> list =(ArrayList<Artikel>) request.getAttribute("list");

for(Artikel artikel : list){
%>
<input type="checkbox" name="artikel" value= "<%= artikel.getName() %>" /><%= artikel.getName() %>

</br>
<%
}
%>

</div>
</br>
<form action="einkaufen"method="POST">
  <input type="submit" value="In den Warenkorb" name="submit" onclick=""/>
</form>

</body>
</html>