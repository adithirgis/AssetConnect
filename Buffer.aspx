<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Buffer.aspx.cs" Inherits="Buffer" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  
<head runat="server">
     <title>Buffer Assets</title>
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
    #Legend {
        font-family: Arial, sans-serif;
        background: #fff;
        padding: 10px;
        margin: 10px;
        border: 1px solid #000;
      }
      #Legend h4 {
        margin-top: 0;
      }
      #Legend img {
        vertical-align: middle;
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
   <script type="text/javascript">
       var markers = [
           <asp:Repeater ID="rptMarkers" runat="server">
               <ItemTemplate>
                   {
                       "Name": '<%# Eval("AID") %>',
                    "lat": '<%# Eval("Current_Location_Y") %>',
            "lng": '<%# Eval("Current_Location_X") %>',
                "description": '<%# Eval("Description") %>',
                "CCId": '<%# Eval("CCID") %>'
            }
</ItemTemplate>
               <SeparatorTemplate> <%--/* this template is for creating a template that controls how the seperator between items is displayed lng from -180to 180 and lat from -90 to 90*/--%>
                   ,
</SeparatorTemplate>
           </asp:Repeater >
         
 ];
</script>
   <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
        <form id="form1" runat="server">
              <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
        <li><a href="check2.aspx" onclick="check2.aspx">LOCATE YOUR ASSET</a></li>
          <li><a href="SearchAssets.aspx" onclick="SearchAssets.aspx">SEARCH</a></li>
          <li><a href="Help.aspx" onclick="Help.aspx">HELP</a></li>
        <li><a href="AssetC.aspx" onclick="AssetC.aspx">LOG OUT</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container-fluid bg-grey text-center">
    <h2 style="text-align:center;">
         Welcome: <asp:Label ID="lblUserID" runat="server" Text="UserID"></asp:Label></h2>
    
  <div class="row">
    <div class="col-sm-4">
       <%-- <img src="images/SIconF.jpg" />--%>
       </div>
       <h2 style="text-align:center;">
       Search Area Assets</h2>
    <div class="col-sm-12">
  <%--<div id="DDmap" style="float:left; height:auto; width:100%; background-color: white; font-size: 18px;  text-align: center; padding: 30px 20px 30px 20px;">    --%>
         <h4 style="text-align:center;">
       LOCATION OF BUFFER</h4>
      <asp:TextBox ID="txtPointA1" runat="server" ClientIDMode="Static" Enabled="false"
                 Width="170px"></asp:TextBox>
<asp:TextBox ID="txtPointA2" runat="server" ClientIDMode="Static" Enabled="false"
                 Width="170px"></asp:TextBox> 
        <br />
         <h4 style="text-align:center;">
       ENTER RADIUS (Open Console)</h4>
                <asp:TextBox ID="txtPointB1" runat="server" placeholder="Enter Radius"
             onchange="drawCircle();" ClientIDMode="Static"></asp:TextBox>
   <ajaxToolkit:SliderExtender ID="sliderRadius" runat="server" BehaviorID="sliderRadius"   TargetControlID="txtPointB1" Minimum="200" Maximum="2000" 
                            BoundControlID="txtRadiusShow"
                            EnableHandleAnimation="true" EnableKeyboard="false"></ajaxToolkit:SliderExtender>                      
<%--<asp:TextBox ID="txtRadiusShow" runat="server" MaxLength="4" CssClass="setmargin"
               ClientIDMode="Static"></asp:TextBox> <span style="font-size: 9pt;"> </span>--%>
       
       </div>
  </div>
