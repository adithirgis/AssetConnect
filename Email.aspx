﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Email.aspx.cs" Inherits="Email" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td style="width: 80px">
            To:
        </td>
        <td>
            <asp:TextBox ID="txtTo" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            Subject:
        </td>
        <td>
            <asp:TextBox ID="txtSubject" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td valign = "top">
            Body:
        </td>
        <td>
            <asp:TextBox ID="txtBody" runat="server" TextMode = "MultiLine" Height = "150" Width = "200"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            File Attachment:
        </td>
        <td>
            <asp:FileUpload ID="fuAttachment" runat="server" />
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            Gmail Email:
        </td>
        <td>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
            Gmail Password:
        </td>
        <td>
           <asp:Button ID="btnGenerate" runat="server" Text="Generate PDF" OnClick="btnGenerate_Click" /> 
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td>
            <asp:Button Text="Send" type="submit"  OnClick="SendEmail" runat="server" />
        </td>
    </tr>
</table>

    </div>
    </form>
</body>
</html>
