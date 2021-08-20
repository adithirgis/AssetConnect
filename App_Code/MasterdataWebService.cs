using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Services;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net.Mime;
using System.Data;


/// <summary>
/// Summary description for MasterdataWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class MasterdataWebService : System.Web.Services.WebService
{

    public MasterdataWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }
    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }
    [WebMethod]
    public List<DDItem> getAssetStatus()
    {

        AssetTaggingEntities context = new AssetTaggingEntities();
        var result = (from s in context.LUT_Current_Status where s.IsDeleted == false select new DDItem { id = s.CSID, value = s.Current_Status }).ToList();
        return result;
    }
    [WebMethod]
    public List<DDItem> getAssetCondition()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        var result = (from c in context.LUT_Current_Condition where c.IsDeleted == false select new DDItem { id = c.CCID, value = c.Current_Condition }).ToList();
        return result;
    }
    [WebMethod]
    public List<DDItem> getAssetGroup()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        var result = (from ag in context.LUT_Asset_Groups where ag.IsDeleted == false select new DDItem { id = ag.AGrpID, value = ag.Asset_Groups }).ToList();
        return result;
    }
    [WebMethod]
    public bool SaveSC(int aid, int ccid, int csid)
    {

        AssetTaggingEntities context = new AssetTaggingEntities();
        var result = (from a in context.LUT_Assets_Masters where a.AID == aid select a).FirstOrDefault();
        if (result != null)
        {

            result.CCID = ccid;
            result.CSID = csid;
            context.SaveChanges();

        }
        return result != null;
    }
    [WebMethod]
    public void Mailing(int a, string reci, string descr)//string reci, string descrp, string a, string cc, string cs, string des, string tt, string agrp, string mnfid, string spid, string fid, string model, string alpid, string name
    {
        var email = "adithiru095@gmail.com";
        var pass = "sairam009";
        string recipient =reci;
        string status = "";
        try
        {
            using (MailMessage mm = new MailMessage(email, recipient))
            {
                mm.Subject ="Asset Connect : Report of Asset ";
                mm.Body = "Asset Connect brings an easy way to keep tack of ground assets. Attached is a detailed report of asset. Please find attachment" ;
              string doc = GeneratePDF(a, descr);// descrp,  a,  cc,  cs,  des,  tt,  agrp,  mnfid,  spid,  fid,  model,  alpid,  name
              mm.Attachments.Add(new Attachment(doc, "application/pdf"));
                mm.IsBodyHtml = false;
                mm.BodyEncoding = Encoding.Default;
                mm.Priority = MailPriority.High;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential(email, pass);
                smtp.UseDefaultCredentials = true;
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Credentials = NetworkCred;
                smtp.ServicePoint.MaxIdleTime = 0;
                smtp.ServicePoint.SetTcpKeepAlive(true, 2000, 2000);
                smtp.Port = 587;
                smtp.Send(mm);
            }
        }
        catch (Exception ex)
        { status = ex.Message.ToString(); }
    }
    private string GeneratePDF(int a,string descr) // string descrp, int a, string cc, string cs, string des, string tt, string agrp, string mnfid, string spid, string fid, string model, string alpid, string name
    {
        Document pdfDoc = new Document(PageSize.A4, 25, 10, 25, 10);
        string filename = Server.MapPath("~/uploadpdf") + "\\" + "AssetDetailsPDFDate" + DateTime.Now.ToString("yyyyMMdd_HHmmssfff") + ".pdf";
        AssetTaggingEntities context = new AssetTaggingEntities();
        AssetViewModel am1 = null;
        string status = "";
        try
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
                   where am.AID==a
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
                       Model=(am.Model!=null)?am.Model:"Model unknown",
                       SG = (sg.Sub_Group != null) ? sg.Sub_Group : "No Sub Group Selected",
                       TT = tt.Tag_Type,
                       ALP = alp.Asset_Leased_or_Purchased
                   }).FirstOrDefault();
            Phrase phrase = null;
            PdfPCell cell = null;
            PdfPTable table = null;
            BaseColor color = null;
            System.IO.FileStream pdfstream = new System.IO.FileStream(filename, System.IO.FileMode.Create);
            PdfWriter pdfWriter = PdfWriter.GetInstance(pdfDoc, pdfstream);
            Font NormalFont = FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK);
            pdfDoc.Open();
            //Header Table
            table = new PdfPTable(2);
            table.TotalWidth = 500f;
            table.LockedWidth = true;
            table.SetWidths(new float[] { 0.3f, 0.7f });

            //Asset Connect Logo
            cell = ImageCell("~/images/SIconF.jpg", 60f, PdfPCell.ALIGN_LEFT);
            table.AddCell(cell);

            //Asset Connect Name and Address
            phrase = new Phrase();
            phrase.Add(new Chunk("Asset Connect\n\n", FontFactory.GetFont("Arial", 20, Font.BOLD, BaseColor.BLACK)));
            phrase.Add(new Chunk("BVIEER,\n", FontFactory.GetFont("Arial", 10, Font.NORMAL, BaseColor.BLACK)));
            phrase.Add(new Chunk("Pune, India\n", FontFactory.GetFont("Arial", 10, Font.NORMAL, BaseColor.BLACK)));
            cell = PhraseCell(phrase, PdfPCell.ALIGN_LEFT);
            cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
            table.AddCell(cell);

            //Separater Line
            color = new BaseColor(System.Drawing.ColorTranslator.FromHtml("#A9A9A9"));
            DrawLine(pdfWriter, 25f, pdfDoc.Top - 79f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 79f, color);
            DrawLine(pdfWriter, 25f, pdfDoc.Top - 80f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 80f, color);
            pdfDoc.Add(table);
            table = new PdfPTable(2);
            table.HorizontalAlignment = Element.ALIGN_LEFT;
            table.SetWidths(new float[] { 0.3f, 1f });
            table.SpacingBefore = 20f;
            Paragraph Text = new Paragraph("Asset Details and Parameters ");
            Text.SpacingBefore = 50;
            Text.SpacingAfter = 10;
            Text.Alignment = Element.ALIGN_CENTER;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 16f, Font.UNDERLINE, BaseColor.BLACK);
            pdfDoc.Add(Text);
            Text = new Paragraph("Asset Details of: " + a);
            Text.SpacingBefore = 30;
            Text.SpacingAfter = 5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.BLACK);
            pdfDoc.Add(Text);
            Text = new Paragraph("Name: " + am1.Name);
            Text.SpacingBefore = 5;
            Text.SpacingAfter = 5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.BLACK);
            pdfDoc.Add(Text);
            Text = new Paragraph("Current Condition of asset: " + am1.CC);
            Text.SpacingBefore = 5;
            Text.SpacingAfter = 5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.BLACK);
            pdfDoc.Add(Text);
            Text = new Paragraph("Current Status of asset: " + am1.CS);
            Text.SpacingBefore = 5;
            Text.SpacingAfter = 5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.BLACK);
            pdfDoc.Add(Text);
            Text = new Paragraph("Asset Group: " + am1.AG);
            Text.SpacingBefore = 5;
            Text.SpacingAfter = 5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.BLACK);
            pdfDoc.Add(Text);
            Text = new Paragraph("Tag Type: " + am1.TT);
            Text.SpacingBefore = 5;
            Text.SpacingAfter = 5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.BLACK);
            pdfDoc.Add(Text);
            Text = new Paragraph("Asset Manufacturer: " + am1.Mnf);
            Text.SpacingBefore = 5;
            Text.SpacingAfter = 5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.BLACK);
            pdfDoc.Add(Text);
            Text = new Paragraph("Asset Service Provider: " + am1.SP);
            Text.SpacingBefore = 5;
            Text.SpacingAfter = 5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.BLACK);
            pdfDoc.Add(Text);
            Text = new Paragraph("Frequency of Maintenance: " + am1.Fre);
            Text.SpacingBefore = 5;
            Text.SpacingAfter = 5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.BLACK);
            pdfDoc.Add(Text);
            Text = new Paragraph("Model: " + am1.Model);
            Text.SpacingBefore = 5;
            Text.SpacingAfter = 5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.BLACK);
            pdfDoc.Add(Text);
            Text = new Paragraph("Camera on Asset: " + am1.Came);
            Text.SpacingBefore = 5;
            Text.SpacingAfter = 5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.BLACK);
            pdfDoc.Add(Text);
            Text = new Paragraph("Asset Leased or Purchased: " + am1.ALP);
            Text.SpacingBefore = 5;
            Text.SpacingAfter = 5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.CYAN);
            pdfDoc.Add(Text);
            Text = new Paragraph("Costing Details: " + descr);
            Text.SpacingBefore = 5;
            Text.SpacingAfter = 5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.BLACK);
            pdfDoc.Add(Text);
            Text = new Paragraph("Additional Details: " + am1.des);
            Text.SpacingBefore = 5;
            Text.SpacingAfter = 5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.BLACK);
            pdfDoc.Add(Text);
            //pdfWriter.Flush();
            //  pdfWriter.CloseStream =false;//check if file does not get created
            //  pdfWriter.Close();
            pdfDoc.CloseDocument();
        }
        catch(Exception ex)
        { status = ex.Message.ToString(); }
        finally { //pdfDoc.Close();
            pdfDoc.Dispose();
        }
        return filename;
    }
    private static void DrawLine(PdfWriter writer, float x1, float y1, float x2, float y2, BaseColor color)
    {
        PdfContentByte contentByte = writer.DirectContent;
        contentByte.SetColorStroke(color);
        contentByte.MoveTo(x1, y1);
        contentByte.LineTo(x2, y2);
        contentByte.Stroke();
    }
    private static PdfPCell PhraseCell(Phrase phrase, int align)
    {
        PdfPCell cell = new PdfPCell(phrase);
        cell.BorderColor = BaseColor.WHITE;
        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
        cell.HorizontalAlignment = align;
        cell.PaddingBottom = 2f;
        cell.PaddingTop = 0f;
        return cell;
    }
    private static PdfPCell ImageCell(string path, float scale, int align)
    {
        iTextSharp.text.Image image = iTextSharp.text.Image.GetInstance(HttpContext.Current.Server.MapPath(path));
        image.ScalePercent(scale);
        PdfPCell cell = new PdfPCell(image);
        cell.BorderColor = BaseColor.WHITE;
        cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
        cell.HorizontalAlignment = align;
        cell.PaddingBottom = 10f;
        cell.PaddingTop = 10f;
        return cell;
    }
    [WebMethod]
    public void PDF(int ab, string descr) // string descrp, int a, string cc, string cs, string des, string tt, string agrp, string mnfid, string spid, string fid, string model, string alpid, string name
    {
        Document pdfDoc = new Document(PageSize.A4, 88f, 88f, 10f, 10f);
       AssetTaggingEntities context = new AssetTaggingEntities();
        string status = "";
        string filename = Server.MapPath("~/uploadpdf") + "\\" + "AssetDetailsPDFDate" + DateTime.Now.ToString("yyyyMMdd_HHmmssfff") + ".pdf";
        AssetViewModel am1 = null;
        try
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
                   where am.AID == ab
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
                       Model = (am.Model != null) ? am.Model : "Model unknown",
                       SG = (sg.Sub_Group != null) ? sg.Sub_Group : "No Sub Group Selected",
                       TT = tt.Tag_Type,
                       ALP = alp.Asset_Leased_or_Purchased
                   }).FirstOrDefault();
            Phrase phrase = null;
            PdfPCell cell = null;
            PdfPTable table = null;
            BaseColor color = null;
            PdfWriter pdfWriter = PdfWriter.GetInstance(pdfDoc, HttpContext.Current.Response.OutputStream);
            Font NormalFont = FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK);
            pdfDoc.Open();
            //Header Table
            table = new PdfPTable(2);
            table.TotalWidth = 500f;
            table.LockedWidth = true;
            table.SetWidths(new float[] { 0.3f, 0.7f });

            //Asset Connect Logo
            cell = ImageCell("~/images/SIconF.jpg", 60f, PdfPCell.ALIGN_LEFT);
            table.AddCell(cell);

            //Asset Connect Name and Address
            phrase = new Phrase();
            phrase.Add(new Chunk("Asset Connect\n\n", FontFactory.GetFont("Arial", 20, Font.BOLD, BaseColor.BLACK)));
            phrase.Add(new Chunk("BVIEER,\n", FontFactory.GetFont("Arial", 10, Font.NORMAL, BaseColor.BLACK)));
            phrase.Add(new Chunk("Pune, India\n", FontFactory.GetFont("Arial", 10, Font.NORMAL, BaseColor.BLACK)));
            cell = PhraseCell(phrase, PdfPCell.ALIGN_LEFT);
            cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
            table.AddCell(cell);

            //Separater Line
            color = new BaseColor(System.Drawing.ColorTranslator.FromHtml("#A9A9A9"));
            DrawLine(pdfWriter, 25f, pdfDoc.Top - 79f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 79f, color);
            DrawLine(pdfWriter, 25f, pdfDoc.Top - 80f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 80f, color);
            pdfDoc.Add(table);
            table = new PdfPTable(2);
            table.HorizontalAlignment = Element.ALIGN_LEFT;
            table.SetWidths(new float[] { 0.3f, 1f });
            table.SpacingBefore = 20f;
            Paragraph Text = new Paragraph("Asset Details and Parameters " );
            Text.SpacingBefore = 50;
            Text.SpacingAfter = 10;
            Text.Alignment = Element.ALIGN_CENTER;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 16f, Font.UNDERLINE, BaseColor.BLACK);
            pdfDoc.Add(Text);
            Text = new Paragraph("Asset Details of: " + ab);
            Text.SpacingBefore = 30;
            Text.SpacingAfter = 5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.BLACK);
            pdfDoc.Add(Text);
            Text = new Paragraph("Name: " + am1.Name);
            Text.SpacingBefore = 5;
            Text.SpacingAfter = 5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.BLACK);
            pdfDoc.Add(Text);
            Text = new Paragraph("Current Condition of asset: " + am1.CC);
            Text.SpacingBefore = 5;
            Text.SpacingAfter = 5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.BLACK);
            pdfDoc.Add(Text);
            Text = new Paragraph("Current Status of asset: " + am1.CS);
            Text.SpacingBefore = 5;
            Text.SpacingAfter = 5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.BLACK);
            pdfDoc.Add(Text);
            Text = new Paragraph("Asset Group: " + am1.AG);
            Text.SpacingBefore = 5;
            Text.SpacingAfter = 5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.BLACK);
            pdfDoc.Add(Text);
            Text = new Paragraph("Tag Type: " + am1.TT);
            Text.SpacingBefore = 5;
            Text.SpacingAfter = 5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.BLACK);
            pdfDoc.Add(Text);
            Text = new Paragraph("Asset Manufacturer: " + am1.Mnf);
            Text.SpacingBefore = 5;
            Text.SpacingAfter = 5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.BLACK);
            pdfDoc.Add(Text);
            Text = new Paragraph("Asset Service Provider: " + am1.SP);
            Text.SpacingBefore = 5;
            Text.SpacingAfter = 5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.BLACK);
            pdfDoc.Add(Text);
            Text = new Paragraph("Frequency of Maintenance: " + am1.Fre);
            Text.SpacingBefore = 5;
            Text.SpacingAfter =5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.BLACK);
            pdfDoc.Add(Text);
            Text = new Paragraph("Model: " + am1.Model);
            Text.SpacingBefore =5;
            Text.SpacingAfter =5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.BLACK);
            pdfDoc.Add(Text);
            Text = new Paragraph("Camera on Asset: " + am1.Came);
            Text.SpacingBefore = 5;
            Text.SpacingAfter = 5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.BLACK);
            pdfDoc.Add(Text);
            Text = new Paragraph("Asset Leased or Purchased: " + am1.ALP);
            Text.SpacingBefore =5;
            Text.SpacingAfter =5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.CYAN);
            pdfDoc.Add(Text);
            Text = new Paragraph("Costing Details: " + descr);
            Text.SpacingBefore =5;
            Text.SpacingAfter =5;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.BLACK);
            pdfDoc.Add(Text);
            Text = new Paragraph("Additional Details: " + am1.des);
            Text.SpacingBefore =5;
            Text.SpacingAfter = 5;
            Text.Alignment = Element.ALIGN_LEFT;
             Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.BLACK);
            pdfDoc.Add(Text);
            //pdfWriter.Flush();
             pdfWriter.CloseStream =false;//check if file does not get created
            //  pdfWriter.Close();
            pdfDoc.CloseDocument();
            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.ContentType = "application/pdf";
            HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=" + "AssetDetailsPDFDate" + DateTime.Now.ToString("yyyyMMdd_HHmmssfff") + ".pdf");
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            HttpContext.Current.Response.Write(pdfDoc);
            HttpContext.Current.Response.End();
            HttpContext.Current.Response.Close();
            status = "success";

        }
        catch (Exception ex)
        { status = ex.Message.ToString(); }
        finally
        { //pdfDoc.Close();
            pdfDoc.Dispose();
        }
    }
}

