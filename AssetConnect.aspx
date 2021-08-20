<%@ Page Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="AssetConnect.aspx.cs" Inherits="welcome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
     <h2 style="text-align:center;">
         Welcome: <asp:Label ID="lblUserID" runat="server" Text="UserID"></asp:Label>
</h2>
   <div class="container">
    <div class="jumbotron">
        <h1>Asset Connect</h1>
        <p>Asset Connect is a software solution to all Assets related problems. It is a smart way to keep your assets safe!! We will take care of your assets you can also have an additionl feature of real time monitoring. </p>
        <p><a href="AssetDetails.aspx"  class="btn btn-success btn-lg">Start Now</a></p>
    </div>
    </div>
      

       </asp:Content>
