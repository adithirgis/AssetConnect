<%@ Page Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="Masters.aspx.cs" Inherits="BinaryMasters" %>

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
    <h2>Binary Table- Masters</h2>
    <div>
         <table> 
           <tr>
               <td style="width:230px">&nbsp;</td>
               <td style="align-items:center">
    <div>
       <asp:ListView ID="BinV" runat="server" DataKeyNames="UID" DataSourceID="EntityDataSource1" InsertItemPosition="LastItem">
            <AlternatingItemTemplate>
                <tr style="background-color: lightblue;color:black;">
                    
                    <td>
                        <asp:Label ID="UIDLabel" runat="server" Text='<%# Eval("UID") %>' />
                         <asp:HiddenField ID="IsDeleted" runat="server" Value ='<%# Eval("IsDeleted") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BinaryLabel" runat="server" Text='<%# Eval("Binary") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    </td>
                    <td>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        <asp:Button ID="Deactivate" runat="server"  CommandName="Deactivate" Text="Deactivate" ForeColor="Black"/>
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: lightblue;color: black;">
                    
                    <td>
                        <asp:Label ID="UIDLabel1" runat="server" Text='<%# Eval("UID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="BinaryTextBox" runat="server" Text='<%# Bind("Binary") %>' /><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ControlToValidate="BinaryTextBox" Text="*" ToolTip="Required Field" Display="Dynamic" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    </td>
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" ValidationGroup="Edit"/>
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
                        <asp:TextBox ID="UIDTextBox" runat="server" Text='Auto' />
                    </td>
                    <td>
                        <asp:TextBox ID="BinaryTextBox" runat="server" Text='<%# Bind("Binary") %>' /><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ToolTip="Required Field" Text="*" ControlToValidate="BinaryTextBox" Display="Dynamic" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    </td>
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ForeColor="Black" ValidationGroup="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" ForeColor="Black"/>
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    
                    <td>
                        <asp:Label ID="UIDLabel" runat="server" Text='<%# Eval("UID") %>' />
                         <asp:HiddenField ID="IsDeleted" runat="server" Value ='<%# Eval("IsDeleted") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BinaryLabel" runat="server" Text='<%# Eval("Binary") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    </td>
                    <td>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        <asp:Button ID="Deactivate" runat="server"  CommandName="Deactivate" Text="Deactivate" ForeColor="Black"/>
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                           <table id="itemPlaceholderContainer" runat="server" border="0" style="background-color: #FFFFFF;border-collapse: collapse;border-color: black;border-style:none;border-width:0.0px;font-family: 'Times New Roman', Times, serif;">
                            <tr runat="server" style="background-color:#21618C ;color: white;">
                                    
                                    <th runat="server">UID</th>
                                    <th runat="server">Binary</th>
                                    <th runat="server">Description</th>
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
                        <asp:Label ID="UIDLabel" runat="server" Text='<%# Eval("UID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="BinaryLabel" runat="server" Text='<%# Eval("Binary") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    </td>
                     <td>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=AssetTaggingEntities" DefaultContainerName="AssetTaggingEntities" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="LUT_Binary">
        </asp:EntityDataSource>
        </div>
                    </td>
           </tr>
       </table> 
    </div>
       </asp:Content>
    