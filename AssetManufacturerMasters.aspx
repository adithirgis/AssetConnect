<%@ Page Language="C#" MasterPageFile="~/SiteMaster.master"  AutoEventWireup="true" CodeFile="AssetManufacturerMasters.aspx.cs" Inherits="MAsMa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
     <h2 style="text-align:center">Asset Manufacturers - Masters</h2>
    <div>
         <table> 
           <tr>
               <td  style="width:271px"></td>
               <td style="align-items:center">
    <div class="auto-style3">
        <asp:ListView ID="MAsMaV" runat="server" DataKeyNames="MnfID" DataSourceID="EntityDataSource1" InsertItemPosition="LastItem" OnItemCommand="MAsMaV_ItemCommand" OnItemDataBound="MAsMaV_ItemDataBound">
            <AlternatingItemTemplate>
                 <tr style="background-color: lightblue;color:black;">
                   
                    <td>
                        <asp:Label ID="MnfIDLabel" runat="server" Text='<%# Eval("MnfID") %>' />
                        <asp:HiddenField ID="IsDeleted" runat="server" Value ='<%# Eval("IsDeleted") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ManufacturerLabel" runat="server" Text='<%# Eval("Asset_Manufacturer") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    </td>
                     <td>
                        <asp:Button ID="EditButton" runat="server" CssClass="bg-success" CommandName="Edit" Text="Edit" ForeColor="Black"/>
                        <asp:Button ID="Deactivate" runat="server"  CommandName="Deactivate" Text="Deactivate" ForeColor="Black"/>
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: lightblue;color: black;">
                    
                    <td>
                        <asp:Label ID="MnfIDLabel1" runat="server" Text='<%# Eval("MnfID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ManufacturerTextBox" runat="server" Text='<%# Bind("Asset_Manufacturer") %>' /><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" Text="*" ToolTip="Required Field" ControlToValidate="ManufacturerTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
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
                 <tr style="background-color: white">
                    
                    <td>
                        <asp:TextBox ID="MnfIDTextBox" runat="server" Text='Auto' />
                    </td>
                    <td>
                        <asp:TextBox ID="ManufacturerTextBox" runat="server" Text='<%# Bind("Asset_Manufacturer") %>' /><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ControlToValidate="ManufacturerTextBox" Display="Dynamic" ToolTip="Required Field" Text="*" ValidationGroup="InsertAMn"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    </td>
                   <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" Forecolor="Black" ValidationGroup="InsertAMn" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" Forecolor="Black"/>
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    
                    <td>
                        <asp:Label ID="MnfIDLabel" runat="server" Text='<%# Eval("MnfID") %>' />
                        <asp:HiddenField ID="IsDeleted" runat="server" Value ='<%# Eval("IsDeleted") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ManufacturerLabel" runat="server" Text='<%# Eval("Asset_Manufacturer") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    </td>
                    <td>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" Forecolor="Black"/>
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
                                   
                                    <th runat="server">MnfID</th>
                                    <th runat="server">Manufacturer</th>
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
                        <asp:Label ID="MnfIDLabel" runat="server" Text='<%# Eval("MnfID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ManufacturerLabel" runat="server" Text='<%# Eval("Asset_Manufacturer") %>' />
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
         <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=AssetTaggingEntities" DefaultContainerName="AssetTaggingEntities" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="LUT_Asset_Manufacturers">
        </asp:EntityDataSource>
         </div>
                    </td>
           </tr>
       </table> 
    </div>
       </asp:Content>
    
