<%@ Page Language="C#" MasterPageFile="~/SiteMaster.master" AutoEventWireup="true" CodeFile="MenuBar.aspx.cs" Inherits="MenuBar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <ul>
            <li class="dropdown">
                <a href="javascript.void(0)" class="dropbtn">Masters</a>
                <div class="dropdown-content">
                    <a href="AssetGroupsMasters.aspx"> Asset Groups Masters</a>
                    <a href="AssetLeasedToMasters.aspx"> Asset Leased To Masters</a>
                    <a href="AssetLeasedOrPurchasedMasters.aspx"> Asset Leased Or Purchased Masters</a>
                    <a href="AssetManufacturerMasters.aspx">Asset Manufacturer Masters</a>
                    <a href="AssetOwnershipMasters.aspx"> Asset Ownership Masters</a>
                    <a href="AssetPriorityMasters.aspx"> Asset Priority Masters</a>
                    <a href="AssetServiceProviderMasters.aspx"> Asset Service Provider Masters</a>
                    <a href="AssetUnderMasters.aspx"> Asset Under Masters</a>
                    <a href="AssetUsersMasters.aspx"> Asset Users Masters</a>
                    <a href="CameraStatusMasters.aspx"> Camera Status Masters</a>
                    <a href="CurrentConditionMasters.aspx"> Current Condition Masters</a>
                    <a href="CurrentLocationMasters.aspx"> Current Location Masters</a>
                    <a href="CurrentStatusMasters.aspx"> Current Status Masters</a>
                    <a href="FrequencyMasters.aspx"> Frequency Masters</a>
                    <a href="FrquencyofAMCMasters.aspx"> Frquency of AMC Masters</a>
                    <a href="SubGroupMasters.aspx"> Sub-Group Masters</a>
                    <a href="TagTypeMasters.aspx"> Tag Type Masters</a>
                                </div>
                <li> <a href="Transactions.aspx"> Transactions</a>
                    <li> <a href="SearchAssets.aspx"> Asset Details</a>
                        <li> <a href="AssetConnect.aspx"> Asset Connect</a>
                <li> <a href="Home.aspx"> Log Out</a>
            </li>
        </ul>
     <style>
           ul{
               list-style-type:none;
               margin:0;
               padding:0;
               overflow:hidden;
               background-color:#333;
           }
           li{ float: left;
           }
           li a, .dropbtn{
               display: inline-block;
               color:white;
               text-align:center;
               padding: 14px 16px;
               text-decoration: none;
                       }
           li a:hover , .dropdown:hover .dropbtn{
               background-color:#333;
                          }
           li.dropdown{
               display:inline-block;
           }
           .dropdown-content{
               display: none;
               position: absolute;
               background-color:#f9f9f9;
               min-width:160px;
               box-shadow:0px 8px 16px 0px rgba(0,0,0,0.2);
               z-index:1;
                          }
           .dropdown-content a{
               color:black;
               padding: 12px 16px;
               text-decoration:none;
               display:block;
               text-align:left;
           }
           .dropdown-content a:hover{
               background-color: #f1f1f1;
           }
           .dropdown:hover .dropdown-content{
               display:block;
           }
           .auto-style2 {
               width: 382px;
           }
       </style>
    <div>
         <table> 
           <tr><td style="width:280px">&nbsp;</td>
               <td class="auto-style2">
    <div>
      
       
                   </div>
               </td>     
           </tr>
       </table> 
    </div>
       </asp:Content>