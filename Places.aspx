<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Places.aspx.cs" Inherits="Places" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
     <script async 
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDbhJ8gUD4kWmTcdSolp-30sa7twS8U5ZA&libraries=places&sensor=false">
     </script>
    <%-- The sensor parameter is no longer required for the Google Maps JavaScript API. It won't prevent the Google Maps JavaScript API from working correctly, but we recommend that you remove the sensor parameter from the script element.
  --%>  </script>
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
<body>
    <form id="form1" runat="server">
    <div>
        <div id="DDmap" style="float:left; height: 200px">
     <div id="side" style=" background-color: white;
    font-size: 18px;
    text-align: center; padding: 50px 20px 50px 20px;" class="auto-style3">
     </div>                  
</div>
       <div id="dvDistance" style="height:100px; width:450px">
        </div>
        <div id="map" style="width: 700px; height:350px; float: right"></div>
    <script type="text/javascript">                   
        var source, destination;
        var directionsDisplay;
        
        window.onload = function initMap() {
            var mapOptions = {
                center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
                zoom: 16,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                navigationControl: true
            };
            var infoWindow = new google.maps.InfoWindow/*()*/;
            var directionsService = new google.maps.DirectionsService();
            var map = new google.maps.Map(document.getElementById("map"), mapOptions);
            for (i = 0; i < markers.length; i++) {
                var data = markers[i]
                var myLatlng = new google.maps.LatLng(data.lat, data.lng);
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
                    default:
                        icon = "images/Google Maps Markers/red_markerC.png";
                }
                var marker = new google.maps.Marker({
                    position: myLatlng,
                    map: map,
                    draggable: true,
                    title: data.title,
                    icon: new google.maps.MarkerImage(icon)
                });

                var contentString = '<div id="content">' +
                    '<h4>Asset Details</h4>' +
                    '<div id="bodyContent">' +
                    '<span>Finish:</span>' +
                    '<div><input type="text" id="txtPlaces2" style="width: 250px"  type="hidden" placeholder="Enter destination" /></div>' +
                    '</div>' +
                    ' <div id="outer" style="width:100%; text-align:center">' +
                    ' <div class="inner" style="display: inline-block;"><button id="CostingA" class="btn btn-default" onClick="CostingAs();">Borrow</button></div>' +
                    '</div>' +
                    '</div>';
                var infoWindow = new google.maps.InfoWindow({ content: contentString });
                var places2 = new google.maps.places.Autocomplete(document.getElementById('txtPlaces2'));
                google.maps.event.addListener(places2, 'place_changed', function () {
                    var place2 = places2.getPlace();
                    var address2 = place2.formatted_address;
                    var latitude2 = place2.geometry.location.lat();
                    var longitude2 = place2.geometry.location.lng();
                    var dest = new google.maps.LatLng(latitude2, longitude2);
                });
                new google.maps.places.SearchBox(document.getElementById('txtPlaces2'));
                directionsDisplay = new google.maps.DirectionsRenderer({});
                source = myLatlng;
                destination = dest;
                (function (marker, data) {
                    google.maps.event.addListener(marker, "click", function (e) {
                        infoWindow.setContent(contentString);         //    data.Name
                        infoWindow.open(map, marker);
                        document.getElementById('CostingA').onclick = function CostingAs() {
                            infoWindow.setContent(
                                '<div id="content">' +
                                '<h4>Asset Borrow</h4>' +
                                '<div id="bodyContent">' +
                                '<br/>' +
                                '<div id="AID">AssetID: ' + data.Name + '</div >' +
                               '</div>' +
                                '</div>');
                            directionsDisplay = new google.maps.DirectionsRenderer({});
                            directionsDisplay.setMap(map);
                            source = myLatlng;
                            destination =dest;
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
                        };
                    });
                })(marker, data);
            }
        }
       function GetRoute() {
             var mapOptions = {
                zoom: 7,
                center: mumbai
            };
            map = new google.maps.Map(document.getElementById('dvMap'), mapOptions);
            directionsDisplay.setMap(map);
            source = document.getElementById("txtPlaces1").value;
            destination = document.getElementById("txtPlaces2").value;
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
        }
       
</script>
    </div>
    </form>
</body>
</html>
