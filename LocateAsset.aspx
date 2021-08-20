<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LocateAsset.aspx.cs" Inherits="LocateAsset" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Locate Assets</title>
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
                <ItemTemplate>                                       /*  Repeater marker template which is used for getting data from the backend can define data here too*/
                    {
                        "AID": '<%# Eval("AId") %>',   
                  "Name": '<%# Eval("Name") %>',            
                    "lat": '<%# Eval("lat") %>',        
            "lng": '<%# Eval("lng") %>',              
                "AGrpId": '<%# Eval("AGrpId") %>',       
                "Agrp": '<%# Eval("AG") %>',
                 "SGId": '<%# Eval("SGId") %>',
                "SG": '<%# Eval("SG") %>',
                 "MnfId": '<%# Eval("MnfId") %>',
                 "Mnf": '<%# Eval("Mnf") %>',
                 "SPId": '<%# Eval("SPId") %>',
                 "SP": '<%# Eval("SP") %>',
                 "FId": '<%# Eval("FId") %>',
                "Fre": '<%# Eval("Fre") %>',
                "CSId": '<%# Eval("CSId") %>',
                 "CS": '<%# Eval("CS") %>',
                "CCId": '<%# Eval("CCId") %>',
                "CC": '<%# Eval("CC") %>',
                "Model": '<%# Eval("Model") %>',
                "TId": '<%# Eval("TTId") %>',
                "TT": '<%# Eval("TT") %>',
                 "Camera": '<%#Eval("Came")%>',      
                               "ALPId": '<%# Eval("ALPId") %>',
                "ALP": '<%# Eval("ALP") %>',
                "description": '<%# Eval("des") %>'
            }
</ItemTemplate>
            <SeparatorTemplate> <%--/* this template is for creating a template that controls how the seperator between items is displayed lng from -180to 180 and lat from -90 to 90*/--%>
                ,
</SeparatorTemplate>
            </asp:Repeater >
          ];
