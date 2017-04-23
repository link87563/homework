<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NameCheck.aspx.cs" Inherits="Ajax_NameCheck" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="UserName"  runat="server"></asp:TextBox><div id="div1"></div>

    </div>
    </form>
        <script>
        var div1 = document.getElementById("div1");
        var thename = document.getElementById("UserName");

        thename.addEventListener("blur", function () {
            var xhr = new XMLHttpRequest();
            xhr.addEventListener("load", function () {
                if (xhr.status == 200) {
                    var data = xhr.responseText;
                    div1.innerHTML = data;
                }
            })
            xhr.open("get", "server.ashx?UserName="+thename.value);
            xhr.send();
        })
    </script>
</body>
</html>
