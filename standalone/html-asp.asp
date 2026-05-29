<%@ Language="VBScript" %>
<html>
<body>
<% For Each status In Array("todo", "doing", "done") %>
  <p><%= status %></p>
<% Next %>
</body>
</html>
