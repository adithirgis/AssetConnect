<%@ Page Language="C#" MasterPageFile="~/HomeMaster.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderM" Runat="Server">
             <div style="border:1px solid white ; width:30%; background-color:white; border-radius:4px; padding:6px 12px; height:auto; text-align: center; margin:50px 35%; /*box-shadow:5px 5px 13px #ccc*/">
        <h2 style="text-align:center;">Register Users</h2>
         
      <div class="formLogIn" style="background-color:white; display: table-cell; padding:6px 12px; text-align: center; height: inherit; width: inherit;" >
       <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="Save&amp;Update" />
          <br />
           <div class="form-group" style="height:inherit;">
    <label for ="NOU" style="float:left">Name of the user:</label>
          <asp:TextBox ID="txtName" runat="server" placeholder="Enter Name of User" text-align="center" Style="float:right" class="form-control"  Height="30px"   Width="50%" margin="2px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Name is Mandatory" ForeColor="Red" ToolTip="Name is Mandatory" ValidationGroup="Save&amp;Update">*</asp:RequiredFieldValidator>
               <br /> <br /><label for ="UID" style="float:left">UsID:</label>
                  <asp:TextBox ID="txtUsID" runat="server"  placeholder="Enter UserID" text-align="center" Style="float:right" class="form-control"  Height="30px"   Width="50%" margin="2px"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic" ErrorMessage="UsID created Dynamically" ForeColor="Red" ToolTip="UsID created Dynamically" ControlToValidate="txtUsID" ValidationGroup="Save&amp;Update">*</asp:RequiredFieldValidator>
            <br />  <br /> <label for ="EID" style="float:left">Email ID:</label>
                  <asp:TextBox ID="txtEmailID" runat="server" TextMode="Email"  placeholder="Enter Email ID" text-align="center" Style="float:right" class="form-control"  Height="30px"   Width="50%" margin="2px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmailID" Display="Dynamic" ErrorMessage="EmailID  is Mandatory" ForeColor="Red" ToolTip="EmailID is Mandatory" ValidationGroup="Save&amp;Update">*</asp:RequiredFieldValidator>
               <br /> <br /> <label for ="PN" style="float:left">Phone No:</label>
                                   <asp:TextBox ID="txtPhoneNo" runat="server"  placeholder="Enter Phone No" text-align="center" Style="float:right" class="form-control"  Height="30px"   Width="50%" margin="2px"  ></asp:TextBox>
              <br /> <br />  <label for ="UsID" style="float:left">UserID:</label>
                                    <asp:TextBox ID="txtUserID" runat="server"  placeholder="Enter User ID" text-align="center" Style="float:right" class="form-control"  Height="30px"   Width="50%" margin="2px" ></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUserID" Display="Dynamic" ErrorMessage="UserID is Mandatory" ForeColor="Red" ToolTip="USerID is Mandatory" ValidationGroup="Save&amp;Update">*</asp:RequiredFieldValidator>
              <br />  <br /> <label for ="p" style="float:left">Password:</label>
                                   <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"  placeholder="Enter Password" text-align="center" Style="float:right" class="form-control"  Height="30px"   Width="50%" margin="2px"  ></asp:TextBox>
              <br /> <br /> <label for ="cp" style="float:left"> Confirm Password:</label>
                                         <asp:TextBox ID="txtConfirmP" runat="server" TextMode="Password"  placeholder="Confirm Password" text-align="center" Style="float:right" class="form-control"  Height="30px"   Width="50%" margin="2px" ></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtConfirmP" Display="Dynamic" ErrorMessage="Confirmation is Mandatory" ForeColor="Red" ToolTip="Confirmation is Mandatory" ValidationGroup="Save&amp;Update">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmP" ErrorMessage="Passwords must match" ForeColor="Red" ToolTip="Passwords must match" ValidationGroup="Save&amp;Update">*</asp:CompareValidator>
             <br /> <br />   <label for ="sq" style="float:left"> Security Question:</label>
                                    <asp:TextBox ID="txtSecurityQ" runat="server"  placeholder="Enter Security Question" text-align="center" Style="float:right" class="form-control"  Height="30px"   Width="50%" margin="2px"  ></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtSecurityQ" Display="Dynamic" ErrorMessage="Security Question is Mandatory" ForeColor="Red" ToolTip="Security Question is Mandatory" ValidationGroup="Save&amp;Update">*</asp:RequiredFieldValidator>
              <br />  <br /><label for ="sa" style="float:left"> Security Answer:</label>
                 <asp:TextBox ID="txtSecurityA" runat="server" placeholder="Enter Security Answer" text-align="center" Style="float:right" class="form-control"  Height="30px"   Width="50%" margin="2px" ></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtSecurityA" Display="Dynamic" ErrorMessage="Security Answer is Mandatory" ForeColor="Red" ToolTip="Security Answer is Mandatory" ValidationGroup="Save&amp;Update">*</asp:RequiredFieldValidator>
              
                </div>
        <br />  <br />   <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" style=" float:left;" class="btn btn-danger" />
                                   <asp:Button ID="btnSave" runat="server"  Text="Save" class="btn btn-success" OnClick="btnSave_Click" ValidationGroup="Save&amp;Update" />
                                                <asp:Button ID="btnUpdate" runat="server" Text="Update"  class="btn btn-primary" OnClick="btnUpdate_Click" style=" float:right;" ValidationGroup="Save&amp;Update" />
                                  
                               <br />  <br />   <span class="AR"><a href="LogInP.aspx" style="text-decoration:underline; float:right; ">Already Registered?</a></span>
               <input type="reset" value="Clear" class="btn btn-default" style=" float:left;"/>  <%--inbuilt for reset button.--%>
                      
          
       
        <br />
        <br />
    </div>
    </div>
                   
       </asp:Content>


   