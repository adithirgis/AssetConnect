<%@ Page Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="AssetServiceProviderMasters.aspx.cs" Inherits="ASeP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <h2 style="text-align:center">Service Provider of Assets - Masters</h2>
    <div>
         <table> 
           <tr>
               <td style="width:284px"></td>
               <td style="align-items:center">
    <div>
        <asp:ListView ID="ASePV" runat="server" DataKeyNames="SPID" DataSourceID="EntityDataSource1" InsertItemPosition="LastItem" OnItemCommand="ASePV_ItemCommand" OnItemDataBound="ASePV_ItemDataBound">
            <AlternatingItemTemplate>
                <tr style="background-color: lightblue;color:black;">
                    
                    <td>
                        <asp:Label ID="SPIDLabel" runat="server" Text='<%# Eval("SPID") %>' />
                         <asp:HiddenField ID="IsDeleted" runat="server" Value ='<%# Eval("IsDeleted") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Service_Provider_of_AssetLabel" runat="server" Text='<%# Eval("Service_Provider_of_Asset") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    </td>
                    <td>
                        <asp:Button ID="EditButton"  runat="server" CommandName="Edit" Text="Edit" />
                        <asp:Button ID="Deactivate" runat="server" CommandName="Deactivate" Text="Deactivate" ForeColor="Black"/>
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: lightblue;color: black;">
                   
                    <td>
                        <asp:Label ID="SPIDLabel1" runat="server" Text='<%# Eval("SPID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Service_Provider_of_AssetTextBox" runat="server" Text='<%# Bind("Service_Provider_of_Asset") %>' /><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" Text="*" ToolTip="Required Field"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    </td>
                     <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" Forecolor="Black"/>
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" Forecolor="Black"/>
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
                 <tr style="background-color:#DCDCDC;color: #000000;">
                    
                    <td>
                        <asp:TextBox ID="SPIDTextBox" runat="server" Text='Auto' />
                        <asp:HiddenField ID="IsDeleted" runat="server" Value ='<%# Eval("IsDeleted") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Service_Provider_of_AssetTextBox" runat="server" Text='<%# Bind("Service_Provider_of_Asset") %>' /><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ControlToValidate="Service_Provider_of_AssetTextBox" Display="Dynamic" ToolTip="Required Field" Text="*" ValidationGroup="InsertASP"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    </td>
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ForeColor="Black" ValidationGroup="InsertASP" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" ForeColor="Black"/>
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                  <tr style="background-color:#DCDCDC;color: #000000;">
                    
                    <td>
                        <asp:Label ID="SPIDLabel" runat="server" Text='<%# Eval("SPID") %>' />
                         <asp:HiddenField ID="IsDeleted" runat="server" Value ='<%# Eval("IsDeleted") %>' /> 
                    </td>
                    <td>
                        <asp:Label ID="Service_Provider_of_AssetLabel" runat="server" Text='<%# Eval("Service_Provider_of_Asset") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
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
                                
                                 
                                    <th runat="server">SPID</th>
                                    <th runat="server">Service Provider of Asset</th>
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
                        <asp:Label ID="SPIDLabel" runat="server" Text='<%# Eval("SPID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Service_Provider_of_AssetLabel" runat="server" Text='<%# Eval("Service_Provider_of_Asset") %>' />
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
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=AssetTaggingEntities" DefaultContainerName="AssetTaggingEntities" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="LUT_Service_Provider_Of_Asset">
        </asp:EntityDataSource>
        </div>
                    </td>
           </tr>
       </table> 
    </div>
       </asp:Content>
    
        

    