</script>
    <script async 
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDbhJ8gUD4kWmTcdSolp-30sa7twS8U5ZA&libraries=places&sensor=false">
     </script>  
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
        Locate Assets</h2>
    <div class="col-sm-12">
    <div id="DDmap" style="float:left; height:auto; width:100%; background-color: white; font-size: 18px;  text-align: center; padding: 30px 20px 30px 20px;">    <%--filtering div--%>
    <%-- <div id="side" style=" background-color: white;
    font-size: 18px;
    text-align: center; padding: 50px 20px 50px 20px;" class="auto-style3">--%>
                                      
                           
                <h3 style="text-align:center;">
        FILTER ASSETS</h3>
                         <br />     
                     <asp:DropDownList ID="DDCondition" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDCondition_SelectedIndexChanged" style="float:left;"  Width="33%" margin="2px" text-align="center"  class="form-control"  Height="35px"  >
    </asp:DropDownList>
                        <asp:DropDownList ID="DDStatus" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDStatus_SelectedIndexChanged" style="float: right" Width="33%" margin="2px" text-align="center"  class="form-control"  Height="35px"  >
    </asp:DropDownList>
                      <asp:DropDownList ID="DDGroup" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDGroup_SelectedIndexChanged" Width="34%" margin="2px" text-align="center"  class="form-control"  Height="35px" style="float:inherit" >
    </asp:DropDownList> <br /> 
       <br /><asp:Button ID="btnBuffer"   runat="server"  Text="Buffer" class="btn btn-default"  Height="37px"  margin="2px" OnClick="btnBuffer_Click"  />
        
   </div>
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
     <script type="text/javascript">  
          var clicked = false;                        // this bool is for click on the infowindow
         
          window.onload = function initMap() {
              var clicked = false;// this bool is for click on the infowindow
              var center = new google.maps.LatLng(0, 0);               //  the center on the map
              if (markers.length > 0)                            //checking if the repeater marker has data or not
              { center = new google.maps.LatLng(markers[0].lat, markers[0].lng); }
              else {
                  alert("No such asset available");
              }
              var mapOptions = {                // map parameters as center zoom etc
                  center: center,
                  zoom: 8,
                  mapTypeId: google.maps.MapTypeId.ROADMAP
              };
              var map = new google.maps.Map(document.getElementById("map"), mapOptions);    // getting the map using api
              var legend = document.getElementById('Legend');                     // creating legend using JavaScript to be pushed on the map
              div = document.createElement('div');
              div.innerHTML = '<span><img src="images/red-dot.png">Asset Working</span><br/>';
              if (legend !== null) {
                  legend.appendChild(div);
              } else console.log("not able to append");
              var div = document.createElement('div');
              div.innerHTML = '<span><img src="images/green-dot.png">Asset Not Working</span><br/>';
              if (legend !== null) {
                  legend.appendChild(div);
              } else alert("not able to append");
              var div = document.createElement('div');
              div.innerHTML = '<span><img src="images/yellow-dot.png">Asset Under Maintenance</span><br/>';
              if (legend !== null) {
                  legend.appendChild(div);
              } else alert("not able to append");

              map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(legend);
              for (i = 0; i < markers.length; i++) {              //  getting the marker lat long to be out on the map
                  var data = markers[i]
                  var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                  switch (data.CCId) {                              //condition to change color based on the current condition CCId 1 is working etc
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
                  //default case 
                  var marker = new google.maps.Marker({                       // this is for marker to be fetche from google api and its properties
                      position: myLatlng,
                      map: map,
                      title: data.Name,
                      icon: new google.maps.MarkerImage(icon)
                  });

                  var contentString = '<div id="content">' +            //This is the content string for the content on the infowindow which has buttons
                      '<h4>Asset Details</h4>' +
                      '<div id="bodyContent">' +
                      ' <div id="outer" style="width:100%; text-align:center">' +
                      '<div class="inner" style="display: inline-block;"><button id="AI" class="btn btn-default" onClick="AI();" >Information</button></div>' +
                      ' <div class="inner" style="display: inline-block;"><button id="AP"  class="btn btn-default" onClick="AP();">Parameters</button></div>' +
                      ' <div class="inner" style="display: inline-block;"><button id="AB" class="btn btn-default" onClick="AB();">Borrow</button></div>' +

                      '</div>' +
                      '</div>';
                  var infoWindow = new google.maps.InfoWindow({ content: contentString }); // initialisation of infowindow which appears when a marker is clicked
                  (function (marker, data) {
                      google.maps.event.addListener(marker, "click", function (e) {        // click event handling if one of the button is clicked in the infowindow
                          clicked = true;
                          infoWindow.setContent(contentString);         //    data.Name Content is changed 
                          infoWindow.open(map, marker);
                          document.getElementById('AI').onclick = function AI() {        // Asset Information is given in this string which comes from the repeater marker
                              infoWindow.setContent(                                // content changes
                                 
                                  '<h4>Asset Details</h4>' +
                                  '<div id="bodyContent">' +
                                  '<h5>Asset Information</h5>' +
                                         '<div id="AID">AssetID: ' + data.AID + '</div >' +
                                  '<div id="AssetName">Asset Name: ' + data.Name + '</div >' +
                                  '<div id="AGrpId">Asset Group: ' + data.Agrp + '</div >' +
                                  '<div id="SGId">Sub Group: ' + data.SG + '</div >' +
                                  '<div id="MnfId">Manufacturer of Asset: ' + data.Mnf + '</div >' +
                                  '<div id="SPId">Service Provider of Asset: ' + data.SP + '</div >' +
                                  '<div id="FId">Frequency of Warranty/Quaranty/PMC/AMC: ' + data.Fre + '</div >' +
                                  '<div id="TId">Tag type on Asset: ' + data.TT + '</div >' +
                                  '<div id="MId">Model of Asset: </div>' + data.Mnf + '</div >' +
                                  '<div id="description">Any other details: ' + data.description + '</div >' +
                                  '<div id="Camera">Does Asset have a camera: ' + data.Camera + '</div >' +
                                  '</div>');
                                  
                          };
                          document.getElementById('AP').onclick = function AP() {                // this is for real time auditing of the data Current Condition and Status if the user presses Parameters then this appears on the infowindow
                              infoWindow.setContent(
                                 
                                  '<h4>Asset Details</h4>' +
                                  '<div id="bodyContent">' +
                                
                                  '<h5>Asset Parameters</h5>' +
                                  
                                  '<div id="AID">AssetID: ' + data.AID + '</div >' +
                                  
                                  '<div id="CSId">Current Status: <select id="ddStatus" class="form-control"></select></div >' +        // dropdown changing condition or status can be done here which can be changed by the user on the map itself
                                  '<br/>' +
                                  '<div id="CCId">Current Condition: <select id="ddCondition" class="form-control"></select></div >' +
                                  '<br/>' +
                                  ' <div class="inner" style="display: inline-block; "><button id="S"  class="btn btn-default" onClick="Save(' + data.AID + ');">Save</button></div>' +    // Save button to save the changes on the data base
                                  '</div>' );
                              fillstatus(data.CSId);                // two ajax call back functions to do real time auditing
                              fillcondition(data.CCId);
                              $("body").on("#S", "click", Save);
                              //Save(data.AId, data.CCId, data.CSId);
                          };
                          document.getElementById('AB').onclick = function AB() {        // If the third buttonn is used then it Showing distance from the markers location to the location specified in the autocomplete textboxes of places
                              infoWindow.setContent(
                                  '<div id="content">' +
                                  '<h4>Asset Borrow</h4>' +
                                  '<div id="bodyContent">' +
                                  '<br/>' +
                                  '<div id="AID">AssetID: ' + data.AID + '</div >' +
                                  '<br/>' +
                                  '<span>Recipient:</span>' +
                                  '<br/>' +
                                  '<div><input type="text" id="rec" class="form-control" style="width: 250px" placeholder="Enter Recipient" /></div>' +
                                  '<br/>' +
                                  '<span>Description:</span>' +
                                  '<br/>' +
                                  '<div><input type="text" id="desc" class="form-control" style="width: 250px" placeholder="Enter description and cost details from the screen" /></div>' +
                                  '<br/>' +
                                  '</div>' +
                                  ' <div id="outer" style="width:100%; text-align:center">' +
                                  ' <div class="inner" style="display: inline-block;"><button id="PDFG"  class="btn btn-default" onClick="PDF(' + data.AID + ');">PDF</button></div>' +    // should go to the backend for email and pdf 
                                  ' <div class="inner" style="display: inline-block;"><button id="EMail"  class="btn btn-default" onClick="Email(' + data.AID + ');">Email</button></div>' +    // should go to the backend for email and pdf 
                                  '</div>' +
                                  '</div>');
                              $("body").on("#EMail", "click", Email);
                              $("body").on("#PDFG", "click", PDF);
                          };

                      });
                      google.maps.event.addListener(marker, 'mouseover', function () { // event when mouse hovers over the marker an image appears
                          if (!clicked) {
                              infoWindow.setContent('<IMG BORDER="0" ALIGN="Left" SRC="images/SIconF.jpg">   '); //data.Photo<img src="images/calender.png" />
                              infoWindow.open(map, marker);
                          }
                      });
                      google.maps.event.addListener(marker, 'mouseout', function () {        // when the mouse leaves close that window
                          if (!clicked) {
                              infoWindow.close();
                          }
                      });
                      google.maps.event.addListener(infoWindow, 'closeclick', function () {      // when cross clicked on window then close it
                          clicked = false;
                      })

                  })(marker, data);


              }
          }
          function CostOfAsset() {                // This is the infowindow content which appears when Cost Button is clicked which will show the route which is drawn using the distance matrix api
              var center = new google.maps.LatLng(0, 0);
              var mapOptions = {                // map parameters as center zoom etc
                  center: center,
                  zoom: 8,
                  mapTypeId: google.maps.MapTypeId.ROADMAP
              }; var map = new google.maps.Map(document.getElementById("map"), mapOptions);
              for (i = 0; i < markers.length; i++) {              //  getting the marker lat long to be out on the map
                  var data = markers[i]
                  var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                  directionsDisplay.setMap(map);
                  // directionsDisplay.setPanel(document.getElementById('dvPanel')) ; 
                  // var place = document.getElementById('txtPlaces2');
                  var place = window.HTMLInputElement("#txtPlaces2")
                  var places2 = new google.maps.places.Autocomplete(place);// [$("#txtPlaces2").val()];
                  google.maps.event.addListener(places2, 'place_changed', function () {
                      var place2 = places2.getPlace();
                      var address2 = place2.formatted_address;
                      var latitude2 = place2.geometry.location.lat();
                      var longitude2 = place2.geometry.location.lng();
                      var dest = new google.maps.LatLng(latitude2, longitude2);
                      source = myLatlng;
                      destination = dest;
                      var request = {                                         // request
                          origin: source,
                          destination: destination,
                          travelMode: google.maps.TravelMode.DRIVING
                      };
                      directionsService.route(request, function (response, status) {            // for direction services
                          if (status == google.maps.DirectionsStatus.OK) {
                              directionsDisplay.setDirections(response);
                          }
                      });

                      var service = new google.maps.DistanceMatrixService();
                      service.getDistanceMatrix({                        // distance matrix services api parameters
                          origins: [source],
                          destinations: [destination],
                          travelMode: google.maps.TravelMode.DRIVING,
                          unitSystem: google.maps.UnitSystem.METRIC,
                          avoidHighways: false,
                          avoidTolls: false,
                          drivingOptions: {
                              departureTime: new Date(Date.now()),  // for the time N milliseconds from now.
                              trafficModel: 'optimistic'
                          }
                      }, function (response, status) {                 // what all response needs 
                          if (status == google.maps.DistanceMatrixStatus.OK && response.rows[0].elements[0].status != "ZERO_RESULTS") {
                              var distance = response.rows[0].elements[0].distance.text;
                              var distance1 = response.rows[0].elements[0].distance.value;
                              var duration = response.rows[0].elements[0].duration.text;
                              var time = response.rows[0].elements[0].duration.value;
                              var cost = (time / 3600) * 1000;
                              var cost1 = (distance1 / 1000) * 1000;
                              var dvDistance = document.getElementById("dvDistance");
                              dvDistance.innerHTML = "";
                              dvDistance.innerHTML += "Distance: " + distance + "<br />";
                              dvDistance.innerHTML += "Duration: " + duration + "<br />";
                              dvDistance.innerHTML += "The cost of the asset for making it travel from here to destination for 1000 Rs per km we get cost as with the departure time as of now : " + cost1 + " in rs";

                          } else {
                              alert("Unable to find the distance via road.");
                          }
                      });
                  });
              }
          }
          function Save(a) {                              // these are ajax call back functions for saving the changed data ( in database) on the infowindow which talk through web service
              var cc, cs;
              // a=data.AID;
              cs = $("#ddStatus").val();
              cc = $("#ddCondition").val();
              $.ajax(
                  {
                      url: "/MasterdataWebService.asmx/SaveSC",
                      type: "post",
                      async: false,
                      data: { AID: a, CCId: cc, CSId: cs },
                      success: function (data) {
                          alert("Asset Audited!");
                      },
                      error: function (xhr, msg, ex) {
                          alert('Error Saving data');
                      }
                  }
              );
          }
          function fillstatus(cs) {                     // function for adding the dropdown list talks through web service
              $("#ddStatus").empty();
              $.ajax(
                  {
                      url: "/MasterdataWebService.asmx/getAssetStatus",
                      type: "post",
                      success: function (data) {
                          $('DDItem', data).each(function () {
                              var id = $(this).find('id').text();
                              var value = $(this).find('value').text();
                              $("#ddStatus").append("<option value='" + id + "'>" + value + "</option>");

                          });
                          $("#ddStatus").val(cs);
                      },
                      error: function (xhr, msg, ex) {
                          alert('Error!');
                      }
                  }
              );

          }
          function fillcondition(cc) {
              $("#ddCondition").empty();
              $.ajax(
                  {
                      url: "/MasterdataWebService.asmx/getAssetCondition",
                      type: "post",
                      success: function (data) {
                          $('DDItem', data).each(function () {
                              var id = $(this).find('id').text();
                              var value = $(this).find('value').text();
                              $("#ddCondition").append("<option value='" + id + "'>" + value + "</option>");
                          });
                          $("#ddCondition").val(cc);
                      },
                      error: function (xhr, msg, ex) {
                          alert('Error!');
                      }
                  }
              );

          }
          function Email(ab) {
              var recip, descrp;
              if ($.trim($('#rec').val()) == '') {
                  alert('Recipient can not be left blank Refresh and fill again');
              }
              else { recip = $("#rec").val(); }
              if ($.trim($('#desc').val()) == '') {
                  descrp = "No Costing or other details";
              }
              else { descrp = $("#desc").val(); }
              $.ajax({
                  url: "/MasterdataWebService.asmx/Mailing",
                  type: "post",
                  async: false,
                  data: { a: ab, reci: recip, descr: descrp },
                  success: function (data) {
                      alert("Email sent to the recipient with the details of asset");
                  },
                  error: function (xhr, msg, ex) {
                      alert('Could not send mail due to server error!');
                  }
              }
              );
          }
          function PDF(a) {
              var descr;
              if ($.trim($('#desc').val()) == '') {
                  descrp = "No Costng or other details";
              }
              else { descrp = $("#desc").val(); }
              $.ajax({
                  url: "/MasterdataWebService.asmx/PDF",
                  type: "post",
                  async: false,
                  data: { ab: a, descr: descrp },
                  success: function (data) {
                      alert("PDF generated sucessfully");
                  },
                  error: function (xhr, msg, ex) {
                      alert('Could not create a report due to server error!');
                  }
              }
              );
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

