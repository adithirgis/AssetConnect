<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPass.aspx.cs" Inherits="ForgotPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Forgot Password?</title>
</head>
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     <style>

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
        <li><a href="AssetC.aspx" onclick="AssetC.aspx">ABOUT</a></li>
        <li><a href="LogInP.aspx" onclick="LogInP.aspx">LOG IN</a></li>
           <li><a href="Regist.aspx" onclick="Regist.aspx">REGISTER</a></li>
        <li><a href="AssetC.aspx" onclick="AssetC.aspx">SERVICES</a></li>
        <li><a href="AssetC.aspx" onclick="AssetC.aspx">CONTACT</a></li>
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
         <h2 style="text-align:center">Forgot Password ?</h2>
       <div style="border:1px solid white ; width:30%; background-color:white; border-radius:4px; padding:6px 12px; height:auto; text-align: center; margin:50px 35%; /*box-shadow:5px 5px 13px #ccc*/">
             <div class="formLogIn" style="background-color:white; display: table-cell; padding:6px 12px; text-align: center; height: inherit; width: inherit;" >
          <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="CheckU&amp;SA" />
         <div class="form-group" style="height:inherit;">
<label for ="userid" style="float:left">User ID:</label>
               <asp:TextBox ID="txtUserID" runat="server" placeholder="Enter User ID" text-align="center" Style="float:right" class="form-control"  Height="30px"   Width="50%" margin="2px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserID" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red" ToolTip="Required Field" ValidationGroup="CheckU&amp;SA">*</asp:RequiredFieldValidator>
                  <br />  <br />  <asp:Button ID="btnCheck" runat="server" Text="Show Question" OnClick="btnCheck_Click" class="btn btn-warning" ValidationGroup="CheckU&amp;SA" />
                <br /> <br /> 
              <label for ="sq" style="float:left">Security Question:</label>
                                    <asp:Label ID="SecurityQ" runat="server" style="float:right;"></asp:Label>
               <br /> <br /> 
                 <label for ="sa" style="float:left">Security Answer:</label>
                 <asp:TextBox ID="txtSecurityA" runat="server" placeholder="Enter Security Answer" text-align="center" Style="float:right" class="form-control"  Height="30px"   Width="50%" margin="2px" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSecurityA" Display="Dynamic" ErrorMessage="Required Field" ForeColor="Red" ToolTip="Required Field" ValidationGroup="Check">*</asp:RequiredFieldValidator>
                            <br />    <br /> 
             <label for ="p" style="float:left">Password:</label>
                   <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" text-align="center" Style="float:right" class="form-control"  Height="30px"   Width="50%" margin="2px"></asp:TextBox>
                 <br /> 
             <br /> </div>
          <asp:Button ID="btnCA" runat="server" OnClick="btnCA_Click" Text="Check Answer"  style="float:left;" class="btn btn-warning" ValidationGroup="Check" />
                <asp:Button ID="btnLogIn" runat="server" OnClick="btnLogIn_Click" Text="LogIn"  style="float:right;" class="btn btn-success" />
        <br />
        <br />
    </div>
       </div></div>
  </div>
</div>


<footer class="container-fluid text-center">
  <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
  <p>Website Made By Parag Khatavkar,  Adithi R. Upadhya, Sanatomba Singh</p>
</footer>
    
        </div>    </form>
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
