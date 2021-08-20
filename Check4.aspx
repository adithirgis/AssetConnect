<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Check4.aspx.cs" Inherits="Check4" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
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
      .container{
  height:500px;
  width:100%;
  position: relative;
}

.buttons{
  position:absolute;
  top:4px;
  right: 8px;
  z-index:100;
}

.btn{
  display:inline-block;
  padding: 4px 8px;
  background-color:#ccc;
  border-radius:2px;
  float:left;
  border:1px solid #999;
  font-size:16px;
  cursor:pointer;
}

.btn:hover{
  background-color:#999;
  transition: 250ms;
}

#map{
  height:100%;
  width:100%;
}

/* This is where you plug in the CSS for marker animations */
#markerLayer img {
  animation: pulse .5s infinite alternate;
    -webkit-animation: pulse .5s infinite alternate;
    transform-origin: center;
    -webkit-transform-origin: center;
}



keyframes pulse{
    to { 
        transform: scale(0.7);
        -webkit-transform: scale(0.7);  
    }
}

@-webkit-keyframes pulse{
    to { 
        transform: scale(0.7);
        -webkit-transform: scale(0.7);  
    }
}

@-webkit-keyframes wobble {
  from {
    -webkit-transform: none;
    transform: none;
  }

  15% {
    -webkit-transform: translate3d(-25%, 0, 0) rotate3d(0, 0, 1, -5deg);
    transform: translate3d(-25%, 0, 0) rotate3d(0, 0, 1, -5deg);
  }

  30% {
    -webkit-transform: translate3d(20%, 0, 0) rotate3d(0, 0, 1, 3deg);
    transform: translate3d(20%, 0, 0) rotate3d(0, 0, 1, 3deg);
  }

  45% {
    -webkit-transform: translate3d(-15%, 0, 0) rotate3d(0, 0, 1, -3deg);
    transform: translate3d(-15%, 0, 0) rotate3d(0, 0, 1, -3deg);
  }

  60% {
    -webkit-transform: translate3d(10%, 0, 0) rotate3d(0, 0, 1, 2deg);
    transform: translate3d(10%, 0, 0) rotate3d(0, 0, 1, 2deg);
  }

  75% {
    -webkit-transform: translate3d(-5%, 0, 0) rotate3d(0, 0, 1, -1deg);
    transform: translate3d(-5%, 0, 0) rotate3d(0, 0, 1, -1deg);
  }

  to {
    -webkit-transform: none;
    transform: none;
  }
}

@keyframes wobble {
  from {
    -webkit-transform: none;
    transform: none;
  }

  15% {
    -webkit-transform: translate3d(-25%, 0, 0) rotate3d(0, 0, 1, -5deg);
    transform: translate3d(-25%, 0, 0) rotate3d(0, 0, 1, -5deg);
  }

  30% {
    -webkit-transform: translate3d(20%, 0, 0) rotate3d(0, 0, 1, 3deg);
    transform: translate3d(20%, 0, 0) rotate3d(0, 0, 1, 3deg);
  }

  45% {
    -webkit-transform: translate3d(-15%, 0, 0) rotate3d(0, 0, 1, -3deg);
    transform: translate3d(-15%, 0, 0) rotate3d(0, 0, 1, -3deg);
  }

  60% {
    -webkit-transform: translate3d(10%, 0, 0) rotate3d(0, 0, 1, 2deg);
    transform: translate3d(10%, 0, 0) rotate3d(0, 0, 1, 2deg);
  }

  75% {
    -webkit-transform: translate3d(-5%, 0, 0) rotate3d(0, 0, 1, -1deg);
    transform: translate3d(-5%, 0, 0) rotate3d(0, 0, 1, -1deg);
  }

  to {
    -webkit-transform: none;
    transform: none;
  }
}

@-webkit-keyframes flicker {
  from, 50%, to {
    opacity: 1;
  }

  25%, 75% {
    opacity: 0;
  }
}

