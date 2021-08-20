<%@ Page Language="C#"  MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="FrquencyofAMCMasters.aspx.cs" Inherits="FAMCM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 332px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <h2 style="text-align:center">Frequency of AMC - Masters</h2>
    <div>
         <table> 
           <tr>
               <td style="width:284px"></td>
               <td style="align-items:center">
    <div>
        <asp:ListView ID="FAMCV" runat="server" DataKeyNames="FMCID" DataSourceID="EntityDataSource1" InsertItemPosition="LastItem" OnItemCommand="FAMCV_ItemCommand" OnItemDataBound="FAMCV_ItemDataBound">
            <AlternatingItemTemplate>
                <tr style="background-color: lightblue;color:black;">
                    
                    <td>
                        <asp:Label ID="FMCIDLabel" runat="server" Text='<%# Eval("FMCID") %>' />
                         <asp:HiddenField ID="IsDeleted" runat="server" Value ='<%# Eval("IsDeleted") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Frequency_of_Annual_Maintenance_ContractLabel" runat="server" Text='<%# Eval("Frequency_of_Annual_Maintenance_Contract") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    </td>
                    <td>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" ForeColor="Black"/>
                        <asp:Button ID="Deactivate" runat="server" CommandName="Deactivate" Text="Deactivate" ForeColor="Black"/> 
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                 <tr style="background-color: lightblue;color: black;">
                       <td>
                        <asp:Label ID="FMCIDLabel1" runat="server" Text='<%# Eval("FMCID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="Frequency_of_Annual_Maintenance_ContractTextBox" runat="server" Text='<%# Bind("Frequency_of_Annual_Maintenance_Contract") %>' /><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" Display="Dynamic" ToolTip="Required Field" Text="*"></asp:RequiredFieldValidator>
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
                        <asp:TextBox ID="FMCIDTextBox" runat="server" Text='Auto' />
                    </td>
                    <td>
                        <asp:TextBox ID="Frequency_of_Annual_Maintenance_ContractTextBox" runat="server" Text='<%# Bind("Frequency_of_Annual_Maintenance_Contract") %>' /><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ToolTip="Required Field" Text="*" ControlToValidate="Frequency_of_Annual_Maintenance_ContractTextBox" Display="Dynamic" ValidationGroup="InsertAMC"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    </td>
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="InsertAMC" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    
                    <td>
                        <asp:Label ID="FMCIDLabel" runat="server" Text='<%# Eval("FMCID") %>' />
                        <asp:HiddenField ID="IsDeleted" runat="server" Value ='<%# Eval("IsDeleted") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Frequency_of_Annual_Maintenance_ContractLabel" runat="server" Text='<%# Eval("Frequency_of_Annual_Maintenance_Contract") %>' />
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
                                    
                                    <th runat="server">FMCID</th>
                                    <th runat="server">Frequency of AMC</th>
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
                        <asp:Label ID="FMCIDLabel" runat="server" Text='<%# Eval("FMCID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Frequency_of_Annual_Maintenance_ContractLabel" runat="server" Text='<%# Eval("Frequency_of_Annual_Maintenance_Contract") %>' />
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
          <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=AssetTaggingEntities" DefaultContainerName="AssetTaggingEntities" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="LUT_Frequency_Of_Annual_Maintenance_Contract">
        </asp:EntityDataSource>
          </div>
                    </td>
           </tr>
       </table> 
    </div>
       </asp:Content>
