<%@ Page Language="C#"  MasterPageFile="~/HomeMaster.master" AutoEventWireup="true" CodeFile="check3.aspx.cs" Inherits="check3" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderM" Runat="Server">
     <style>
    #Legend {
        font-family: Arial, sans-serif;
        background: #fff;
        padding: 10px;
        margin: 10px;
        border: 3px solid #000;
      }
      #Legend h4 {
        margin-top: 0;
      }
      #Legend img {
        vertical-align: middle;
      }
</style>

     
  <%--  <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>--%>
      <%--<ajaxToolkit:ToolkitScriptManager ID="TScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>--%>

  <div id="side">
      <asp:TextBox ID="txtPointA1" runat="server" ClientIDMode="Static" Enabled="false"
                 Width="170px"></asp:TextBox>
<asp:TextBox ID="txtPointA2" runat="server" ClientIDMode="Static" Enabled="false"
                 Width="170px"></asp:TextBox> 
       

         <asp:TextBox ID="txtPointB1" runat="server" 
             onchange="drawCircle();" ClientIDMode="Static"></asp:TextBox>
   <ajaxToolkit:SliderExtender ID="sliderRadius" runat="server" BehaviorID="sliderRadius"   TargetControlID="txtPointB1" Minimum="200" Maximum="2000" 
                            BoundControlID="txtRadiusShow"
                            EnableHandleAnimation="true" EnableKeyboard="false"></ajaxToolkit:SliderExtender>                      
<asp:TextBox ID="txtRadiusShow" runat="server" MaxLength="4" CssClass="setmargin"
               ClientIDMode="Static"></asp:TextBox> <span style="font-size: 9pt;"> </span>
        </div>
     <div id="map" style="height: 350px; width: 700px; float:left">
        
    </div> 
      <div id="Legend" style="height: 200px; width: 300px; float:right"><h4>Legend</h4></div>
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
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
</script>   <%--async downloads the file during HTML parsing and will pause the HTML parser to execute it when it has finished downloading.
         defer downloads the file during HTML parsing and will only execute it after the parser has completed. --%>
     <script src="bootstrap-3.3.7-dist/jquery-3.2.1%20(1).js"></script>
    <script src="bootstrap-3.3.7-dist/jquery-3.2.1%20(2).js"></script>

    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBh2lM7YWg-0ywHxXAbMgJhLlEQmeX8yww&libraries=geometry&callback=loadMap"><%--callback=loadMap//sensor=false--%>
    </script>  
     <script type="text/javascript" >

         $(window).load(function () {
             loadMap();
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
            } else alert("not able to append");
            var div = document.createElement('div');
            div.innerHTML = '<span><img src="images/Google Maps Markers/red_markerC.png">Create Buffer</span>';
            if (legend !== null) {
                legend.appendChild(div);
            } else alert("not able to append");

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
   
   </asp:Content>