public class DDItem
{
    public int id { get; set; }
    public string value { get; set; }
    public string desc { get; set; }
    public int CSid { get; set; }
         public int CCid { get; set; }
    public int ALPid { get; set; }
    public int AGrpid { get; set; }
    public int MNFid { get; set; }
    public int TTid { get; set; }
    public int Fid { get; set; }
    public int SPid { get; set; }
    public string Name { get; set; }
    public string Model { get; set; }
    
}
//[WebMethod]
//protected void Mailing(string reci, string descrp, int a, string cc, string cs, string des, string tt, string agrp, string mnfid, string spid, string fid, string model, string alpid, string name)//
//{
//    var email = "adithiru095@gmail.com";
//    var pass = "sairam009";
//    string recipient = reci;
//    try
//    {
//        using (MailMessage mm = new MailMessage(email, recipient))
//        {
//            mm.Subject = "Asset Connect: Details of Asset: ";
//            mm.Body = "Asset Connect brings an easy way to keep tack of ground assets. Attached is a detailed report of asset. Please find attachment";
//           string doc = GeneratePDF(descrp,  a,  cc,  cs,  des,  tt,  agrp,  mnfid,  spid,  fid,  model,  alpid,  name);// 
//          mm.Attachments.Add(new Attachment(doc, "application/pdf"));
//            mm.IsBodyHtml = false;
//            mm.BodyEncoding = Encoding.Default;
//            mm.Priority = MailPriority.High;
//            SmtpClient smtp = new SmtpClient();
//            smtp.Host = "smtp.gmail.com";
//            smtp.EnableSsl = true;
//            NetworkCredential NetworkCred = new NetworkCredential(email, pass);
//            smtp.UseDefaultCredentials = true;
//            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
//            smtp.Credentials = NetworkCred;
//            smtp.ServicePoint.MaxIdleTime = 0;
//            smtp.ServicePoint.SetTcpKeepAlive(true, 2000, 2000);
//            smtp.Port = 587;
//            smtp.Send(mm);
//        }
//    }
//    catch (Exception ex)
//    { }
//}
//private string GeneratePDF(string descrp, int a, string cc, string cs, string des, string tt, string agrp, string mnfid, string spid, string fid, string model, string alpid, string name) // 
//{
//    Document pdfDoc = new Document(PageSize.A4, 25, 10, 25, 10);
//    Phrase phrase = null;
//    PdfPCell cell = null;
//    PdfPTable table = null;
//    BaseColor color = null;
//    string filename = Server.MapPath("~/uploadpdf") + "\\" + "AssetDetailsPDFDate" + DateTime.Now.ToString("yyyyMMdd_HHmmssfff") + ".pdf";
//    System.IO.FileStream pdfstream = new System.IO.FileStream(filename, System.IO.FileMode.Create);
//    PdfWriter pdfWriter = PdfWriter.GetInstance(pdfDoc, pdfstream);
//    Font NormalFont = FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK);
//    pdfDoc.Open();
//    Paragraph Text = new Paragraph("This is test file");
//    Text.SpacingBefore = 10;
//    Text.SpacingAfter = 10;
//    Text.Alignment = Element.ALIGN_LEFT;
//    Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.GREEN);
//    pdfDoc.Add(Text);
//table = new PdfPTable(2);
//table.TotalWidth = 500f;
//table.LockedWidth = true;
//table.SetWidths(new float[] { 0.3f, 0.7f });

