<%@ Page Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="AssetDetails2.aspx.cs" Inherits="AssetDetails2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <style>
        
            .form-control {
                width:100%;
            }
        
    </style>
   <h2 style="text-align:center">Asset Masters 2</h2>
  
        <div style="border:1px solid white; width:500px; background-color:white; border-radius:8px; padding:12px 18px; text-align: center; margin-right: 31.4%; margin-left: 31.4%; margin-top: 50px; margin-bottom: 100px;" class="auto-style28">
        <div class="formAssetDetails2" style="background-color:white; display: table-cell; padding:12px 18px; text-align: center; height: inherit; width:700px;" >
          
                    <asp:Label ID="lblAID" runat="server" Text="AID"> Asset ID/Code:</asp:Label>
            <br />  <br />
                 <label for ="AW" style="float:left; margin:0 10px">Is Asset under Warranty</label>
                <label for ="AWN" style="float:right; margin:0 10px">No</label> <asp:RadioButton ID="NoW" runat="server" Checked="True" GroupName="Warranty" style="float:right; margin:0 10px" />
             <label for ="AWY" style="float:right; margin:0 10px">Yes</label><asp:RadioButton ID="YesW" runat="server" GroupName="Warranty" style="float:right;margin:0 10px"/>
            <br /> <br />
               <label for ="APM" style="float:left; margin:0 10px">Is Asset under PM</label>
                   <label for ="APMN" style="float:right; margin:0 10px">No</label> <asp:RadioButton ID="NoP" runat="server" Checked="True" GroupName="PM" style="float:right; margin:0 10px" />
                    <label for ="AWY" style="float:right; margin:0 10px">Yes</label><asp:RadioButton ID="YesP" runat="server" GroupName="PM" style="float:right; margin:0 10px"/>
             <br />  <br />
            <label for ="AAMC" style="float:left; margin:0 10px">Is Asset under AMC</label>
                                    <label for ="AAMCN" style="float:right; margin:0 10px">No</label><asp:RadioButton ID="NoA" runat="server" Checked="True" GroupName="AMC" style="float:right; margin:0 10px"  />
            <label for ="AAMCY" style="float:right; margin:0 10px">Yes</label> <asp:RadioButton ID="YesA" runat="server" GroupName="AMC" style="float:right; margin:0 10px" />
                  
            <br />  <br />
            <label for ="QR" style="float:left; margin:0 10px">Does Asset have QR code</label>
                 <label for ="QRN" style="float:right; margin:0 10px">No</label><asp:RadioButton ID="NoQ" runat="server" Checked="True" GroupName="QR" style="float:right; margin:0 10px"/>
            <label for ="QRY" style="float:right; margin:0 10px">Yes</label><asp:RadioButton ID="YesQ" runat="server" GroupName="QR" style="float:right; margin:0 10px"/>
                    <br />  <br />
            <label for ="NFC" style="float:left; margin:0 10px">Does Asset have NFC code</label>
                  <label for ="NFCN" style="float:right; margin:0 10px">No</label><asp:RadioButton ID="NoN" runat="server" Checked="True" GroupName="NFC" style="float:right; margin:0 10px" />
              <label for ="NFCY" style="float:right; margin:0 10px">Yes</label><asp:RadioButton ID="YesN" runat="server" GroupName="NFC" style="float:right; margin:0 10px" />
                    <br />  <br />
            <label for ="BR" style="float:left; margin:0 10px">Does Asset have barcode</label> 
                 <label for ="BCN" style="float:right; margin:0 10px">No</label><asp:RadioButton ID="NoB" runat="server" Checked="True" GroupName="BC" style="float:right; margin:0 10px"/>
                     <label for ="BCY" style="float:right; margin:0 10px">Yes</label><asp:RadioButton ID="YesB" runat="server" GroupName="BC" style="float:right; margin:0 10px"/>
                     <br />  <br />
            <label for ="RFID" style="float:left; margin:0 10px">Does Asset have RFID Tag</label> 
                                     <label for ="RN" style="float:right; margin:0 10px">No</label><asp:RadioButton ID="NoR" runat="server" Checked="True" GroupName="RFID" style="float:right; margin:0 10px" />
                    <label for ="RY" style="float:right; margin:0 10px">Yes</label><asp:RadioButton ID="YesR" runat="server" GroupName="RFID" style="float:right; margin:0 10px"/>
                <br />  <br />
            <label for ="GPS" style="float:left; margin:0 10px">Does Asset have GPS</label>     
                   
                    <label for ="GPSN" style="float:right; margin:0 10px">No</label><asp:RadioButton ID="NoG" runat="server" Checked="True" GroupName="GPS"  style="float:right; margin:0 10px"/>
                   <label for ="GPSY" style="float:right; margin:0 10px">Yes</label> <asp:RadioButton ID="YesG" runat="server" GroupName="GPS"  style="float:right; margin:0 10px"/>
                  <br />  <br />
            <label for ="C" style="float:left; margin:0 10px">Does Asset have camera</label>     
                  <label for ="CN" style="float:right; margin:0 10px">No</label><asp:RadioButton ID="NoC" runat="server" Checked="True" GroupName="Camera" style="float:right; margin:0 10px"/>
            <label for ="CY" style="float:right; margin:0 10px">Yes</label><asp:RadioButton ID="YesC" runat="server" GroupName="Camera" style="float:right; margin:0 10px" />
            <br />  <br />
            <label for ="C" style="float:left; margin:0 10px">Maintenance</label>  
                                  <label for ="MN" style="float:right; margin:0 10px">No</label><asp:RadioButton ID="NoM" runat="server" Checked="True" GroupName="Maintenance" style="float:right; margin:0 10px"/>
             <label for ="MY" style="float:right; margin:0 10px">Yes</label><asp:RadioButton ID="YesM" runat="server" GroupName="Maintenance" style="float:right; margin:0 10px"/>
                  
            <br /> <br /> <br />
            <input type="reset" value="Clear" class="btn btn-default" style="float:left;"/> 
                    <asp:Button ID="btnSave" runat="server"  Text="Save" Height="30px"   class="btn btn-success" OnClick="btnSave_Click" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" Height="30px"  class="btn btn-danger" />
                 <span class="ead2"><a href="EditAssetDetails2.aspx" style="text-decoration:underline; float:right; ">Previous Page</a></span> 
               </div>
    </div>
       </asp:Content>