<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tryL.aspx.cs" Inherits="tryL" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="bootstrap-3.3.7-dist/jquery-3.2.1%20(2).js"></script>
</head>
<script src="bootstrap-3.3.7-dist/npm.js"></script>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="bootstrap-3.3.7-dist/jquery-1.4.1.min.js"></script>
<body>
    <form id="form1" runat="server">
   
    <div>
    <table border="0" >
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
            <asp:TextBox ID="txtPassword" runat="server" TextMode = "Password"></asp:TextBox>
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
            <p>Map-marker icon on a styled link button:
        <a href="#" class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-map-marker"></span> Map
        </a>
      </p> 
            <div class="input-group-addon">
	<span class="glyphicon glyphicon-envelope"></span> 
   </div>
        </td>
    </tr>
</table>

  

      
    </div>
    </form>
</body>
</html>
