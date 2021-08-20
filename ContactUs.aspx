<%@ Page Language="C#" MasterPageFile="~/HomeMaster.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderM" Runat="Server">
                  
       <div>
         <table> 
           <tr> 
               <td style="align-items:center">
    <div>
<style>
   
html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

@media (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}

.buttonC {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font: INITIAL;
}

.button:hover {
  background-color: #555;
}

</style>     
        <h2>Meet The Team</h2>
<p>We can help you with any support</p>
<br>
<div class="row">
  <div class="column">
    <div class="card">
      <img src="images/try.jpg" alt="ParagSir" style="width:100%">
      <div class="container">
        <h2>Parag Khatavkar</h2>
        <p class="title">Project Manager</p>
        <p>Project Guide</p>
        <p>khatavkarparag@gmail.com</p>
        <p><button class="buttonC">Contact No: 987654</button></p>
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card">
      <img src="images/try.jpg" alt="Adithi" style="width:100%">
      <div class="container">
        <h2>Adithi R. Upadhya</h2>
        <p class="title">Developer</p>
        <p>Student</p>
        <p>adithiru095@gmail.com</p>
        <p><button class="buttonC">Contact No: 987654</button></p>
      </div>
    </div>
  </div>
  <div class="column">
    <div class="card">
      <img src="images/try.jpg" alt="John" style="width:100%">
      <div class="container">
        <h2>Example</h2>
        <p class="title">Developer</p>
        <p>Another</p>
        <p>example@gmail.com</p>
        <p><button class="buttonC">Contact No:9758</button></p>
      </div>
    </div>
  </div>
</div>
  
        </div>
         </td>
           </tr>
       </table> 
    </div>
       </asp:Content>

