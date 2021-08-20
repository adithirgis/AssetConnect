<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SGMasters.aspx.cs" Inherits="SGMasters" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Sub Groups</title>
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
      <a class="navbar-brand" href="#myPage">Asset Connect</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
         <li><a href="LogInP.aspx" onclick="LogInP.aspx">MASTERS</a></li>
           <li><a href="Regist.aspx" onclick="Regist.aspx">ASSET DETAILS</a></li>
        <li><a href="SearchAssets.aspx" onclick="SearchAssets.aspx">SEARCH</a></li>
            <li><a href="LocateAsset.aspx" onclick="LocateAsset.aspx">LOCATE YOUR ASSET</a></li>
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
      <h2 style="text-align:center;">
         Welcome: <asp:Label ID="lblUserID" runat="server" Text="UserID"></asp:Label></h2>
       
    <div class="col-sm-12">
        <h2 style="text-align:center">Sub Groups</h2>
     <div>
         <table> 
               <tr>
                <td style="width:284px"></td>
                <td class="auto-style2">
                   <span style="text-align:center">Group Name</span> <asp:DropDownList ID="DDAssetGroups" runat="server" class="form-control" Width="25%" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td class="auto-style4">
                    <asp:Button ID="btnAdd" runat="server" class="btn btn-default"  Text="Add" Height="29px" Width="97px" ForeColor="Black" />
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
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color:#999999;border-style:none;border-width:0.1px;font-family: 'Times New Roman', Times, serif;">
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