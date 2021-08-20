

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" />
        <asp:Button ID="Button3" runat="server" Text="Button" OnClick="Button3_Click" />
    <asp:multiview ID="MV1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <div style="width: 500px; height: 100px; background-color: blue;"> </div>
        </asp:View>
        <asp:view runat="server">
             <div style="width: 500px; height: 100px; background-color: palevioletred;"> </div>
        </asp:view>
<asp:view runat="server">
     <div style="width: 500px; height: 100px; background-color: black;"> </div>
</asp:view>

    </asp:multiview>
    </div>
    </form>
</body>
</html>
