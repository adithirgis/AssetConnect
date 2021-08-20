<%@ Page Language="C#" MasterPageFile="~/HomeMaster.master" AutoEventWireup="true" CodeFile="LogIn.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderM" Runat="Server">
    
     
    <div style="border:1px solid white ; width:30%; background-color:white; border-radius:4px; padding:6px 12px; height:auto; text-align: center; margin:50px 35%; /*box-shadow:5px 5px 13px #ccc*/">
        <h2 style="text-align:center">Log In</h2>
        <br />
      <div class="formLogIn" style="background-color:white; display: table-cell; padding:6px 12px; text-align: center; height: inherit; width: inherit;" >
       
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="SignIn" margin="2px"/>
                                        <div class="form-group" style="height:inherit;">
         <span class="UserID"><label for ="userid" style="float:left">User ID:</label></span>  <asp:TextBox ID="txtUserID" runat="server" placeholder="Enter User ID" text-align="center" Style="float:right" class="form-control"  Height="30px"   Width="50%" margin="2px" ></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserID" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red" ToolTip="Required Field" ValidationGroup="SignIn">*</asp:RequiredFieldValidator>
                                                    <br />   
          <br />
                                                 <label for ="pwd" style="float:left">Password:</label><asp:TextBox ID="txtPassword" runat="server"  TextMode="Password" Style="float:right"  class="form-control" placeholder="Enter Password" text-align="center" Height="30px" Width="50%" margin="2px" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red" ToolTip="Required Field" ValidationGroup="SignIn">*</asp:RequiredFieldValidator>
                                                                      </div>
        <br /><br />
            <div class="checkbox"> 
               <label><input type="checkbox" />Remember Me  </label>      
                               </div>
          <br />
           <span class="psw"><a href="ForgotPassword.aspx" style="text-decoration:underline; ">Forgot password?</a></span>    
        <br />
          <br />
            <div  >
                  <%--<asp:Button ID="btnRegister" runat="server" Text="Register User"  style="float:left; border-radius: 4px" class="btn btn-success" OnClick="btnRegister_Click" ForeColor="White" Height="37px"  margin="2px"/>
                --%>  <asp:Button ID="btnSignIn" runat="server" Text="Sign In"   style=" border-radius: 4px"  OnClick="btnSignIn_Click" class="btn btn-primary" ForeColor="White" Height="37px"  margin="2px" ValidationGroup="SignIn" />
                           
                </div>
        </div>
         </div>
                   
       </asp:Content>

