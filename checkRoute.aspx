<%@ Page Language="C#" AutoEventWireup="true" CodeFile="checkRoute.aspx.cs" Inherits="checkRoute" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    

    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDbhJ8gUD4kWmTcdSolp-30sa7twS8U5ZA&libraries=places"></script>
    <script type="text/javascript">
       
            
            var source, destination;
            var directionsDisplay;
            var directionsService = new google.maps.DirectionsService();
            directionsDisplay = new google.maps.DirectionsRenderer({});//'draggable': true
            google.maps.event.addDomListener(window, 'load', function () {
                var places1 = new google.maps.places.Autocomplete(document.getElementById('txtPlaces1'));
                google.maps.event.addListener(places1, 'place_changed', function () {
                    var place1 = places1.getPlace();
                    var address1 = place1.formatted_address;
                    var latitude1 = place1.geometry.location.lat();
                    var longitude1 = place1.geometry.location.lng();

                });
                var places2 = new google.maps.places.Autocomplete(document.getElementById('txtPlaces2'));
                google.maps.event.addListener(places2, 'place_changed', function () {
                    var place2 = places2.getPlace();
                    var address2 = place2.formatted_address;
                    var latitude2 = place2.geometry.location.lat();
                    var longitude2 = place2.geometry.location.lng();
                });
                new google.maps.places.SearchBox(document.getElementById('txtPlaces1'));
                new google.maps.places.SearchBox(document.getElementById('txtPlaces2'));
                directionsDisplay = new google.maps.DirectionsRenderer({});//'draggable': true
            });

            function GetRoute() {
                var mumbai = new google.maps.LatLng(18.9750, 72.8258);
               
                var mapOptions = {
                    zoom: 7,
                    center: mumbai
                };
                map = new google.maps.Map(document.getElementById('dvMap'), mapOptions);
                directionsDisplay.setMap(map);
               // directionsDisplay.setPanel(document.getElementById('dvPanel')) ; 
                
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
                        var cost1 =(distance1/1000) * 1000;
                        var dvDistance = document.getElementById("dvDistance");
                        dvDistance.innerHTML = "";
                        dvDistance.innerHTML += "Distance: " + distance + "<br />";
                        dvDistance.innerHTML += "Duration: " + duration + "<br />";
                        dvDistance.innerHTML += "The cost of the asset for making it travel from here to destination for 1000 Rs per km we get cost as with the departure time as of now : " + cost1+" in rs";

                    } else {
                        alert("Unable to find the distance via road.");
                    }
                });
            }
       
    </script>
        <table border="0" >
<tr>
    <td colspan="2">
        <span>Start:</span>
    <input type="text" id="txtPlaces1" style="width: 250px" placeholder="Enter a location" />
 <span>Finish:</span>
    <input type="text" id="txtPlaces2" style="width: 250px" placeholder="Enter a location" />
        <br />
        <input type="button" value="Get Route" onclick="GetRoute()" />
        <hr />
    </td>
</tr>
<tr>
    <td colspan="2">
        <div id="dvDistance" style="height:100px; width:450px">
        </div>
    </td>
</tr>
<tr>
    <td>
        <div id="dvMap" style="width: 500px; height: 500px">
        </div>
    </td>
    <td>
        <div id="dvPanel" style="width: 500px; height: 500px">
        </div>
    </td>
</tr>
</table>
   
    </div>
    </form>
</body>
</html>