////Asset Connect Logo
//cell = ImageCell("~/images/IconF.jpg", 30f, PdfPCell.ALIGN_CENTER);
//table.AddCell(cell);

////Asset Connect and Address
//phrase = new Phrase();
//phrase.Add(new Chunk("Asset Connect\n\n", FontFactory.GetFont("Arial", 16, Font.BOLD, BaseColor.RED)));
//phrase.Add(new Chunk("BVIEER,\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
//phrase.Add(new Chunk("Pune, India,\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));

//cell = PhraseCell(phrase, PdfPCell.ALIGN_LEFT);
//cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
//table.AddCell(cell);

////Separater Line
//color = new BaseColor(System.Drawing.ColorTranslator.FromHtml("#A9A9A9"));
//DrawLine(pdfWriter, 25f, pdfDoc.Top - 79f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 79f, color);
//DrawLine(pdfWriter, 25f, pdfDoc.Top - 80f, pdfDoc.PageSize.Width - 25f, pdfDoc.Top - 80f, color);
//pdfDoc.Add(table);

//table = new PdfPTable(2);
//table.HorizontalAlignment = Element.ALIGN_LEFT;
//table.SetWidths(new float[] { 0.3f, 1f });
//table.SpacingBefore = 20f;

////Employee Details
//cell = PhraseCell(new Phrase("Asset  Details and Parameters", FontFactory.GetFont("Arial", 12, Font.UNDERLINE, BaseColor.BLACK)), PdfPCell.ALIGN_CENTER);
//cell.Colspan = 2;
//table.AddCell(cell);
//cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
//cell.Colspan = 2;
//cell.PaddingBottom = 30f;
//table.AddCell(cell);