@keyframes flicker {
  from, 50%, to {
    opacity: 1;
  }

  25%, 75% {
    opacity: 0;
  }
}
      #markerLayer img {
  animation: pulse .5s infinite alternate;
  -webkit-animation: pulse .5s infinite alternate;
  transform-origin: center;
  -webkit-transform-origin: center;
}
</style>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="Scripts/jquery-1.4.4.min.js"></script>
<script src="Scripts/jquery.validate.js"></script>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="loader"></div>
     <div id="map" style="height: 350px; width: 700px; float:left">
        </div> 
      <div id="Legend" style="height: 200px; width: 300px; float:right"><h4>Legend</h4></div>
        </div>
          <div id="DDmap" style="float:left; height: 200px; width: 300px">
     <div id="side" style=" background-color: white;
    font-size: 18px;
    text-align: center; padding: 50px 20px 50px 20px;" class="auto-style3">
          
    <%--   <asp:DropDownList ID="DDSearch" runat="server" placeholder="Select By" text-align="center"  class="form-control"  Height="30px" style="float:right;"  Width="50%" margin="2px" AutoPostBack="True">
                         <asp:ListItem Selected="True" Value="0" Text="Select Past or Future trips"></asp:ListItem>
                         <asp:ListItem  Text="Past Locations" Value="1"></asp:ListItem>
                         <asp:ListItem  Text="Future Locations" Value="2"></asp:ListItem>
                                           </asp:DropDownList>--%>
                                   <br />  <br />
                 <label for ="Search" style="float:right"> </label>
                 
                      <br /><br />
    <asp:DropDownList ID="DDAsset" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDAsset_SelectedIndexChanged">
      
    </asp:DropDownList>
         <div class='container'>
  <%--<div class='buttons'>
   <div class='btn' data-anim='flicker'>Past Locations </div>
    <div class='btn' data-anim='flicker'>Future Locations </div>
  </div>--%>
                      <button type="submit" runat="server" id="btnP" class="default" onserverclick="btnPClick">Past Locations</button>
                     
                     <br />
                     <br />
                      <button type="submit" runat="server" id="btnF" class="default" onserverclick="btnFClick">Future Locations</button>
         
                           </div>
  </div>
    </form>
        <script type="text/javascript">
       var markers = [
           <asp:Repeater ID="rptMarkers" runat="server">
               <ItemTemplate>
                   {
                       "AId": '<%# Eval("AId") %>',   
                   "HId": '<%# Eval("HId") %>',
                   "AHId": '<%# Eval("AHId") %>',  
                    "lat": '<%# Eval("lat") %>',        
            "lng": '<%# Eval("lng") %>',          
                   "Name": '<%# Eval("Name") %>', 
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
                 "Camera": '<%# Eval("Cam") %>',      
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
</script>   <%--async downloads the file during HTML parsing and will pause the HTML parser to execute it when it has finished downloading.
         defer downloads the file during HTML parsing and will only execute it after the parser has completed. --%>
     <script src="bootstrap-3.3.7-dist/jquery-3.2.1%20(1).js"></script>
    <script src="bootstrap-3.3.7-dist/jquery-3.2.1%20(2).js"></script>
  
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBh2lM7YWg-0ywHxXAbMgJhLlEQmeX8yww&libraries=geometry&callback=loadMap"><%--callback=loadMap//sensor=false--%>
    </script>  
     <script type="text/javascript" >
         $(window).on('beforeunload', function () { $(".loader").show(); });
         $(window).on('load', function () {
                          $(".loader").hide();
          //   loadMap();
         });
      
    </script> 
    <script>
        var map;
        
        function loadMap() {
            var center = new google.maps.LatLng(0, 0);
            if (markers.length > 0)
            { center = new google.maps.LatLng(markers[0].lat, markers[0].lng); }
            //else {
            //    alert("No such asset available");
            //}
            var infoWindow = new google.maps.InfoWindow();
            //currentlatlng = new google.maps.LatLng(18.480748, 73.869152);
            map = new google.maps.Map(document.getElementById('map'), {
                zoom: 16,
                center: center,
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
                        switch (data.HId) {
                            case "0":
                                icon = "images/Google%20Maps%20Markers/blue_MarkerH.png";
                                break;
                            case "1":
                                icon = "images/Google%20Maps%20Markers/blue_MarkerH.png" ;
                                break;
                            case "2":
                                icon = "images/red-dot.png";
                                break;
                        }
                        break;
                    case "3":
                        icon = "images/yellow-dot.png";
                        switch (data.HId) {
                            case "1":
                                icon = "images/Google%20Maps%20Markers/blue_MarkerH.png";
                                break;
                            case "0":
                                icon = "images/Google%20Maps%20Markers/blue_MarkerH.png";
                                break;
                            case "2":
                                icon = "images/yellow-dot.png";
                                break;
                        }
                        break;
                    case "2":
                        icon = "images/green-dot.png";
                        switch (data.HId) {
                            case "1":
                                icon = "images/Google%20Maps%20Markers/blue_MarkerH.png";
                                break;
                            case "0":
                                icon = "images/Google%20Maps%20Markers/blue_MarkerH.png";
                                break;
                            case "2":
                                icon = "images/green-dot.png";
                                break;
                        }
                        break;
                }
                //var myIcon = {
                //    url: icon,
                //    size: new google.maps.Size(100, 60),
                //    scaledSize: new google.maps.Size(70, 60),
                //    origin: new google.maps.Point(-15, 0)
                //}
                var marker = new google.maps.Marker({                  // object literal called marker image can be coustomised by setIcon() method, also has draggable property(true)
                    position: myLatlng,                                //taking the global variable position of marker inherent property or attribute
                    map: map,                                        // another field on where to put marker that map s id
                    title: "Assets",
                    optimized: false,
                    size: new google.maps.Size(100, 60),
                    scaledSize: new google.maps.Size(70, 60),
                    origin: new google.maps.Point(-15, 0),
                    icon: new google.maps.MarkerImage(icon)
                });
                var contentString = '<div id="content">' +
                    '<h4>Asset Details</h4>' +
                    '<div id="bodyContent">' +
                    '<h5>Asset Information</h5>' +
                        '<div id="AID">AssetID: ' + data.AId + '</div >' +
                    '<div id="AssetName">Asset Name: ' + data.Name + '</div >' +
                    '<div id="AGrpId">Asset Group: ' + data.Agrp + '</div >' +
                                      '<div id="MnfId">Manufacturer of Asset: ' + data.Mnf + '</div >' +
                    '<div id="SPId">Service Provider of Asset: ' + data.SP + '</div >' +
                    '<div id="FId">Frequency of Warranty/Quaranty/PMC/AMC: ' + data.Fre + '</div >' +
                    '<div id="TId">Tag type on Asset: ' + data.TT + '</div >' +
                    '<div id="MId">Model of Asset: </div>' + data.Mnf + '</div >' +
                    '<div id="description">Any other details: ' + data.des + '</div >' +
                    '</div>' +
                    '</div>';
                var infoWindow = new google.maps.InfoWindow({ content: contentString });
                (function (marker, data) {                            // another anonymous ftn with parameter as collection data and object marker
                    google.maps.event.addListener(marker, "click", function (e) {   // on click event what should it do marker object can listen to click, dblclick etc, addListener event handler: to register for event notifications
                        infoWindow.setContent(contentString);                 // show id of the asset content of window 
                        infoWindow.open(map, marker);                      // open on clicking marker
                    });
                })(marker, data);         // parameters of function
                var myoverlay = new google.maps.OverlayView();
                myoverlay.draw = function () {
                    // add an id to the layer that includes all the markers so you can use it in CSS
                    this.getPanes().markerLayer.id = 'markerLayer';
                };
                myoverlay.setMap(map);

            }
            $('.btn').click(function () {
                var type = $(this).data('anim');
                $('#markerLayer img').css('animation', type + ' 1s infinite alternate');
                $('#markerLayer img').css('-webkit-animation', type + ' 1s infinite alternate')
            })
            //}
            var legend = document.getElementById('Legend');
            div = document.createElement('div');
            div.innerHTML = '<span><img src="images/red-dot.png">Asset Working and present Location</span>';
            if (legend !== null) {
                legend.appendChild(div);
            } else console.log("not able to append");
            var div = document.createElement('div');
            div.innerHTML = '<span><img src="images/green-dot.png">Asset Not Working and present Location</span>';
            if (legend !== null) {
                legend.appendChild(div);
            } else alert("not able to append");
            var div = document.createElement('div');
            div.innerHTML = '<span><img src="images/yellow-dot.png">Asset Under Maintenance and present Location</span>';
            if (legend !== null) {
                legend.appendChild(div);
            } else alert("not able to append");
            var div = document.createElement('div');
            div.innerHTML = '<span><img src="images/Google%20Maps%20Markers/blue_MarkerH.png">Past or Future Locations of the asset</span>';
            if (legend !== null) {
                legend.appendChild(div);
            } else alert("not able to append");
                      map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(legend);
            google.maps.event.addDomListener(map, 'click', function (e) {
      currentlatlng = e.latLng;                                         //8830137945 Nikhil Sir 9975769976 Balaji Sir 7588947976 Sneha D
    if (currentlatlng) {
    map.panTo(currentlatlng);
     }
            });
        }
    </script>
    
</body>
</html>
  <%-- var regexAlphabets = /^[a-zA-Z ]*$/;
         var Validator; function Validations() {
             $.validator.addMethod(
                 "notEqualTo",
                 function (elementValue, element, param) {
                     return elementValue != param;
                 },
                 "Value cannot be {0}"
             );
             Validator = $("#form1").validate({
                 errorClass: 'my-error-class', rules: {
                     txtType: { required: true, regex: regexAlphabets },
                     ddlDepartment: { required: true, notEqualTo: 0 }
                 },
                 messages: {
                     txtType: { required: "Please enter IBT Service Types", regex: "Please enter IBT Service Types in Alphabets" },
                     ddlDepartment: "Please Select Department Name"
   //   C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\AssetTagging_log.ldf
                 }
             });
         }--%>