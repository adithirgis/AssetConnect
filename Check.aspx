<%@ Page Language="C#" MasterPageFile="~/HomeMaster.master" AutoEventWireup="true" CodeFile="Check.aspx.cs" Inherits="Check" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderM" Runat="Server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>
 <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDbhJ8gUD4kWmTcdSolp-30sa7twS8U5ZA&sensor=false">
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
<script type="text/javascript">                    //all most all are constructors which are initialised  // up to display repeated list of items that are bound to the control can be to a DB a data bind control part of gridview that displays when not editing or inserting render the cell for each row
   <%-- var markers = JSON.parse('<%=ConvertDataTabletoString() %>');--%>
    window.onload = function initMap() {                                //anonymous function on load event when entire pageloads including images etc
        var mapOptions = {              //MapOptions with defined properties of zoom center                 //an object
            center: new google.maps.LatLng(markers[0].lat, markers[0].lng),  //google.maps predefined methods with two parameters
            zoom: 16,                                                     //properties or attributes
            mapTypeId: google.maps.MapTypeId.ROADMAP ,      //    MapTypeId (string) different types this will be a street map    
            navigationControl: true
        };
        var infoWindow = new google.maps.InfoWindow/*()*/;                   //another variable or method Infowindow for content
     
        var map = new google.maps.Map(document.getElementById("map"), mapOptions);   //object map showing on screen with two parameters mapOptions already defined as center zoom etc like initmap
        for (i = 0; i < markers.length; i++) {                                   //loop for multiple markers
            var data = markers[i]                                               //data collection with key and associated value
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
                default:
                    icon = "images/Google Maps Markers/red_markerC.png";
            }
            var marker = new google.maps.Marker({                  // object literal called marker image can be coustomised by setIcon() method, also has draggable property(true)
                position: myLatlng,                                //taking the global variable position of marker inherent property or attribute
                map: map,                                        // another field on where to put marker that map s id
                draggable: true,
                title: data.title,
                icon: new google.maps.MarkerImage(icon)
            });
          (function (marker, data) {                            // another anonymous ftn with parameter as collection data and object marker
                google.maps.event.addListener(marker, "click", function (e) {   // on click event what should it do marker object can listen to click, dblclick etc, addListener event handler: to register for event notifications
                    infoWindow.setContent(data.Name);                    // show id of the asset content of window 
                    infoWindow.open(map, marker);                      // open on clicking marker
                                   });
            })(marker, data);         // parameters of function
        }
    }
</script>
<div id="DDmap" style="float:left; height: 200px">
     <div id="side" style=" background-color: white;
    font-size: 18px;
    text-align: center; padding: 50px 20px 50px 20px;" class="auto-style3">
                         <asp:DropDownList ID="DDSearch" runat="server" placeholder="Select By" text-align="center"  class="form-control"  Height="30px" style="float:right;"  Width="50%" margin="2px" AutoPostBack="True" OnSelectedIndexChanged="DDSearch_SelectedIndexChanged">
                         <asp:ListItem Selected="True" Value="0" Text="Select By"></asp:ListItem>
                        
                         <asp:ListItem  Text="Buffer" Value="1"></asp:ListItem>
                    
                                           </asp:DropDownList>
                                   <br />  <br />
               <br />  <br />
                            <asp:Panel ID="Search" runat="server" Visible="False">
                  <label for ="Search" style="float:right">
                                
                      <asp:DropDownList ID="DDS" runat="server" AutoPostBack="True" Height="41px" Width="136px" OnSelectedIndexChanged="DDS_SelectedIndexChanged"></asp:DropDownList></label>
               <br /><br />
              </asp:Panel>
          </div>
    <asp:Panel ID="BArea" runat="server" Visible="False">
         <label for ="ER" style="float:left;">Enter Radius</label>  <asp:TextBox ID="Radius" runat="server" placeholder="Enter Radius" text-align="center"  class="form-control"  Height="30px" style="float:right;"  Width="50%" margin="2px"></asp:TextBox>
        <br /><br />
       
    </asp:Panel>
  
</div>

<div id="map" style="width: 700px; height:350px; float: right">
 
</div>
   
  </asp:Content>
 