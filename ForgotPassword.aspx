<%@ Page Language="C#" MasterPageFile="~/HomeMaster.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderM" Runat="Server">
    <div style="border:1px solid white ; width:30%; background-color:white; border-radius:4px; padding:6px 12px; height:auto; text-align: center; margin:50px 35%; /*box-shadow:5px 5px 13px #ccc*/">
        <h2 style="text-align:center">Forgot Password ?</h2>
        <br />
      <div class="formLogIn" style="background-color:white; display: table-cell; padding:6px 12px; text-align: center; height: inherit; width: inherit;" >
          <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="CheckU&amp;SA" />
         <div class="form-group" style="height:inherit;">
<label for ="userid" style="float:left">User ID:</label>
               <asp:TextBox ID="txtUserID" runat="server" placeholder="Enter User ID" text-align="center" Style="float:right" class="form-control"  Height="30px"   Width="50%" margin="2px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserID" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red" ToolTip="Required Field" ValidationGroup="CheckU&amp;SA">*</asp:RequiredFieldValidator>
                  <br />  <br />  <asp:Button ID="btnCheck" runat="server" Text="Show Question" OnClick="btnCheck_Click" class="btn btn-warning" ValidationGroup="CheckU&amp;SA" />
                <br /> <br /> 
              <label for ="sq" style="float:left">Security Question:</label>
                                    <asp:Label ID="SecurityQ" runat="server" style="float:right;"></asp:Label>
               <br /> <br /> 
                 <label for ="sa" style="float:left">Security Answer:</label>
                 <asp:TextBox ID="txtSecurityA" runat="server" placeholder="Enter Security Answer" text-align="center" Style="float:right" class="form-control"  Height="30px"   Width="50%" margin="2px" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSecurityA" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red" ToolTip="Required Field" ValidationGroup="Check">*</asp:RequiredFieldValidator>
                            <br />    <br /> 
             <label for ="p" style="float:left">Password:</label>
                   <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" text-align="center" Style="float:right" class="form-control"  Height="30px"   Width="50%" margin="2px"></asp:TextBox>
                 <br /> 
             <br /> </div>
          <asp:Button ID="btnCA" runat="server" OnClick="btnCA_Click" Text="Check Answer"  style="float:left;" class="btn btn-warning" ValidationGroup="Check" />
                <asp:Button ID="btnLogIn" runat="server" OnClick="btnLogIn_Click" Text="LogIn"  style="float:right;" class="btn btn-success" />
        <br />
        <br />
    </div>
       </div>
       </asp:Content>


   