</div>

            <div id="map" style="height:500px;width:100%;"></div>
             <div id="Legend" style="height: 200px; width: 250px; float:right"><h4>Legend</h4></div>
 <script type="text/javascript" >                     //script for loader 
     $(window).on('beforeunload', function () { $(".loader").show(); });
     $(window).on('load', function () {
         $(".loader").hide();

     });
              </script> 
            <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBh2lM7YWg-0ywHxXAbMgJhLlEQmeX8yww&libraries=geometry&callback=loadMap"><%--callback=loadMap//sensor=false--%>
    </script>  
    <script type="text/javascript" >
      
        $(window).load(function () {
            
        });

    </script> 
    <script>
         var map;
         var circle;
         var marker1;
         var currentlatlng;
         var searchArea;
         var searchAreaMarker;
         function setLatLongValue() {
             jQuery('#txtPointA1').val(currentlatlng.lat()); //#txtPointA1
             jQuery('#txtPointA2').val(currentlatlng.lng());
         }

         function loadMap() {

             var infoWindow = new google.maps.InfoWindow();
             currentlatlng = new google.maps.LatLng(18.480748, 73.869152);
             map = new google.maps.Map(document.getElementById('map'), {
                 zoom: 16,
                 center: currentlatlng,
                 mapTypeId: 'terrain',
                 mapTypeControl: true,
                 navigationControl: true
             });

             for (i = 0; i < markers.length; i++) {                                   //loop for multiple markers
                 var data = markers[i];                                             //data collection with key and associated value
                 var myLatlng = new google.maps.LatLng(data.lat, data.lng);          //geographic point with input as lat and lng new point to be computed for each new one
                 switch (data.CCId) {
                     case "1":
                         icon = "images/red-dot.png";
                         break;
                     case "3":
                         icon = "images/yellow-dot.png";
                         break;
                     case "2":
                         icon = "images/green-dot.png";
                         break;

                 }
                 var marker = new google.maps.Marker({                  // object literal called marker image can be coustomised by setIcon() method, also has draggable property(true)
                     position: myLatlng,                                //taking the global variable position of marker inherent property or attribute
                     map: map,                                        // another field on where to put marker that map s id
                     title: "Assets",
                     icon: new google.maps.MarkerImage(icon)
                 });

                 (function (marker, data) {                            // another anonymous ftn with parameter as collection data and object marker
                     google.maps.event.addListener(marker, "click", function (e) {   // on click event what should it do marker object can listen to click, dblclick etc, addListener event handler: to register for event notifications
                         infoWindow.setContent(data.Name);                    // show id of the asset content of window 
                         infoWindow.open(map, marker);                      // open on clicking marker
                     });
                 })(marker, data);         // parameters of function

             }
             var legend = document.getElementById('Legend');
             div = document.createElement('div');
             div.innerHTML = '<span><img src="images/red-dot.png">Asset Working</span>';
             if (legend !== null) {
                 legend.appendChild(div);
             } else console.log("not able to append");
             var div = document.createElement('div');
             div.innerHTML = '<span><img src="images/green-dot.png">Asset Not Working</span>';
             if (legend !== null) {
                 legend.appendChild(div);
             } else alert("not able to append");
             var div = document.createElement('div');
             div.innerHTML = '<span><img src="images/yellow-dot.png">Asset Under Maintenance</span>';
             if (legend !== null) {
                 legend.appendChild(div);
             } else console.log("not able to append");
             var div = document.createElement('div');
             div.innerHTML = '<span><img src="images/Google Maps Markers/red_markerC.png">Create Buffer</span>';
             if (legend !== null) {
                 legend.appendChild(div);
             } else console.log("not able to append");

             map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(legend);
             google.maps.event.addDomListener(map, 'click', function (e) {

                 currentlatlng = e.latLng;

                 if (currentlatlng) {

                     map.panTo(currentlatlng);
                     setLatLongValue();
                     setMarker();
                 }
             });

             //for (var i = 0; i < markers.length; i++) {           // working
             //    var data = markers[i];
             //    console.log('Asset ID: ' + data.Name + ', position: ' + data.lat + ',' + data.lng)
             //    if (google.maps.geometry.spherical.computeDistanceBetween(currentlatlng, myLatlng) <= radius) {
             //        console.log('=> is in searchArea');
             //    } else {
             //        console.log('=> is NOT in searchArea');
             //    }
             //}

         }

         function drawCircle() {

             if (circle != undefined)
                 circle.setMap(null);

             var radius = 200;

             if (jQuery('#txtPointB1').val() != '' && !isNaN(jQuery('#txtPointB1').val()) && parseInt(jQuery('#txtPointB1').val()) > 0) {
                 radius = parseInt(jQuery('#txtPointB1').val());
             }
             jQuery('#txtPointB1').val(radius.toString());

             var options = {
                 strokeColor: '#800000',
                 strokeOpacity: 1.0,
                 strokeWeight: 1,
                 fillColor: '#C64D45',
                 fillOpacity: 0.5,
                 map: map,
                 center: currentlatlng,
                 radius: radius
             };

             circle = new google.maps.Circle(options);
             for (var i = 0; i < markers.length; i++) {
                 var data = markers[i];                                            //data collection with key and associated value
                 var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                 console.log('Asset ID: ' + data.Name + ', position: ' + data.lat + ',' + data.lng)
                 if (google.maps.geometry.spherical.computeDistanceBetween(myLatlng, currentlatlng) <= radius) {
                     console.log('=> is in searchArea');
                 } else {
                     console.log('=> is NOT in searchArea');
                 }
             }
         }
         function setMarker() {

             if (marker1 != undefined)
                 marker1.setMap(null);

             marker1 = new google.maps.Marker({
                 position: currentlatlng,
                 draggable: true,
                 icon: new google.maps.MarkerImage("images/Google Maps Markers/red_markerC.png"),
                 animation: google.maps.Animation.DROP,
                 title: 'Search Area Marker',
                 map: map
             });

             if (marker1) {
                 google.maps.event.addDomListener(marker1, "dragend", function () {
                     currentlatlng = marker1.getPosition();
                     setLatLongValue();
                     drawCircle();

                 });
                 drawCircle();
             }

         }

    </script>

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

 <%--The Slider extender control allows  user to choose a numeric value from a finite range. The Slider's orientation can be horizontal or vertical and it can also act as a "discrete" slider, allowing only a specified number of values within its range.
Added SliderExtender control with 2 Textboxes, one for TargetControlID, one for BoundControlID
BoundControlID is the ID of the TextBox or Label that dynamically displays the slider's value.
TargetControlID is the Targeted control. 
In TargetControlID textbox (txtPointB1), drawCirlce() javascript fucntion is called when silder value change,
this function is called in onchange event.--%>