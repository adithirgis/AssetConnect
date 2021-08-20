<%@ Page Language="C#" MasterPageFile="~/HomeMaster.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderM" Runat="Server">
    
    <style>
        .h3{
            font-size:45px;
        }
    </style>


    
<div class="container">
  <h2></h2>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
  
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <div class="carousel-inner">

      <div class="item active">
        <img src="images/try.jpg"  alt="Los Angeles" style="width:100%;">
        <div class="carousel-caption">
          <h3>We Connect</h3>
                 </div>
      </div>

      <div class="item">
        <img src="images/mohn.jpg" alt="Chicago" style="width:100%;">
        <div class="carousel-caption">
          <h3>We Locate</h3>
        
        </div>
      </div>
    
      <div class="item">
        <img src="images/try.jpg" alt="New York" style="width:100%;">
        <div class="carousel-caption">
          <h3>We Manage</h3>
          
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>


</asp:Content>
