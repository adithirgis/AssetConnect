<%@ Page Language="C#" MasterPageFile="~/HomeMaster.master"  AutoEventWireup="true" CodeFile="check2.aspx.cs" Inherits="check2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderM" Runat="Server">
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
</style>     <%--  Styling for loader and legend--%>
    <script async 
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDbhJ8gUD4kWmTcdSolp-30sa7twS8U5ZA&libraries=places&sensor=false">
     </script>        <%-- Map API for bringing map on the screen--%>
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
    
      <div class="loader"></div>       <%-- Loader div--%>
    <div id="DDmap" style="float:left; height: 200px; width: 300px">    <%--filtering div--%>
     <div id="side" style=" background-color: white;
    font-size: 18px;
    text-align: center; padding: 50px 20px 50px 20px;" class="auto-style3">
      <%--    Dropdown list for filtering data based on Condition or status of asset --%>
       <asp:DropDownList ID="DDSearch" runat="server" placeholder="Select By" text-align="center"  class="form-control"  Height="30px" style="float:right;"  Width="50%" margin="2px" AutoPostBack="True" OnSelectedIndexChanged="DDSearch_SelectedIndexChanged">
                         <asp:ListItem Selected="True" Value="0" Text="Select By"></asp:ListItem>
                         <asp:ListItem  Text="Locate" Value="1"></asp:ListItem>
                         <asp:ListItem  Text="Buffer" Value="2"></asp:ListItem>
                                                                   </asp:DropDownList>
                                   <br />  <br />
               <br />  <br />
                            <asp:Panel ID="Search" runat="server" Visible="False" Height="371px" Width="326px">
                  <label for ="Search" style="float:right">
                                
                     <asp:DropDownList ID="DDCondition" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDCondition_SelectedIndexChanged">
    </asp:DropDownList>
                      <br /><br />
    <asp:DropDownList ID="DDStatus" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDStatus_SelectedIndexChanged">
    </asp:DropDownList>
                      <br /><br />
                        <asp:DropDownList ID="DDGroup" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDGroup_SelectedIndexChanged">
    </asp:DropDownList>
                  </label>
              
              </asp:Panel>
          </div>
   </div>
    <div id="map" style="width: 1000px; height:500px; float: right">          <%--   map div with legend--%>
  </div>
     <div id="Legend" style="height: 200px; width: 300px; float:right"><h4>Legend</h4></div>
    <div id="dvDistance" style="height:100px; width:450px">
        </div>
    <%--//242 576 421 user name password r538zm--%>
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
                         break;}
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
                                 '<div id="content">' +
                                 '<h4>Asset Details</h4>' +
                                 '<div id="bodyContent">' +
                                 '<h5>Asset Information</h5>' +
                                 '<br/>' +
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
                                 '</div>' +
                                 '</div>');
                         };
                         document.getElementById('AP').onclick = function AP() {                // this is for real time auditing of the data Current Condition and Status if the user presses Parameters then this appears on the infowindow
                             infoWindow.setContent(
                                 '<div id="content">' +
                                 '<h4>Asset Details</h4>' +
                                 '<div id="bodyContent">' +
                                 '<br/>' +
                                 '<h5>Asset Parameters</h5>' +
                                 '<br/>' +
                                 '<div id="AID">AssetID: ' + data.AID + '</div >' +
                                 '<br/>' +
                                 '<div id="CSId">Current Status: <select id="ddStatus"></select></div >' +        // dropdown changing condition or status can be done here which can be changed by the user on the map itself
                                 '<br/>' +
                                 '<div id="CCId">Current Condition: <select id="ddCondition"></select></div >' +
                                 ' <div class="inner" style="display: inline-block;"><button id="S"  class="btn btn-default" onClick="Save(' + data.AID + ');">Save</button></div>' +    // Save button to save the changes on the data base
                                 '</div>' +
                                 '</div>');
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
                                '<span>Description:</span>' +
                                     '<br/>' +
                                 '<div><input type="text" id="rec" style="width: 250px" placeholder="Enter Recipient" /></div>' +
                                 '<br/>' +
                                 '<div><input type="text" id="desc" style="width: 250px" placeholder="Enter description and cost details from the screen" /></div>' +
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
             };    var map = new google.maps.Map(document.getElementById("map"), mapOptions); 
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
                         alert("Data updated");
                     },
                     error: function (xhr, msg, ex) {
                         alert('Error calling Save Status and condition');
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
                         alert('Error calling getAssetStatus');
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
                         alert('Error calling getAssetCondition');
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
                 descrp ="No Costing or other details";
             }
             else { descrp = $("#desc").val();}
                         $.ajax(                   {
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
                 data: {ab:a, descr: descrp },
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
   </asp:Content>      
           