<%@ Page Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="SubGroupMasters.aspx.cs" Inherits="SubGM" %>

  <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <h2 style="text-align:center">Sub Groups - Masters</h2>
    <div>
         <table> 
               <tr>
                <td style="width:284px">Group Name</td>
                <td class="auto-style2">
                    <asp:DropDownList ID="DDAssetGroups" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td class="auto-style4">
                    <asp:Button ID="btnAdd" runat="server"  Text="Add" Height="29px" Width="97px" ForeColor="Black" />
                </td>
                        
            </tr>
                     <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style9">
                    &nbsp;</td>
            </tr>
           <tr>
               <td style="width:280px">&nbsp;</td>
               <td style="align-items:center">
    <div>
        <asp:ListView ID="SGV" runat="server" DataKeyNames="SGID" DataSourceID="EntityDataSource1" InsertItemPosition="LastItem" OnItemCommand="SGV_ItemCommand" OnItemDataBound="SGV_ItemDataBound">
            <AlternatingItemTemplate>
                <tr style="background-color: lightblue;color:black;">
                    
                    <td>
                        <asp:Label ID="SGIDLabel" runat="server" Text='<%# Eval("SGID") %>' />
                         <asp:HiddenField ID="IsDeleted" runat="server" Value ='<%# Eval("IsDeleted") %>' /> <%--needed for soft delete--%>
                                  </td>
                    <td>
                        <asp:Label ID="AGrpIDLabel" runat="server" Text='<%# Eval("AGrpID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Sub_GroupLabel" runat="server" Text='<%# Eval("Sub_Group") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    </td>
                   <td>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        <asp:Button ID="Deactivate" runat="server" CommandName="Deactivate" Text="Deactivate" ForeColor="Black"/> <%--for deactivate button--%>
                                   </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                 <tr style="background-color: lightblue;color: black;">
                              
                    <td>
                        <asp:Label ID="SGIDLabel1" runat="server" Text='<%# Eval("SGID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="AGrpIDTextBox" runat="server" Text='<%# Bind("AGrpID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Sub_GroupTextBox" runat="server" Text='<%# Bind("Sub_Group") %>' /><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ToolTip="Required Field" Text="*"></asp:RequiredFieldValidator>
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
                <table runat="server" style="background-color: lightblue;border-collapse: collapse;border-color: black;border-style:none;border-width:0.5px;">
                <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="background-color: white">
                                        <td>
                        <asp:TextBox ID="SGIDTextBox" runat="server" Text='<%# Bind("SGID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="AGrpIDTextBox" runat="server" Text='<%# Bind("AGrpID") %>' /></td>
                    <td>
                        <asp:TextBox ID="Sub_GroupTextBox" runat="server" Text='<%# Bind("Sub_Group") %>' /><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ControlToValidate="Sub_GroupTextBox" Display="Dynamic" ToolTip="Required Field" Text="*" ValidationGroup="InsertSG"></asp:RequiredFieldValidator>
                                      </td>
                    <td>
                        <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    </td>
                   <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="InsertSG" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                  <tr style="background-color:#DCDCDC;color: #000000;">
                                        <td>
                        <asp:Label ID="SGIDLabel" runat="server" Text='<%# Eval("SGID") %>' />
                        <asp:HiddenField ID="IsDeleted" runat="server" Value ='<%# Eval("IsDeleted") %>' /> 
                    </td>
                    <td>
                        <asp:Label ID="AGrpIDLabel" runat="server" Text='<%# Eval("AGrpID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Sub_GroupLabel" runat="server" Text='<%# Eval("Sub_Group") %>' />
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
                                    <th runat="server">SGID</th>
                                    <th runat="server">AGrpID</th>
                                    <th runat="server">Sub Group</th>
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
                        <asp:Label ID="SGIDLabel" runat="server" Text='<%# Eval("SGID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AGrpIDLabel" runat="server" Text='<%# Eval("AGrpID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Sub_GroupLabel" runat="server" Text='<%# Eval("Sub_Group") %>' />
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
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=AssetTaggingEntities" DefaultContainerName="AssetTaggingEntities" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="LUT_Sub_Group">
        </asp:EntityDataSource>
        </div>
                    </td>
           </tr>
       </table> 
    </div>
       </asp:Content>
    
