<%@ Page Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="SearchAssets.aspx.cs" Inherits="SearscAssets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div style="border:1px solid white ; width:30%; background-color:white; border-radius:4px; padding:6px 12px; height:auto; text-align: center; margin:50px 35%; /*box-shadow:5px 5px 13px #ccc*/">
        <h2 style="text-align:center">Search Assets</h2>
        <br />
      <div class="formLogIn" style="background-color:white; display: table-cell; padding:6px 12px; text-align: center; height: inherit; width: inherit;" >
       <div class="form-group" style="height:inherit;">
         <label for ="AN" style="float:left">Name Of Asset:</label>
                  <asp:TextBox ID="txtNameOfAsset" runat="server" placeholder="Enter Name of Asset" text-align="center" Style="float:right" class="form-control"  Height="30px"   Width="50%" margin="2px"></asp:TextBox>
                                    <br /> <br /> <label for ="AID" style="float:left">Asset Code (AID):</label>
                                  <asp:TextBox ID="txtAssetCode" runat="server" placeholder="Enter Asset ID" text-align="center" Style="float:right" class="form-control"  Height="30px"   Width="50%" margin="2px"></asp:TextBox>
               </div><br /><br />
          <asp:Button ID="btnAdd" runat="server"  Text="Add" class="btn btn-primary" style="float:left;" OnClick="btnAdd_Click" />
                    <asp:Button ID="btnFilter" runat="server"  Text="Filter" class="btn btn-warning" OnClick="btnFilter_Click" />
                         
            <asp:Button ID="btnEdit" runat="server"  Text="Edit" class="btn btn-primary" style="float:right;" OnClick="btnEdit_Click" />
           
    <div>
         <asp:GridView ID="AMG" runat="server" AutoGenerateColumns="False" DataKeyNames="AID" AllowPaging="True" Height="155px" Width="708px">
             <Columns>
                 <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                 <asp:BoundField DataField="AID" HeaderText="AID" ReadOnly="True" SortExpression="AID" />
                 <asp:BoundField DataField="Name_of_Asset" HeaderText="Name of Asset" SortExpression="Name_of_Asset" />
               <%--  <asp:BoundField DataField="AGrpID" HeaderText="AGrpID" SortExpression="AGrpID" />
                 <asp:BoundField DataField="MnfID" HeaderText="MnfID" SortExpression="MnfID" />
                 <asp:BoundField DataField="SPID" HeaderText="SPID" SortExpression="SPID" />
                 <asp:BoundField DataField="Date_of_Purchase" HeaderText="Date of Purchase" SortExpression="Date_of_Purchase" />
                 <asp:BoundField DataField="Date_of_Disposal" HeaderText="Date of Disposal" SortExpression="Date_of_Disposal" />
                 <asp:BoundField DataField="Purchase_Price" HeaderText="Purchase Price" SortExpression="Purchase_Price" />
                 <asp:BoundField DataField="FID" HeaderText="FID" SortExpression="FID" />
                 <asp:BoundField DataField="Current_Location_X" HeaderText="Location X" SortExpression="Location_X" />
                 <asp:BoundField DataField="Current_Location_Y" HeaderText="Location Y" SortExpression="Location_Y" />
                 <asp:BoundField DataField="CSID" HeaderText="CSID" SortExpression="CSID" />
                 <asp:BoundField DataField="CCID" HeaderText="CCID" SortExpression="CCID" />
                 <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                 <asp:BoundField DataField="Sub_Model" HeaderText="Sub Model" SortExpression="Sub_Model" />
                 <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                 <asp:BoundField DataField="TID" HeaderText="TID" SortExpression="TID" />
                 <asp:BoundField DataField="Depriciation_Value" HeaderText="Depriciation_Value" SortExpression="Depriciation_Value" />
                 <asp:CheckBoxField DataField="Warranty" HeaderText="Warranty" SortExpression="Warranty" />
                 <asp:CheckBoxField DataField="AMC" HeaderText="AMC" SortExpression="AMC" />
                 <asp:CheckBoxField DataField="PM" HeaderText="PM" SortExpression="PM" />
                 <asp:CheckBoxField DataField="QR" HeaderText="QR" SortExpression="QR" />
                 <asp:CheckBoxField DataField="NFC" HeaderText="NFC" SortExpression="NFC" />
                 <asp:CheckBoxField DataField="GPS" HeaderText="GPS" SortExpression="GPS" />
                 <asp:CheckBoxField DataField="Camera" HeaderText="Camera" SortExpression="Camera" />
                 <asp:CheckBoxField DataField="Barcode" HeaderText="Barcode" SortExpression="Barcode" />
                 <asp:BoundField DataField="ALPID" HeaderText="ALPID" SortExpression="ALPID" />
                 <asp:CheckBoxField DataField="Maintenance" HeaderText="Maintenance" SortExpression="Maintenance" />
                 <asp:BoundField DataField="MID" HeaderText="MID" SortExpression="MID" />
                 <asp:CheckBoxField DataField="RFID" HeaderText="RFID" SortExpression="RFID" />--%>
             </Columns>
         </asp:GridView>
         <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=AssetTaggingEntities" DefaultContainerName="AssetTaggingEntities" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="LUT_Assets_Masters">
         </asp:EntityDataSource>
        
         </div>
         </div>         
    </div>
        </asp:Content>
    