//   //Name
//phrase = new Phrase();
//phrase.Add(new Chunk("Asset Name: " + name, FontFactory.GetFont("Arial", 10, Font.BOLD, BaseColor.BLACK)));
//cell = PhraseCell(phrase, PdfPCell.ALIGN_LEFT);
//cell.VerticalAlignment = PdfPCell.ALIGN_MIDDLE;
//table.AddCell(cell);
//pdfDoc.Add(table);

//DrawLine(pdfWriter, 160f, 80f, 160f, 690f, BaseColor.BLACK);
//DrawLine(pdfWriter, 115f, pdfDoc.Top - 200f, pdfDoc.PageSize.Width - 100f, pdfDoc.Top - 200f, BaseColor.BLACK);

//table = new PdfPTable(2);
//table.SetWidths(new float[] { 0.5f, 2f });
//table.TotalWidth = 340f;
//table.LockedWidth = true;
//table.SpacingBefore = 20f;
//table.HorizontalAlignment = Element.ALIGN_RIGHT;

////Asset  Id
//table.AddCell(PhraseCell(new Phrase("Asset ID:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
//table.AddCell(PhraseCell(new Phrase(a, FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
//cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
//cell.Colspan = 2;
//cell.PaddingBottom = 10f;
//table.AddCell(cell);


