<%@ Page Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="AssetUsersMasters.aspx.cs" Inherits="MAsUs" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ul>
            <li class="dropdown">
                <a href="javascript.void(0)" class="dropbtn">Masters</a>
                <div class="dropdown-content">
                    <a href="AssetGroupsMasters.aspx"> Asset Groups Masters</a>
                    <a href="AssetLeasedToMasters.aspx"> Asset Leased To Masters</a>
                    <a href="AssetLeasedOrPurchasedMasters.aspx"> Asset Leased Or Purchased Masters</a>
                    <a href="AssetManufacturerMasters.aspx">Asset Manufacturer Masters</a>
                    <a href="AssetOwnershipMasters.aspx"> Asset Ownership Masters</a>
                    <a href="AssetPriorityMasters.aspx"> Asset Priority Masters</a>
                    <a href="AssetServiceProviderMasters.aspx"> Asset Service Provider Masters</a>
                    <a href="AssetUnderMasters.aspx"> Asset Under Masters</a>
                    <a href="AssetUsersMasters.aspx"> Asset Users Masters</a>
                    <a href="CameraStatusMasters.aspx"> Camera Status Masters</a>
                    <a href="CurrentConditionMasters.aspx"> Current Condition Masters</a>
                    <a href="CurrentLocationMasters.aspx"> Current Location Masters</a>
                    <a href="CurrentStatusMasters.aspx"> Current Status Masters</a>
                    <a href="FrequencyMasters.aspx"> Frequency Masters</a>
                    <a href="FrquencyofAMCMasters.aspx"> Frquency of AMC Masters</a>
                    <a href="Masters.aspx"> Binary Masters</a>
                    <a href="SubGroupMasters.aspx"> Sub-Group Masters</a>
                    <a href="TagTypeMasters.aspx"> Tag Type Masters</a>
                                </div>
                <li> <a href="Transactions.aspx"> Transactions</a>
                    <li> <a href="SearchAssets.aspx"> Asset Details</a>
                        <li> <a href="AssetConnect.aspx"> Asset Connect</a>
                <li> <a href="Home.aspx"> Log Out</a>
            </li>
        </ul>
     <style>
           ul{
               list-style-type:none;
               margin:0;
               padding:0;
               overflow:hidden;
               background-color:#333;
           }
           li{ float: left;
           }
           li a, .dropbtn{
               display: inline-block;
               color:white;
               text-align:center;
               padding: 14px 16px;
               text-decoration: none;
                       }
           li a:hover , .dropdown:hover .dropbtn{
               background-color:#333;
                          }
           li.dropdown{
               display:inline-block;
           }
           .dropdown-content{
               display: none;
               position: absolute;
               background-color:#f9f9f9;
               min-width:160px;
               box-shadow:0px 8px 16px 0px rgba(0,0,0,0.2);
               z-index:1;
                          }
           .dropdown-content a{
               color:black;
               padding: 12px 16px;
               text-decoration:none;
               display:block;
               text-align:left;
           }
           .dropdown-content a:hover{
               background-color: #f1f1f1;
           }
           .dropdown:hover .dropdown-content{
               display:block;
           }
           .auto-style2 {
               width: 382px;
           }
       </style>
    <h2>Asset Users - Masters</h2>
    <div>
         <table> 
           <tr>
               <td style="width:230px">&nbsp;</td>
               <td style="align-items:center">
    <div>
        <asp:ListView ID="AsUsV" runat="server" DataKeyNames="UsID" DataSourceID="EntityDataSource1" InsertItemPosition="LastItem" OnItemCommand="AsUsV_ItemCommand" OnItemDataBound="AsUsV_ItemDataBound">
            <AlternatingItemTemplate>
                <tr style="background-color: lightblue;color:black;">
                    
                    <td>
                        <asp:Label ID="UsIDLabel" runat="server" Text='<%# Eval("UsID") %>' />
                        <asp:HiddenField ID="IsDeleted" runat="server" Value ='<%# Eval("IsDeleted") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="passwordLabel" runat="server" Text='<%# Eval("password") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SecurityQLabel" runat="server" Text='<%# Eval("SecurityQ") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SecurityALabel" runat="server" Text='<%# Eval("SecurityA") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailIDLabel" runat="server" Text='<%# Eval("EmailID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PhoneNoLabel" runat="server" Text='<%# Eval("PhoneNo") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NameOfUserLabel" runat="server" Text='<%# Eval("NameOfUser") %>' />
                    </td>
                   <td>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" Forecolor="Black"/>
                         <asp:Button ID="Deactivate" runat="server" CommandName="Deactivate" Text="Deactivate" ForeColor="Black"/> 
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                 <tr style="background-color: lightblue;color: black;">
                   
                    <td>
                        <asp:Label ID="UsIDLabel1" runat="server" Text='<%# Eval("UsID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' />   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ToolTip="Required Field" Text="*"></asp:RequiredFieldValidator>

                    </td>             
                     <td>
                        <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="SecurityQTextBox" runat="server" Text='<%# Bind("SecurityQ") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="SecurityATextBox" runat="server" Text='<%# Bind("SecurityA") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="EmailIDTextBox" runat="server" Text='<%# Bind("EmailID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PhoneNoTextBox" runat="server" Text='<%# Bind("PhoneNo") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="NameOfUserTextBox" runat="server" Text='<%# Bind("NameOfUser") %>' />
                    </td>
                     <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
               <table runat="server" style="background-color: lightblue;border-collapse: collapse;border-color: black;border-style:none;border-width:0.5px;">
                <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                 <tr style="background-color: white">
                   <td>
                        <asp:TextBox ID="UsIDTextBox" runat="server" Text='Auto' />
                    </td>
                    <td>
                        <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' /><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ToolTip="Required Field" Text="*" ValidationGroup="InsertUs" ControlToValidate="UserIDTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="SecurityQTextBox" runat="server" Text='<%# Bind("SecurityQ") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="SecurityATextBox" runat="server" Text='<%# Bind("SecurityA") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="EmailIDTextBox" runat="server" Text='<%# Bind("EmailID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PhoneNoTextBox" runat="server" Text='<%# Bind("PhoneNo") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="NameOfUserTextBox" runat="server" Text='<%# Bind("NameOfUser") %>' />
                    </td>
                   <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="InsertUs" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                  <td>
                        <asp:Label ID="UsIDLabel" runat="server" Text='<%# Eval("UsID") %>' />
                         <asp:HiddenField ID="IsDeleted" runat="server" Value ='<%# Eval("IsDeleted") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="passwordLabel" runat="server" Text='<%# Eval("password") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SecurityQLabel" runat="server" Text='<%# Eval("SecurityQ") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SecurityALabel" runat="server" Text='<%# Eval("SecurityA") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailIDLabel" runat="server" Text='<%# Eval("EmailID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PhoneNoLabel" runat="server" Text='<%# Eval("PhoneNo") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NameOfUserLabel" runat="server" Text='<%# Eval("NameOfUser") %>' />
                    </td>
                   <td>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        <asp:Button ID="Deactivate" runat="server" CommandName="Deactivate" Text="Deactivate" ForeColor="Black"/>
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                           <table id="itemPlaceholderContainer" runat="server" border="0" style="background-color: #FFFFFF;border-collapse: collapse;border-color: black;border-style:none;border-width:0.0px;font-family: 'Times New Roman', Times, serif;">
                            <tr runat="server" style="background-color:#21618C ;color: white;">   
                                    <th runat="server">UsID</th>
                                    <th runat="server">UserID</th>
                                    <th runat="server">password</th>
                                    <th runat="server">SecurityQ</th>
                                    <th runat="server">SecurityA</th>
                                    <th runat="server">EmailID</th>
                                    <th runat="server">PhoneNo</th>
                                    <th runat="server">Name Of User</th>
                                    <th runat="server"></th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #85929E;font-family: 'Times New Roman', Times, serif;color: #000000;">
                        <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                    
                    <td>
                        <asp:Label ID="UsIDLabel" runat="server" Text='<%# Eval("UsID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="passwordLabel" runat="server" Text='<%# Eval("password") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SecurityQLabel" runat="server" Text='<%# Eval("SecurityQ") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SecurityALabel" runat="server" Text='<%# Eval("SecurityA") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailIDLabel" runat="server" Text='<%# Eval("EmailID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PhoneNoLabel" runat="server" Text='<%# Eval("PhoneNo") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NameOfUserLabel" runat="server" Text='<%# Eval("NameOfUser") %>' />
                    </td>
                    <td>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
         <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=AssetTaggingEntities" DefaultContainerName="AssetTaggingEntities" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="LUT_Asset_Users">
        </asp:EntityDataSource>
         </div>
                    </td>
           </tr>
       </table> 
    </div>
       </asp:Content>
    
