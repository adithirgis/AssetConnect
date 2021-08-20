<%@ Page Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="AssetDetails.aspx.cs" Inherits="Transactions" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--  <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>--%>
    <ajaxToolkit:ToolkitScriptManager ID="TScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>
    <style>
        
            .form-control {
                width:100%;
            }
        
    </style>
   <h2 style="text-align:center">Asset Masters</h2>
     <asp:multiview ID="MV" runat="server" ActiveViewIndex="0" >
        <asp:View ID="AssetDetails" runat="server" >
           <div style="border:1px solid white; background-color:white; border-radius:8px; padding:12px 18px; text-align: center; margin-right: 25%; margin-left: 25%; margin-top: 50px; margin-bottom: 100px;" class="auto-style28">
        <div class="formAssetDetails" style="background-color:white; display: table-cell; padding:12px 18px; text-align: center; height: inherit; width:700px;" >
                    <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="Save"  ForeColor="Red" runat="server" />
                <br />
          <br />
            <label for ="AID" style="float:left;">Asset ID</label>
                    <asp:TextBox ID="txtAssetCode" runat="server"  placeholder="Enter Asset ID" text-align="center"  class="form-control"  Height="30px" style="float:right;"  Width="50%" margin="2px"></asp:TextBox>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtAssetCode" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red" ToolTip="Required Field" ValidationGroup="Save">*</asp:RequiredFieldValidator>
                <br />  <br /> 
                   <label for ="NameofAsset" style="float:left;">Name of Asset</label> <asp:TextBox ID="txtNameOfAsset" runat="server" style="float:right;"  placeholder="Enter Name of Asset" text-align="center"  class="form-control"  Height="30px"  Width="50%" margin="2px"></asp:TextBox>
               
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNameOfAsset" Display="Dynamic" ErrorMessage="Name is Mandatory" ForeColor="Red" ToolTip="Name is Mandatory" ValidationGroup="Save">*</asp:RequiredFieldValidator>
            <br /> <br />
            
              <label for ="AssetGroup" style="float:left;">Asset Group</label><asp:DropDownList ID="DDAssetGroups" runat="server"  placeholder="Enter Asset Group" text-align="center"  class="form-control"  Height="30px" style="float:right;"  Width="50%" margin="2px">
                    </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic" ErrorMessage="Asset Group is Required" ForeColor="Red" ToolTip="Asset Group is Required" ControlToValidate="DDAssetGroups" ValidationGroup="Save">*</asp:RequiredFieldValidator>
                <br /> <br />
           
              <%-- <br /> <br />
            <label for ="CLX" style="float:left;"> Current Location X</label>
                    <asp:TextBox ID="txtCurrentLocationX" runat="server"  placeholder="Enter Current Location X" text-align="center"  class="form-control"  Height="30px" style="float:right;" Width="50%" margin="2px"></asp:TextBox>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtCurrentLocationX" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red" ToolTip="Required Field" ValidationGroup="Save">*</asp:RequiredFieldValidator>
                 <br /> <br />
            <label for ="CLY" style="float:left;"> Current Location Y</label>
                    <asp:TextBox ID="txtCurrentLocationY" runat="server"  placeholder="Enter Current Location Y" text-align="center"  class="form-control"  Height="30px" style="float:right;"  Width="50%" margin="2px"></asp:TextBox>
               
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtCurrentLocationY" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red" ToolTip="Required Field" ValidationGroup="Save">*</asp:RequiredFieldValidator>
                 --%>
           
               <label for ="Manufacturer" style="float:left;">Manufacturer Name</label>
                    <asp:DropDownList ID="DDManufacturer" runat="server" placeholder="Enter Manufacturer Name" text-align="center"  class="form-control"  Height="30px" style="float:right;"  Width="50%" margin="2px">
                    </asp:DropDownList>
               
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DDManufacturer" Display="Dynamic" ErrorMessage="Manufacturer Name is Required" ForeColor="Red" ToolTip="Manufacturer Name is Required" ValidationGroup="Save">*</asp:RequiredFieldValidator>
                <br /> <br />
            
                <label for ="ServiceP" style="float:left;">Service Provider</label>
                    <asp:DropDownList ID="DDServiceProvider" runat="server" placeholder="Enter Service Provider" text-align="center"  class="form-control"  Height="30px" style="float:right;"  Width="50%" margin="2px">
                    </asp:DropDownList>
               
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="DDServiceProvider" Display="Dynamic" ErrorMessage="Service Provider  is Required" ForeColor="Red" ToolTip="Service Provider  is Required" ValidationGroup="Save">*</asp:RequiredFieldValidator>
              <br />  <br />
           <label for ="DOP" style="float:left;">Date Of Purchase</label>
                    <asp:TextBox ID="txtDateOfPurchase" runat="server"  placeholder="Enter Date of Purchase" text-align="center"  class="form-control"  Height="30px" style="float:right;"  Width="50%" margin="2px"></asp:TextBox>
            <asp:ImageButton ID="imgPopup" ImageUrl="images/calender.png" ImageAlign="Bottom" runat="server" />
            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"  PopupButtonID="imgPopup" TargetControlID="txtDateOfPurchase" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDateOfPurchase" Display="Dynamic" ErrorMessage="Date of Purchase is Required" ForeColor="Red" ToolTip="Date of Purchase is Required" ValidationGroup="Save">*</asp:RequiredFieldValidator>
               <br /> <br />
            <label for ="DOD" style="float:left;">Date of Disposal</label>
                    <asp:TextBox ID="txtDateOfDisposal" runat="server"  placeholder="Enter Date of Disposal" text-align="center"  class="form-control"  Height="30px" style="float:right;"  Width="50%" margin="2px"></asp:TextBox>
             <asp:ImageButton ID="imgPopup2" ImageUrl="images/calender.png" ImageAlign="Bottom" runat="server" />
            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server"  PopupButtonID="imgPopup2" TargetControlID="txtDateOfDisposal" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender>
                  
            <br /> <br />
               <label for ="Depriciation" style="float:left;">Depriciation Value</label>
                    <asp:TextBox ID="txtDepriciationValue" runat="server"  placeholder="Enter Depriciation Value" text-align="center"  class="form-control"  Height="30px" style="float:right;"  Width="50%" margin="2px"></asp:TextBox>
               
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDepriciationValue" Display="Dynamic" ErrorMessage="Depriciation Value is Required" ForeColor="Red" ToolTip="Depriciation Value is Required" ValidationGroup="Save">*</asp:RequiredFieldValidator>
               <br /> <br />
            
            <label for ="Maintenance" style="float:left;">Maintenance</label>
                    <asp:DropDownList ID="DDMaintenance" runat="server" placeholder="Enter Maintenance Type" text-align="center"  class="form-control"  Height="30px" style="float:right;"  Width="50%" margin="2px">
                    </asp:DropDownList>
               
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="DDMaintenance" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red" ToolTip="Required Field" ValidationGroup="Save">*</asp:RequiredFieldValidator>
                <br /> <br />
            <label for ="Frequency" style="float:left;">Frequency of AMC or PM</label>
                    <asp:DropDownList ID="DDFrequency" runat="server" placeholder="Enter Frequency" text-align="center"  class="form-control"  Height="30px" style="float:right;"  Width="50%" margin="2px">
                    </asp:DropDownList>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="DDFrequency" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red" ToolTip="Required Field" ValidationGroup="Save">*</asp:RequiredFieldValidator>
                 <br /> <br />
            <label for ="PurchasePrice" style="float:left;">Purchase Price</label>
                    <asp:TextBox ID="txtPurchasePrice" runat="server"  placeholder="Enter Purchase Price" text-align="center"  class="form-control"  Height="30px" style="float:right;"  Width="50%" margin="2px"></asp:TextBox>
               
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtPurchasePrice" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red" ToolTip="Required Field" ValidationGroup="Save">*</asp:RequiredFieldValidator>
                 <br /> <br />
            <label for ="AssetPhoto" style="float:left;">Photo of Asset</label>
                    <asp:Image ID="Image1" runat="server" />
             <br /> <br />
            <label for ="LX" style="float:left;">Longitude</label>
                    <asp:TextBox ID="txtLocationX" runat="server"  placeholder="Enter Location X" text-align="center"  class="form-control"  Height="30px" style="float:right;"  Width="50%" margin="2px"></asp:TextBox>
               
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtLocationX" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red" ToolTip="Required Field" ValidationGroup="Save">*</asp:RequiredFieldValidator>
                 <br /> <br />
            <label for ="LY" style="float:left;">Latitude</label>
                    <asp:TextBox ID="txtLocationY" runat="server"  placeholder="Enter Location Y" text-align="center"  class="form-control"  Height="30px" style="float:right;"  Width="50%" margin="2px"></asp:TextBox>
               
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtLocationY" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red" ToolTip="Required Field" ValidationGroup="Save">*</asp:RequiredFieldValidator>
                    <%--  <label for ="CA" style="float:left;">Camera Status</label>

                    <asp:DropDownList ID="DDCameraStatus" runat="server" placeholder="Enter Camera Status" text-align="center"  class="form-control"  Height="30px" style="float:right;"  Width="50%" margin="2px">
                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="DDCameraStatus" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red" ToolTip="Required Field" ValidationGroup="Save">*</asp:RequiredFieldValidator>
                <br />  <br /> --%><br /> <br />
            <label for ="CS" style="float:left;">Current Status</label>
                    <asp:DropDownList ID="DDCurrentStatus" runat="server" placeholder="Enter Current Status" text-align="center"  class="form-control"  Height="30px" style="float:right;"  Width="50%" margin="2px">
                    </asp:DropDownList>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="DDCurrentStatus" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red" ToolTip="Required Field" ValidationGroup="Save">*</asp:RequiredFieldValidator>
                   <br /> <br />
            <label for ="CC" style="float:left;">Current Condition</label>
                    <asp:DropDownList ID="DDCurrentCondition" runat="server" placeholder="Enter Current Condition" text-align="center"  class="form-control"  Height="30px" style="float:right;"  Width="50%" margin="2px">
                    </asp:DropDownList>
               
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="DDCurrentCondition" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red" ToolTip="Required Field" ValidationGroup="Save">*</asp:RequiredFieldValidator>
                           <br />  <br /> 
                    <%--inbuilt for reset button.--%><label for ="ALP" style="float:left;">Asset Leased or Purchased</label>
                    <asp:DropDownList ID="DDAssetPurOrLea" runat="server" placeholder="Asset L or P" text-align="center"  class="form-control "  Height="30px" style="float:right;"  Width="50%" margin="2px">
                    </asp:DropDownList>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="DDAssetPurOrLea" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red" ToolTip="Required Field" ValidationGroup="Save">*</asp:RequiredFieldValidator>
                <br />   <br /><label for ="M" style="float:left;">Model</label>
                    <asp:TextBox ID="txtModel" runat="server"  placeholder="Enter Model" text-align="center"  class="form-control"  Height="30px" style="float:right;"  Width="50%" margin="2px"></asp:TextBox>
              
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="txtModel" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red" ToolTip="Required Field" ValidationGroup="Save">*</asp:RequiredFieldValidator>
                  <br />  <br /> <label for ="SM"  style="float:left;">Sub Model</label>
                    <asp:TextBox ID="txtSubModel" runat="server"  placeholder="Enter Sub Model" text-align="center"  class="form-control"  Height="30px" style="float:right;" Width="50%" margin="2px"></asp:TextBox>
                 <br />   <br /><label for ="TT" style="float:left;">TagType</label>
                    <asp:DropDownList ID="DDTagType" runat="server" placeholder="Enter Tag Type" text-align="center"  class="form-control "  Height="30px" style="float:right;"  Width="50%" margin="2px">
                    </asp:DropDownList>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="DDTagType" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red" ToolTip="Required Field" ValidationGroup="Save">*</asp:RequiredFieldValidator>
                <br /> <br />
            <label for ="SG" style="float:left;">Sub Group</label>
                    <asp:DropDownList ID="DDSubGroup" runat="server" placeholder="Enter Subgroup" text-align="center"  class="form-control "  Height="30px" style="float:right;"  Width="50%" margin="2px">
                    </asp:DropDownList>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DDSubGroup" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red" ToolTip="Required Field" ValidationGroup="Save">*</asp:RequiredFieldValidator>
                <br /> <br />
            
           <label for ="Des" style="float:left;">Description</label>
                    <asp:TextBox ID="txtDescription" runat="server"  placeholder="Description" text-align="center"  class="form-control"  Height="30px" style="float:right;"  Width="50%" margin="2px"></asp:TextBox>
                 <br />  <br />
            <%-- <input type="reset" style=" border-radius: 4px; height:37px; float:left; margin:2px" OnClick="AssetDetails.aspx" class="btn btn-default"  value="Clear"  />--%>  <%--inbuilt for reset button.--%>
              <asp:Button ID="Button1" runat="server"  Text="Next"  style="float:right; Height:30px;"  class="btn btn-default" OnClick="btnNext_Click" />      
  </div>
            </div>  
        </asp:View>
        <asp:view ID="AssetDetails2" runat="server" >
             <div style="border:1px solid white; width:500px; background-color:white; border-radius:8px; padding:12px 18px; text-align: center; margin-right: 31.4%; margin-left: 31.4%; margin-top: 50px; margin-bottom: 100px;" class="auto-style28">
        <div class="formAssetDetails2" style="background-color:white; display: table-cell; padding:12px 18px; text-align: center; height: inherit; width:700px;" >
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
            <label for ="M" style="float:left; margin:0 10px">Maintenance</label>  
                                  <label for ="MN" style="float:right; margin:0 10px">No</label><asp:RadioButton ID="NoM" runat="server" Checked="True" GroupName="Maintenance" style="float:right; margin:0 10px"/>
             <label for ="MY" style="float:right; margin:0 10px">Yes</label><asp:RadioButton ID="YesM" runat="server" GroupName="Maintenance" style="float:right; margin:0 10px"/>
                  
            <br /> <br /> <br />
             <asp:Button ID="Button2" runat="server"  Text="Previous"  style="float:left; Height:30px;"  class="btn btn-default" OnClick="btnPrevious_Click" />
            <%--<input type="reset" value="Clear" class="btn btn-default" style="float:left;"/> 
                    <asp:Button ID="Button1" runat="server"  Text="Save" Height="30px"   class="btn btn-success" OnClick="btnSave_Click" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" Height="30px"  class="btn btn-danger" />
                 <span class="ead2"><a href="EditAssetDetails2.aspx" style="text-decoration:underline; float:right; ">Previous Page</a></span>--%> 
               </div>
    </div>
            <asp:Button ID="btnSave"   runat="server"  Text="Save" style=" border-radius: 4px" class="btn btn-success" ForeColor="White" Height="37px"  margin="2px" OnClick="btnSave_Click" ValidationGroup="Save" />
                
        </asp:view>
    </asp:multiview>
       
       </asp:Content>