////Current Condition
//table.AddCell(PhraseCell(new Phrase("Current Condition:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
//phrase = new Phrase(new Chunk(cc + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
//table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
//cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
//cell.Colspan = 2;
//cell.PaddingBottom = 10f;
//table.AddCell(cell);

////Current Status
//table.AddCell(PhraseCell(new Phrase("Current Status:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
//phrase = new Phrase(new Chunk(cs + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
//table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
//cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
//cell.Colspan = 2;
//cell.PaddingBottom = 10f;
//table.AddCell(cell);
////descrp
//table.AddCell(PhraseCell(new Phrase("Costing details :", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
//phrase = new Phrase(new Chunk(descrp + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
//table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
//cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
//cell.Colspan = 2;
//cell.PaddingBottom = 10f;
//table.AddCell(cell);
////ALPID
//table.AddCell(PhraseCell(new Phrase("Asset Leased or Purchased:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
//phrase = new Phrase(new Chunk(alpid + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
//table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
//cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
//cell.Colspan = 2;
//cell.PaddingBottom = 10f;
//table.AddCell(cell);
////TT
//table.AddCell(PhraseCell(new Phrase("Tag Type:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
//phrase = new Phrase(new Chunk(tt + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
//table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
//cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
//cell.Colspan = 2;
//cell.PaddingBottom = 10f;
//table.AddCell(cell);
////Mnfid
//table.AddCell(PhraseCell(new Phrase("Asset Manufacturer:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
//phrase = new Phrase(new Chunk(mnfid + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
//table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
//cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
//cell.Colspan = 2;
//cell.PaddingBottom = 10f;
//table.AddCell(cell);
////SPID
//table.AddCell(PhraseCell(new Phrase("Service Provider:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
//phrase = new Phrase(new Chunk(spid + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
//table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
//cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
//cell.Colspan = 2;
//cell.PaddingBottom = 10f;
//table.AddCell(cell);
////FID
//table.AddCell(PhraseCell(new Phrase("Frequency of warranty or guaranty:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
//phrase = new Phrase(new Chunk(fid + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
//table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
//cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
//cell.Colspan = 2;
//cell.PaddingBottom = 10f;
//table.AddCell(cell);
////AGrp
//table.AddCell(PhraseCell(new Phrase("Asset Group:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
//phrase = new Phrase(new Chunk(agrp+ "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
//table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
//cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
//cell.Colspan = 2;
//cell.PaddingBottom = 10f;
//table.AddCell(cell);
////model
//table.AddCell(PhraseCell(new Phrase("Model:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
//phrase = new Phrase(new Chunk(model+ "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
//table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
//cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
//cell.Colspan = 2;
//cell.PaddingBottom = 10f;
//table.AddCell(cell);
////details extra
//table.AddCell(PhraseCell(new Phrase("Any additional details:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
//phrase = new Phrase(new Chunk(des + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
//table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
//cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
//cell.Colspan = 2;
//cell.PaddingBottom = 10f;
//table.AddCell(cell);
//    pdfWriter.CloseStream = false;//check if file does not get created
//    pdfDoc.Close();
//    return filename;
//}