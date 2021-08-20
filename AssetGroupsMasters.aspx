<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="AssetGroupsMasters.aspx.cs" Inherits="Contactus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
     <h2 style="text-align:center;">Asset Groups Masters</h2>
        <div >
       <table style="/*border:1px solid white;*/ background-color:white; border-radius:4px; padding:12px 18px; text-align: center; margin-right: 19%; margin-left: 19%;  " >
           <tr> 
               <td style="align-items:center" >
                  <asp:ListView ID="AGV" runat="server" DataKeyNames="AGrpID" DataSourceID="EntityDataSource2" InsertItemPosition="LastItem" OnItemCommand="AGV_ItemCommand" OnItemDataBound="AGV_ItemDataBound" >
            <AlternatingItemTemplate>
                 <tr style="background-color: lightblue;color:black;">
                    
                    <td>
                        <asp:Label ID="AGrpIDLabel" runat="server" Text='<%# Eval("AGrpID") %>' />
                        <asp:HiddenField ID="IsDeleted" runat="server" Value ='<%# Eval("IsDeleted") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Asset_GroupsLabel" runat="server" Text='<%# Eval("Asset_Groups") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    </td>
                    <td>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        <asp:Button ID="Deactivate" runat="server" CommandName="Deactivate" Text="Deactivate" />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
               <tr style="background-color: lightblue;color: black;">
                                       <td>
                        <asp:Label ID="AGrpIDLabel1" runat="server" Text='<%# Eval("AGrpID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Asset_GroupsTextBox" runat="server" Text='<%# Bind("Asset_Groups") %>' /><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ToolTip="Required Field" Text="*" ControlToValidate="Asset_GroupsTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    </td>
                     <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server"  CommandName="Cancel" Text="Cancel" />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                 <table runat="server" style="background-color: lightblue;border-collapse: collapse;border-color:black;border-style:none; border-radius:8px; border-width:0.5px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="background-color: white">                <%--for insert colour--%>
                                        <td>
                        <asp:TextBox ID="AGrpIDTextBox" runat="server" Text='Auto' />  <%--<%# Bind("AGrpID") %>--%>
                    </td>
                    <td>
                        <asp:TextBox ID="Asset_GroupsTextBox" runat="server" Text='<%# Bind("Asset_Groups") %>' /><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ToolTip="Required Field" Text="*" ValidationGroup="InsertAG" ControlToValidate="Asset_GroupsTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    </td>
                   <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="InsertAG" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td> 
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: whitesmoke;color: black;">
                   
                    <td>
                        <asp:Label ID="AGrpIDLabel" runat="server" Text='<%# Eval("AGrpID") %>' />
                        <asp:HiddenField ID="IsDeleted" runat="server" Value ='<%# Eval("IsDeleted") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Asset_GroupsLabel" runat="server" Text='<%# Eval("Asset_Groups") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                         <td>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        <asp:Button ID="DeactivateButton" runat="server" CommandName="Deactivate" Text="Deactivate" />
                    </td>
                    </td>
                    
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1"    style="background-color: #FFFFFF;border-collapse: collapse; border-radius:8px; border-style:none;border-width:0.5px;font-family: 'Times New Roman', Times, serif;">
                            <tr runat="server" style="background-color:#21618C ;color: white;">
                                                                       <th runat="server">AGrpID</th>
                                    <th runat="server">Asset Groups</th>
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
                        <asp:Label ID="AGrpIDLabel" runat="server" Text='<%# Eval("AGrpID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Asset_GroupsLabel" runat="server" Text='<%# Eval("Asset_Groups") %>' />
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
        <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=AssetTaggingEntities" DefaultContainerName="AssetTaggingEntities" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="LUT_Asset_Groups">
        </asp:EntityDataSource> 
                   
               </td>
           </tr>
       </table> 
    </div>
    
</asp:Content>

