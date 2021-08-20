<%@ Page Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="LocateYourAsset.aspx.cs" Inherits="LocateYourAsset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
       #map {
        height: 400px;
        width: 100%;
        background-color: grey;
       }
    </style>
   
         <h2 style="text-align:center;">Locate Your Asset</h2>
   
    <div id="map"  style="padding:  15px;"> 
    
          <div id="side" style=" width: 20%;
    height: 200px;
    background-color: white;
    font-size: 18px;
    text-align: center; padding: 50px 20px 50px 20px;">
              <%----%>
                    <asp:DropDownList ID="DDSearch" runat="server" placeholder="Select By" text-align="center"  class="form-control"  Height="30px" style="float:right;"  Width="50%" margin="2px" AutoPostBack="True" OnSelectedIndexChanged="DDSearch_SelectedIndexChanged">
                          <asp:ListItem Selected="True" Value="0" Text="Select By"></asp:ListItem>
                         <asp:ListItem  Text="City" Value="1"></asp:ListItem>
                         <asp:ListItem  Text="Condition" Value="2"></asp:ListItem>
                         <asp:ListItem Text="Status" Value="3"></asp:ListItem>
                         <asp:ListItem  Text="Buffer" Value="4"></asp:ListItem>
                         <asp:ListItem  Text="Asset Groups" Value="5"></asp:ListItem>
                         <asp:ListItem Text="Location" Value="6"></asp:ListItem>
                                           </asp:DropDownList>
                                   <br />  <br />
               <br />  <br />
                            <asp:Panel ID="Search" runat="server" Visible="False">
                  <label for ="Search" style="float:left">
                      <asp:DropDownList ID="DDS" runat="server" AutoPostBack="True"></asp:DropDownList></label>
               <br /><br />
              </asp:Panel>
          </div>
    </div>
    <%--
<head>
<title>Show/Add multiple markers to Google Maps from database in asp.net website</title>
<style type="text/css">
html { height: 100% }
body { height: 100%; margin: 0; padding: 0 }
#map_canvas { height: 100% }
</style>
<script type="text/javascript" src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyC6v5-2uaq_wusHDktM9ILcqIrlPtnZgEk&sensor=false">
</script>
<script type="text/javascript">
function initialize() {
var markers = JSON.parse('<%=ConvertDataTabletoString() %>');
var mapOptions = {
center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
zoom: 5,
mapTypeId: google.maps.MapTypeId.ROADMAP
//  marker:true
};
var infoWindow = new google.maps.InfoWindow();
var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
for (i = 0; i < markers.length; i++) {
var data = markers[i]
var myLatlng = new google.maps.LatLng(data.lat, data.lng);
var marker = new google.maps.Marker({
position: myLatlng,
map: map,
title: data.title
});
(function(marker, data) {

// Attaching a click event to the current marker
google.maps.event.addListener(marker, "click", function(e) {
infoWindow.setContent(data.description);
infoWindow.open(map, marker);
});
})(marker, data);
}
}
</script>
</head>
<body onload="initialize()">
<form id="form1" runat="server">
<div id="map_canvas" style="width: 500px; height: 400px"></div>
</form>
</body>
</html>--%>

    <script>
      function initMap() {
          var Pune = { lat: 18.516726, lng: 73.856255};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
          center: Pune
        });
        var marker = new google.maps.Marker({
          position: Pune,
          map: map
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDbhJ8gUD4kWmTcdSolp-30sa7twS8U5ZA&callback=initMap">
    </script>
 </asp:Content>
