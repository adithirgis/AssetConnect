using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Net.Mime;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;

public partial class check2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            BindCS();
            BindCC();
            BindAG();
           
        }
        List<AssetViewModel> dt = this.GetData();
        rptMarkers.DataSource = dt;
        rptMarkers.DataBind();
    }
   
    private List<AssetViewModel> GetData()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        List<AssetViewModel> am1 = null;
        if (DDSearch.SelectedValue == "1" && DDStatus.SelectedIndex > 0 && DDCondition.SelectedIndex > 0 && DDGroup.SelectedIndex > 0)
        {
            am1 = (from am in context.LUT_Assets_Masters
                   join grp in context.LUT_Asset_Groups on am.AGrpID equals grp.AGrpID
                   join cc in context.LUT_Current_Condition on am.CCID equals cc.CCID
                   join cs in context.LUT_Current_Status on am.CSID equals cs.CSID
                   join mn in context.LUT_Asset_Manufacturers on am.MnfID equals mn.MnfID
                   join sp in context.LUT_Service_Provider_Of_Asset on am.SPID equals sp.SPID
                   join fr in context.LUT_Frequency on am.FID equals fr.FID
                   join sg in context.LUT_Sub_Group on am.SGID equals sg.SGID
                   join tt in context.LUT_Tag_Type on am.TID equals tt.TID
                   join alp in context.LUT_Asset_Leased_or_Purchased on am.ALPID equals alp.ALPID
                   where am.CSID == DDStatus.SelectedIndex
                         && am.CCID == DDCondition.SelectedIndex
                         && am.AGrpID == DDGroup.SelectedIndex
                   select new AssetViewModel
                   {
                       AId = am.AID,
                       Name = am.Name_of_Asset,
                       lng = am.Current_Location_X,
                       lat = am.Current_Location_Y,
                       AGrpId = am.AGrpID,
                       CCId = am.CCID,
                       CSId = am.CSID,
                       TTId = am.TID,
                       MnfId = am.MID,
                       SPId = am.SPID,
                       SGId = am.SGID,
                       FId = am.FID,
                       ALPId = am.ALPID,
                       Came = am.Camera ? "Yes" : "No",
                       des = (am.Description != null) ? am.Description : "No Description",
                       AG = grp.Asset_Groups,
                       CC = cc.Current_Condition,
                       CS = cs.Current_Status,
                       Mnf = mn.Asset_Manufacturer,
                       SP = sp.Service_Provider_of_Asset,
                       Fre = fr.Frequency,
                       SG = (sg.Sub_Group != null) ? sg.Sub_Group : "No Sub Group Selected",
                       TT = tt.Tag_Type,
                       ALP = alp.Asset_Leased_or_Purchased
                   }).ToList();
            

        }
        else if (DDSearch.SelectedValue == "1" && DDStatus.SelectedIndex > 0 && DDCondition.SelectedIndex > 0 && DDGroup.SelectedIndex == 0)
        {
            am1 = (from am in context.LUT_Assets_Masters
                   join grp in context.LUT_Asset_Groups on am.AGrpID equals grp.AGrpID
                   join cc in context.LUT_Current_Condition on am.CCID equals cc.CCID
                   join cs in context.LUT_Current_Status on am.CSID equals cs.CSID
                   join mn in context.LUT_Asset_Manufacturers on am.MnfID equals mn.MnfID
                   join sp in context.LUT_Service_Provider_Of_Asset on am.SPID equals sp.SPID
                   join fr in context.LUT_Frequency on am.FID equals fr.FID
                   join sg in context.LUT_Sub_Group on am.SGID equals sg.SGID
                   join tt in context.LUT_Tag_Type on am.TID equals tt.TID
                   join alp in context.LUT_Asset_Leased_or_Purchased on am.ALPID equals alp.ALPID
                   where am.CSID == DDStatus.SelectedIndex
                         && am.CCID == DDCondition.SelectedIndex
                   select new AssetViewModel
                   {
                       AId = am.AID,
                       Name = am.Name_of_Asset,
                       lng = am.Current_Location_X,
                       lat = am.Current_Location_Y,
                       AGrpId = am.AGrpID,
                       CCId = am.CCID,
                       CSId = am.CSID,
                       TTId = am.TID,
                       MnfId = am.MID,
                       SPId = am.SPID,
                       SGId = am.SGID,
                       FId = am.FID,
                       Model = am.Model,
                       ALPId = am.ALPID,
                       Came = am.Camera ? "Yes" : "No",
                       des = (am.Description != null) ? am.Description : "No Description",
                       AG = grp.Asset_Groups,
                       CC = cc.Current_Condition,
                       CS = cs.Current_Status,
                       Mnf = mn.Asset_Manufacturer,
                       SP = sp.Service_Provider_of_Asset,
                       Fre = fr.Frequency,
                       SG = (sg.Sub_Group != null) ? sg.Sub_Group : "No Sub Group Selected",
                       TT = tt.Tag_Type,
                       ALP = alp.Asset_Leased_or_Purchased
                   }).ToList();
        }
        else if (DDSearch.SelectedValue == "1" && DDStatus.SelectedIndex > 0 && DDGroup.SelectedIndex > 0 && DDCondition.SelectedIndex == 0)
        {
            am1 = (from am in context.LUT_Assets_Masters
                   join grp in context.LUT_Asset_Groups on am.AGrpID equals grp.AGrpID
                   join cc in context.LUT_Current_Condition on am.CCID equals cc.CCID
                   join cs in context.LUT_Current_Status on am.CSID equals cs.CSID
                   join mn in context.LUT_Asset_Manufacturers on am.MnfID equals mn.MnfID
                   join sp in context.LUT_Service_Provider_Of_Asset on am.SPID equals sp.SPID
                   join fr in context.LUT_Frequency on am.FID equals fr.FID
                   join sg in context.LUT_Sub_Group on am.SGID equals sg.SGID
                   join tt in context.LUT_Tag_Type on am.TID equals tt.TID
                   join alp in context.LUT_Asset_Leased_or_Purchased on am.ALPID equals alp.ALPID
                   where am.CSID == DDStatus.SelectedIndex
                        && am.AGrpID == DDGroup.SelectedIndex
                   select new AssetViewModel
                   {
                       AId = am.AID,
                       Name = am.Name_of_Asset,
                       lng = am.Current_Location_X,
                       lat = am.Current_Location_Y,
                       AGrpId = am.AGrpID,
                       CCId = am.CCID,
                       CSId = am.CSID,
                       TTId = am.TID,
                       MnfId = am.MID,
                       SPId = am.SPID,
                       SGId = am.SGID,
                       FId = am.FID,
                       ALPId = am.ALPID,
                       Came = am.Camera ? "Yes" : "No",
                       Model = am.Model,
                       des = (am.Description != null) ? am.Description : "No Description",
                       AG = grp.Asset_Groups,
                       CC = cc.Current_Condition,
                       CS = cs.Current_Status,
                       Mnf = mn.Asset_Manufacturer,
                       SP = sp.Service_Provider_of_Asset,
                       Fre = fr.Frequency,
                       SG = (sg.Sub_Group != null) ? sg.Sub_Group : "No Sub Group Selected",
                       TT = tt.Tag_Type,
                       ALP = alp.Asset_Leased_or_Purchased
                   }).ToList();
            
        }
        else if (DDSearch.SelectedValue == "1" && DDCondition.SelectedIndex > 0 && DDGroup.SelectedIndex > 0 && DDStatus.SelectedIndex == 0)
        {
            am1 = (from am in context.LUT_Assets_Masters
                   join grp in context.LUT_Asset_Groups on am.AGrpID equals grp.AGrpID
                   join cc in context.LUT_Current_Condition on am.CCID equals cc.CCID
                   join cs in context.LUT_Current_Status on am.CSID equals cs.CSID
                   join mn in context.LUT_Asset_Manufacturers on am.MnfID equals mn.MnfID
                   join sp in context.LUT_Service_Provider_Of_Asset on am.SPID equals sp.SPID
                   join fr in context.LUT_Frequency on am.FID equals fr.FID
                   join sg in context.LUT_Sub_Group on am.SGID equals sg.SGID
                   join tt in context.LUT_Tag_Type on am.TID equals tt.TID
                   join alp in context.LUT_Asset_Leased_or_Purchased on am.ALPID equals alp.ALPID
                   where am.CCID == DDCondition.SelectedIndex
                        && am.AGrpID == DDGroup.SelectedIndex
                   select new AssetViewModel
                   {
                       AId = am.AID,
                       Name = am.Name_of_Asset,
                       lng = am.Current_Location_X,
                       lat = am.Current_Location_Y,
                       AGrpId = am.AGrpID,
                       CCId = am.CCID,
                       CSId = am.CSID,
                       TTId = am.TID,
                       MnfId = am.MID,
                       SPId = am.SPID,
                       SGId = am.SGID,
                       Model = am.Model,
                       FId = am.FID,
                       ALPId = am.ALPID,
                       //Cam = am.Camera,
                       Came = am.Camera ? "Yes" : "No",
                       des = (am.Description != null) ? am.Description : "No Description",
                       AG = grp.Asset_Groups,
                       CC = cc.Current_Condition,
                       CS = cs.Current_Status,
                       Mnf = mn.Asset_Manufacturer,
                       SP = sp.Service_Provider_of_Asset,
                       Fre = fr.Frequency,
                       SG = (sg.Sub_Group != null) ? sg.Sub_Group : "No Sub Group Selected",
                       TT = tt.Tag_Type,
                       ALP = alp.Asset_Leased_or_Purchased
                   }).ToList();
        }
        else
        {
            //am1 = (from am in context.LUT_Assets_Masters select am).ToList();
            am1 = (from am in context.LUT_Assets_Masters
                   join grp in context.LUT_Asset_Groups on am.AGrpID equals grp.AGrpID
                   join cc in context.LUT_Current_Condition on am.CCID equals cc.CCID
                   join cs in context.LUT_Current_Status on am.CSID equals cs.CSID
                   join mn in context.LUT_Asset_Manufacturers on am.MnfID equals mn.MnfID
                   join sp in context.LUT_Service_Provider_Of_Asset on am.SPID equals sp.SPID
                   join fr in context.LUT_Frequency on am.FID equals fr.FID
                   join sg in context.LUT_Sub_Group on am.SGID equals sg.SGID
                   join tt in context.LUT_Tag_Type on am.TID equals tt.TID
                   join alp in context.LUT_Asset_Leased_or_Purchased on am.ALPID equals alp.ALPID
                
                   select new AssetViewModel
                   {
                       AId = am.AID,
                       Name = am.Name_of_Asset,
                       lng = am.Current_Location_X,
                       lat = am.Current_Location_Y,
                       AGrpId = am.AGrpID,
                       CCId = am.CCID,
                       CSId = am.CSID,
                       TTId = am.TID,
                       MnfId = am.MID,
                       SPId = am.SPID,
                       SGId = am.SGID,
                       FId = am.FID,
                       Model = am.Model,
                       ALPId = am.ALPID,
                       Came = am.Camera ? "Yes" : "No",
                       des = (am.Description != null) ? am.Description : "No Description",
                         AG = grp.Asset_Groups,
                       CC = cc.Current_Condition,
                       CS = cs.Current_Status,
                       Mnf = mn.Asset_Manufacturer,
                       SP = sp.Service_Provider_of_Asset,
                       Fre = fr.Frequency,
                       SG = (sg.Sub_Group != null )? sg.Sub_Group : "No Sub Group Selected",
                       TT = tt.Tag_Type,
                       ALP = alp.Asset_Leased_or_Purchased
                   }).ToList();
          
        }
  return am1;

    }
    protected void DDSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDSearch.SelectedValue == "1")
        {
            Search.Visible = true;
            //BArea.Visible = false;
        }

        if (DDSearch.SelectedValue == "2")
        {
            Search.Visible = false;
            //BArea.Visible = true;
        }
    }
    protected void DDGroup_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<AssetViewModel> dt = this.GetData();
        rptMarkers.DataSource = dt;
        rptMarkers.DataBind();

    }
    protected void DDCondition_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<AssetViewModel> dt = this.GetData();
        rptMarkers.DataSource = dt;
        rptMarkers.DataBind();
    }
    protected void DDStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<AssetViewModel> dt = this.GetData();
        rptMarkers.DataSource = dt;
        rptMarkers.DataBind();
    }
    private void BindAG()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        List<LUT_Asset_Groups> Ag = (from ag in context.LUT_Asset_Groups where ag.IsDeleted == false select ag).ToList();
        DDGroup.DataTextField = "Asset_Groups";
        DDGroup.DataValueField = "AGrpID";
        DDGroup.DataSource = Ag;
        DDGroup.DataBind();
        DDGroup.Items.Insert(0, " Select Asset Groups");
    }
    private void BindCC()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        List<LUT_Current_Condition> CC = (from cc in context.LUT_Current_Condition where cc.IsDeleted == false select cc).ToList();
        DDCondition.DataTextField = "Current_Condition";
        DDCondition.DataValueField = "CCID";
        DDCondition.DataSource = CC;
        DDCondition.DataBind();
        DDCondition.Items.Insert(0, "Select Current Condition");
    }
    private void BindCS()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        List<LUT_Current_Status> CS = (from cs in context.LUT_Current_Status where cs.IsDeleted == false select cs).ToList();
        DDStatus.DataTextField = "Current_Status";
        DDStatus.DataValueField = "CSID";
        DDStatus.DataSource = CS;
        DDStatus.DataBind();
        DDStatus.Items.Insert(0, "Select Current Status");
    }
    private void sendMail(string userName, string emailID, string randomPassword)
    {
        try { 
        string From, To, Subject, Body;
        From = "mscgis2017@gmail.com";
        MailMessage mail = new MailMessage();
        SmtpClient smtp = new SmtpClient();
        //string MailSettingsPath = System.Web.Hosting.HostingEnvironment.MapPath("~/ConfigurationSettings/SendMailConfiguration.xml");  // is there a need? no hosting location
        MemoryStream file = new MemoryStream(PDFGenerate("This is pdf file text", Server.MapPath("Images/photo.jpg")).ToArray());  // generate dynamically using data from infowindow which can be changed in the infowindow
        file.Seek(0, SeekOrigin.Begin);
        Attachment data = new Attachment(file, "Asset_Details.pdf", "application/pdf");
        ContentDisposition disposition = data.ContentDisposition;
        disposition.CreationDate =DateTime.Now;
        disposition.ModificationDate =DateTime.Now;
        disposition.DispositionType = DispositionTypeNames.Attachment;
        mail.Attachments.Add(data);
        To = emailID;   //from user
        Subject =" Asset Details  pdf attached";
        //string content = "Please find the attachment below";
        Body = "Please find the attachment below";
        Body = "<html><head>Asset Details</head><body>" + Body + "</body></html>";
        string Password ="tryit";
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.EnableSsl =true;               // true or false
        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
        smtp.UseDefaultCredentials = false;
        smtp.Credentials = new NetworkCredential(From, Password);
        mail.From = new MailAddress(From);
        mail.To.Add(emailID);  //from user text box in infowindow
        mail.Subject = Subject;
        mail.IsBodyHtml = true;
        smtp.ServicePoint.MaxIdleTime = 0;       //
        smtp.ServicePoint.SetTcpKeepAlive(true, 2000, 2000);      // try this
        mail.BodyEncoding = Encoding.Default;
        mail.Priority = MailPriority.High;
        mail.Body = Body;
        smtp.Send(mail);
        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Message has been sent successfully.');", true);
    }
        catch (Exception ex)
        { Response.Write("Failed sending mail"); }
    }
    private MemoryStream PDFGenerate(string message, string ImagePath)
    {

        MemoryStream output = new MemoryStream();

        Document pdfDoc = new Document(PageSize.A4, 25, 10, 25, 10);
        PdfWriter pdfWriter = PdfWriter.GetInstance(pdfDoc, output);

        pdfDoc.Open();
        Paragraph Text = new Paragraph(message);
        pdfDoc.Add(Text);

        byte[] file;
        file = System.IO.File.ReadAllBytes(ImagePath);

        iTextSharp.text.Image jpg = iTextSharp.text.Image.GetInstance(file);
        jpg.ScaleToFit(550F, 200F);
        pdfDoc.Add(jpg);

        pdfWriter.CloseStream = false;
        pdfDoc.Close();
        output.Position = 0;

        return output;
    }

}
//MailMessage Class Properties
//Following are the required properties of the MailMessage class.
//From – Sender’s email address
//To – Recipient(s) Email Address
//CC – Carbon Copies(if any)
//BCC – Blind Carbon Copies(if any)
//Subject – Subject of the Email
//Body – Body of the Email
//IsBodyHtml – Specify whether body contains text or HTML mark up.
//Attachments – Attachments(if any)
//ReplyTo – ReplyTo Email address.

//SMTP Class Properties
//Following are the properties of the SMTP class.
//Host – SMTP Server URL(Gmail: smtp.gmail.com)
//EnableSsl – Specify whether your host accepts SSL Connections(Gmail: True)
//UseDefaultCredentials – Set to True in order to allow authentication based on the Credentials of the Account used to send emails
//Credentials – Valid login credentials for the SMTP server(Gmail: email address and password)
//Port – Port Number of the SMTP server(Gmail: 587)