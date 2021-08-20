<%@ Page Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="AssetLeasedOrPurchasedMasters.aspx.cs" Inherits="ALPM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
   
     <h2 style="text-align:center">Asset Leased or Purchased - Masters</h2>
    <div>
         <table style=" padding:12px 18px; text-align: center; " > 
           <tr>
               <td style="width:271px"></td>
               <td style="align-items:center">
    <div>
        <asp:ListView ID="AlpV" runat="server" DataKeyNames="ALPID" DataSourceID="EntityDataSource1" InsertItemPosition="LastItem" OnItemCommand="AlpV_ItemCommand" OnItemDataBound="AlpV_ItemDataBound">
            <AlternatingItemTemplate>
                <tr style="background-color: lightblue;color:black;">
                    
                    <td>
                        <asp:Label ID="ALPIDLabel" runat="server" Text='<%# Eval("ALPID") %>' />
                         <asp:HiddenField ID="IsDeleted" runat="server" Value ='<%# Eval("IsDeleted") %>' />
                        
                    </td>
                    <td>
                        <asp:Label ID="Asset_Leased_or_PurchasedLabel" runat="server" Text='<%# Eval("Asset_Leased_or_Purchased") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    </td>
                    <td>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        <asp:Button ID="Deactivate" runat="server" CommandName="Deactivate" Text="Deactivate" ForeColor="Black"/> 
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
               <tr style="background-color:#008A8C;color: #FFFFFF;">
                    
                    <td>
                        <asp:Label ID="ALPIDLabel1" runat="server" Text='<%# Eval("ALPID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Asset_Leased_or_PurchasedTextBox" runat="server" Text='<%# Bind("Asset_Leased_or_Purchased") %>' /><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ToolTip="Required Field" Text="*" Display="Dynamic" ControlToValidate="Asset_Leased_or_PurchasedTextBox"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    </td>
                   <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: lightblue;border-collapse: collapse;border-color: black;border-style:none;border-radius:8px; border-width:0.5px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="background-color: white">
                    
                    <td>
                        <asp:TextBox ID="ALPIDTextBox" runat="server" Text='Auto' />
                    </td>
                    <td>
                        <asp:TextBox ID="Asset_Leased_or_PurchasedTextBox" runat="server" Text='<%# Bind("Asset_Leased_or_Purchased") %>' /><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ToolTip="Required Field" Text="*" ControlToValidate="Asset_Leased_or_PurchasedTextBox" Display="Dynamic" ValidationGroup="InsertALP"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    </td>
                   <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="InsertALP" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    
                    <td>
                        <asp:Label ID="ALPIDLabel" runat="server" Text='<%# Eval("ALPID") %>' />
                        <asp:HiddenField ID="IsDeleted" runat="server" Value ='<%# Eval("IsDeleted") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Asset_Leased_or_PurchasedLabel" runat="server" Text='<%# Eval("Asset_Leased_or_Purchased") %>' />
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
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="background-color: #FFFFFF;border-collapse: collapse;border-color: black;border-style:none;border-width:0.5px;font-family: 'Times New Roman', Times, serif;">
                            <tr runat="server" style="background-color:#21618C ;color: white;">
                                   
                                    <th runat="server">ALPID</th>
                                    <th runat="server">Asset Leased or Purchased</th>
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
                        <asp:Label ID="ALPIDLabel" runat="server" Text='<%# Eval("ALPID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Asset_Leased_or_PurchasedLabel" runat="server" Text='<%# Eval("Asset_Leased_or_Purchased") %>' />
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
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=AssetTaggingEntities" DefaultContainerName="AssetTaggingEntities" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="LUT_Asset_Leased_or_Purchased">
        </asp:EntityDataSource>
        </div>
                    </td>  <%--hidden field ( dont store confidential data can be used fr state management) have databinding, disposed, init, load, valuechanged--%>
           </tr>
       </table> 
    </div>
       </asp:Content>
