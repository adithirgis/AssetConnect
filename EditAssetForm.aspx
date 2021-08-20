<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditAssetForm.aspx.cs" Inherits="EditAssetForm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Asset Details</title>
</head>
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     <style>
.loader {
              position: fixed;
              left: 0px;
              top: 0px;
              width: 100%;
              height: 100%;
              z-index: 9999;
              background: url('http://localhost:49446/images/load.gif') 50% 50% no-repeat rgb(249,249,249);
              opacity: 1.8;
          }
  body {
      font: 400 15px Lato, sans-serif;
      line-height: 1.8;
      color: #818181;
  }
  h2 {
      font-size: 24px;
      text-transform: uppercase;
      color: #303030;
      font-weight: 600;
      margin-bottom: 30px;
  }
  h4 {
      font-size: 19px;
      line-height: 1.375em;
      color: #303030;
      font-weight: 400;
      margin-bottom: 30px;
  }  
  .jumbotron {
      background-color: #f4511e;
      color: #fff;
      padding: 100px 25px;
      font-family: Montserrat, sans-serif;
  }
  .container-fluid {
      padding: 60px 50px;
  }
  .bg-grey {
      background-color: #f6f6f6;
  }
  .logo-small {
      color: #f4511e;
      font-size: 50px;
  }
  .logo {
      color: #f4511e;
      font-size: 200px;
  }
  .thumbnail {
      padding: 0 0 15px 0;
      border: none;
      border-radius: 0;
  }
  .thumbnail img {
      width: 100%;
      height: 100%;
      margin-bottom: 10px;
  }
  .carousel-control.right, .carousel-control.left {
      background-image: none;
      color: #f4511e;
  }
  .carousel-indicators li {
      border-color: #f4511e;
  }
  .carousel-indicators li.active {
      background-color: #f4511e;
  }
  .item h4 {
      font-size: 19px;
      line-height: 1.375em;
      font-weight: 400;
      font-style: italic;
      margin: 70px 0;
  }
  .item span {
      font-style: normal;
  }
  .panel {
      border: 1px solid #f4511e; 
      border-radius:0 !important;
      transition: box-shadow 0.5s;
  }
  .panel:hover {
      box-shadow: 5px 0px 40px rgba(0,0,0, .2);
  }
  .panel-footer .btn:hover {
      border: 1px solid #f4511e;
      background-color: #fff !important;
      color: #f4511e;
  }
  .panel-heading {
      color: #fff !important;
      background-color: #f4511e !important;
      padding: 25px;
      border-bottom: 1px solid transparent;
      border-top-left-radius: 0px;
      border-top-right-radius: 0px;
      border-bottom-left-radius: 0px;
      border-bottom-right-radius: 0px;
  }
  .panel-footer {
      background-color: white !important;
  }
  .panel-footer h3 {
      font-size: 32px;
  }
  .panel-footer h4 {
      color: #aaa;
      font-size: 14px;
  }
  .panel-footer .btn {
      margin: 15px 0;
      background-color: #f4511e;
      color: #fff;
  }
  .navbar {
      margin-bottom: 0;
      background-color: #f4511e;
      z-index: 9999;
      border: 0;
      font-size: 12px !important;
      line-height: 1.42857143 !important;
      letter-spacing: 4px;
      border-radius: 0;
      font-family: Montserrat, sans-serif;
  }
  .navbar li a, .navbar .navbar-brand {
      color: #fff !important;
  }
  .navbar-nav li a:hover, .navbar-nav li.active a {
      color: #f4511e !important;
      background-color: #fff !important;
  }
  .navbar-default .navbar-toggle {
      border-color: transparent;
      color: #fff !important;
  }
  footer .glyphicon {
      font-size: 20px;
      margin-bottom: 20px;
      color: #f4511e;
  }
  .slideanim {visibility:hidden;}
  .slide {
      animation-name: slide;
      -webkit-animation-name: slide;
      animation-duration: 1s;
      -webkit-animation-duration: 1s;
      visibility: visible;
  }
  @keyframes slide {
    0% {
      opacity: 0;
      transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      transform: translateY(0%);
    }
  }
  @-webkit-keyframes slide {
    0% {
      opacity: 0;
      -webkit-transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      -webkit-transform: translateY(0%);
    }
  }
  @media screen and (max-width: 768px) {
    .col-sm-4 {
      text-align: center;
      margin: 25px 0;
    }
    .btn-lg {
        width: 100%;
        margin-bottom: 35px;
    }
  }
  @media screen and (max-width: 480px) {
    .logo {
        font-size: 150px;
    }
  }
  </style>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
        <form id="form1" runat="server">
             <ajaxToolkit:ToolkitScriptManager ID="TScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>
             <div class="loader"></div> 
        <div>
  <nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Asset Connect</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
         <li><a href="LogInP.aspx" onclick="LogInP.aspx">MASTERS</a></li>
           <li><a href="Regist.aspx" onclick="Regist.aspx">ASSET DETAILS</a></li>
        <li><a href="LocateAssets.aspx" onclick="LocateAssets.aspx">LOCATE YOUR ASSET</a></li>
          <li><a href="MainPage.aspx" onclick="MainPage.aspx">SEARCH</a></li>
          <li><a href="Help.aspx" onclick="Help.aspx">HELP</a></li>
        <li><a href="AssetC.aspx" onclick="AssetC.aspx">LOG OUT</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container-fluid bg-grey text-center">
  <div class="row">
    <div class="col-sm-4">
       <%-- <img src="images/SIconF.jpg" />--%>
       </div>
      
    <div class="col-sm-12">
     <h2 style="text-align:center;">Welcome: <asp:Label ID="lblUserID" runat="server" Text="UserID"></asp:Label></h2>
                       <asp:Label ID="lblAID" runat="server" Text="AID"> Edit Asset ID/Code:</asp:Label>
       <br />
               <asp:multiview ID="MV" runat="server" ActiveViewIndex="0" >
        <asp:View ID="EditAssetDetails1" runat="server" >
           <div style="border:1px solid white; background-color:white; border-radius:8px; padding:12px 18px; text-align: center; height: inherit; width:50%; margin-right: 25%; margin-left: 25%; " class="auto-style28">
        <div class="formAssetDetails" style="background-color:white; display: table-cell; padding:12px 18px; text-align: center; height: inherit; width:50%;" >
                   <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="Save"  ForeColor="Red" runat="server" />
                <br />
          <br />
           
                   <label for ="NameofAsset" style="float:left;">Name of Asset</label> <asp:TextBox ID="txtNameOfAsset" runat="server" style="float:right;"  placeholder="Enter Name of Asset" text-align="center"  class="form-control"  Height="30px"  Width="50%" margin="2px"></asp:TextBox>
               
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNameOfAsset" Display="Dynamic" ErrorMessage="Name is Mandatory" ForeColor="Red" ToolTip="Name is Mandatory" ValidationGroup="Save">*</asp:RequiredFieldValidator>
            <br /> <br />
            
              <label for ="AssetGroup" style="float:left;">Asset Group</label><asp:DropDownList ID="DDAssetGroups" runat="server"  placeholder="Enter Asset Group" text-align="center"  class="form-control"  Height="30px" style="float:right;"  Width="50%" margin="2px">
                    </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" Display="Dynamic" ErrorMessage="Asset Group is Required" ForeColor="Red" ToolTip="Asset Group is Required" ControlToValidate="DDAssetGroups" ValidationGroup="Save">*</asp:RequiredFieldValidator>
                <br /> <br />
           
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
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDateOfPurchase" Display="Dynamic" ErrorMessage="Date of Purchase is Required" ForeColor="Red" ToolTip="Date of Purchase is Required" ValidationGroup="Save">*</asp:RequiredFieldValidator>
               <br /> <br />
            <label for ="DOD" style="float:left;">Date of Disposal</label>
                    <asp:TextBox ID="txtDateOfDisposal" runat="server"  placeholder="Enter Date of Disposal" text-align="center"  class="form-control"  Height="30px" style="float:right;"  Width="50%" margin="2px"></asp:TextBox>
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
                   <br /> <br />
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
              <asp:Button ID="Button1" runat="server"  Text="Next"  style="float:inherit; Height:30px;"  class="btn btn-default" OnClick="btnNext_Click" /> 
                  
    </div>
            </div>  
        </asp:View>
        <asp:view ID="EditAssetDetails2" runat="server" >
              <div style="border:1px solid white; background-color:white; border-radius:8px; padding:12px 18px; text-align: center; height: inherit; width:50%; margin-right: 25%; margin-left: 25%; " class="auto-style28">
        <div class="formAssetDetails" style="background-color:white; display: table-cell; padding:12px 18px; text-align: center; height: inherit; width:50%;" >
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
              <asp:Button ID="Button2" runat="server"  Text="Previous"  style="float:inherit; Height:30px;"  class="btn btn-default" OnClick="btnPrevious_Click" />
              </div>
    </div> <br /> <br />
            <asp:Button ID="btnUpdate"   runat="server"  Text="Update" style=" border-radius: 4px" class="btn btn-success" ForeColor="White" Height="37px"  margin="2px" OnClick="btnUpdate_Click" ValidationGroup="Save" />
              
        </asp:view>
    </asp:multiview>  
    </div>
  </div>
</div>


<footer class="container-fluid text-center">
  <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
  <p>Website Made By Parag Khatavkar,  Adithi R. Upadhya, Sanatomba Singh</p>
</footer>
    
        </div>    </form>
    <script type="text/javascript">  
        function AssetG() {
            
            var e = document.getElementById('<%=DDAssetGroups.ClientID%>');
           
            var strUser1 = e.selectedIndex;
            if (strUser1 ==0) 
            {
                alert("Please select Asset Group");
                return false;
            }
            else { return true;}
        }

   </script> 
    <script type="text/javascript" >                     //script for loader 
        $(window).on('beforeunload', function () { $(".loader").show(); });
        $(window).on('load', function () {
            $(".loader").hide();

        });
              </script> 
<script>
$(document).ready(function(){
  
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
   
    if (this.hash !== "") {
     
      event.preventDefault();
      var hash = this.hash;
   $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
     window.location.hash = hash;
      });
    } 
  });
    $(window).scroll(function() {
    $(".slideanim").each(function(){
      var pos = $(this).offset().top;
              var winTop = $(window).scrollTop();
        if (pos < winTop + 600) {
          $(this).addClass("slide");
        }
    });
  });
})
</script>

</body>
</html>