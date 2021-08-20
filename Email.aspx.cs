using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;

using System.Text;
using System.Data;

using iTextSharp.text;
using iTextSharp.text.pdf;

using iTextSharp.text.html.simpleparser;

public partial class Email : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SendEmail(object sender, EventArgs e)
    {
        var email = "adithiru095@gmail.com";
        var pass = "sairam009";
        try
        {
            using (MailMessage mm = new MailMessage(email, txtTo.Text))
            {
               
                mm.Subject = txtSubject.Text;
                mm.Body = txtBody.Text;
                if (fuAttachment.HasFile)
                {
                    string FileName = Path.GetFileName(fuAttachment.PostedFile.FileName);
                    mm.Attachments.Add(new Attachment(fuAttachment.PostedFile.InputStream, FileName));
                }
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
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Message has been sent successfully.');", true);
            }
        }
        catch (Exception ex)
        { ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email could not be sent');", true); }
    }


       protected void btnGenerate_Click(object sender, EventArgs e)
    {
        try
        {
            Document pdfDoc = new Document(PageSize.A4, 25, 10, 25, 10);
            PdfWriter pdfWriter = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            Font NormalFont = FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK);
            pdfDoc.Open();
            Paragraph Text = new Paragraph("This is test file");
            Text.SpacingBefore = 10;
            Text.SpacingAfter = 10;
            Text.Alignment = Element.ALIGN_LEFT;
            Text.Font = FontFactory.GetFont(FontFactory.TIMES_ROMAN, 12f, BaseColor.GREEN);
            pdfDoc.Add(Text);
            pdfWriter.CloseStream = false;
            pdfDoc.Close();
            Response.Buffer = true;
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Example.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Write(pdfDoc);
             Response.End();
            Response.Close();
    
        }
        catch (Exception ex)
        { ClientScript.RegisterStartupScript(GetType(), "alert", "alert('PDF could not be generated.');", true); }
    }
    protected void GenerateReport( int aid)
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        AssetViewModel am1 = null;
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
               where am.AID == aid
                    
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
               }).FirstOrDefault();
                Document document = new Document(PageSize.A4, 88f, 88f, 10f, 10f);
        Font NormalFont = FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK);
        //using (System.IO.MemoryStream memoryStream = new System.IO.MemoryStream())
        //{
        //    PdfWriter writer = PdfWriter.GetInstance(document, memoryStream);
        //    Phrase phrase = null;
        //    PdfPCell cell = null;
        //    PdfPTable table = null;
        //    BaseColor color = null;

        //    document.Open();

        //    //Header Table
        //    table = new PdfPTable(2);
        //    table.TotalWidth = 500f;
        //    table.LockedWidth = true;
        //    table.SetWidths(new float[] { 0.3f, 0.7f });

        //    //Company Logo
        //    cell = ImageCell("~/images/northwindlogo.gif", 30f, PdfPCell.ALIGN_CENTER);
        //    table.AddCell(cell);

        //    //Company Name and Address
        //    phrase = new Phrase();
        //    phrase.Add(new Chunk("Asset Connect\n\n", FontFactory.GetFont("Arial", 16, Font.BOLD, BaseColor.RED)));
        //    phrase.Add(new Chunk("BVIEER,\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
        //    phrase.Add(new Chunk("Pune, India,\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));

        //    cell = PhraseCell(phrase, PdfPCell.ALIGN_LEFT);
        //    cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
        //    table.AddCell(cell);

        //    //Separater Line
        //    color = new BaseColor(System.Drawing.ColorTranslator.FromHtml("#A9A9A9"));
        //    DrawLine(writer, 25f, document.Top - 79f, document.PageSize.Width - 25f, document.Top - 79f, color);
        //    DrawLine(writer, 25f, document.Top - 80f, document.PageSize.Width - 25f, document.Top - 80f, color);
        //    document.Add(table);

        //    table = new PdfPTable(2);
        //    table.HorizontalAlignment = Element.ALIGN_LEFT;
        //    table.SetWidths(new float[] { 0.3f, 1f });
        //    table.SpacingBefore = 20f;

        //    //Employee Details
        //    cell = PhraseCell(new Phrase("Employee Record", FontFactory.GetFont("Arial", 12, Font.UNDERLINE, BaseColor.BLACK)), PdfPCell.ALIGN_CENTER);
        //    cell.Colspan = 2;
        //    table.AddCell(cell);
        //    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
        //    cell.Colspan = 2;
        //    cell.PaddingBottom = 30f;
        //    table.AddCell(cell);

        //    //Photo
        //    cell = ImageCell(string.Format("~/photos/{0}.jpg", am1.AGrpId), 25f, PdfPCell.ALIGN_CENTER);
        //    table.AddCell(cell);

        //    //Name
        //    phrase = new Phrase();
        //    phrase.Add(new Chunk(dr["TitleOfCourtesy"] + " " + am1.ALPId + " " + dr["LastName"] + "\n", FontFactory.GetFont("Arial", 10, Font.BOLD, BaseColor.BLACK)));
        //    phrase.Add(new Chunk("(" + dr["Title"].ToString() + ")", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)));
        //    cell = PhraseCell(phrase, PdfPCell.ALIGN_LEFT);
        //    cell.VerticalAlignment = PdfPCell.ALIGN_MIDDLE;
        //    table.AddCell(cell);
        //    document.Add(table);

        //    DrawLine(writer, 160f, 80f, 160f, 690f, BaseColor.BLACK);
        //    DrawLine(writer, 115f, document.Top - 200f, document.PageSize.Width - 100f, document.Top - 200f, BaseColor.BLACK);

        //    table = new PdfPTable(2);
        //    table.SetWidths(new float[] { 0.5f, 2f });
        //    table.TotalWidth = 340f;
        //    table.LockedWidth = true;
        //    table.SpacingBefore = 20f;
        //    table.HorizontalAlignment = Element.ALIGN_RIGHT;

        //    //Employee Id
        //    table.AddCell(PhraseCell(new Phrase("Asset code:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
        //    table.AddCell(PhraseCell(new Phrase("000" + dr["EmployeeId"], FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
        //    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
        //    cell.Colspan = 2;
        //    cell.PaddingBottom = 10f;
        //    table.AddCell(cell);


        //    //Name
        //    table.AddCell(PhraseCell(new Phrase("Name:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
        //    phrase = new Phrase(new Chunk(dr["Address"] + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));

        //    table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
        //    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
        //    cell.Colspan = 2;
        //    cell.PaddingBottom = 10f;
        //    table.AddCell(cell);

        //    //Current Status
        //    table.AddCell(PhraseCell(new Phrase("Current Status:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
        //    phrase = new Phrase(new Chunk(dr["Address"] + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
        //    table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
        //    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
        //    cell.Colspan = 2;
        //    cell.PaddingBottom = 10f;
        //    table.AddCell(cell);
        //    //Current Condition
        //    table.AddCell(PhraseCell(new Phrase("Current Condition:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
        //    phrase = new Phrase(new Chunk(dr["Address"] + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
        //    table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
        //    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
        //    cell.Colspan = 2;
        //    cell.PaddingBottom = 10f;
        //    table.AddCell(cell);
        //    //ALPID
        //    table.AddCell(PhraseCell(new Phrase("Asset Leased or Purchased:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
        //    phrase = new Phrase(new Chunk(dr["Address"] + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
        //    table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
        //    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
        //    cell.Colspan = 2;
        //    cell.PaddingBottom = 10f;
        //    table.AddCell(cell);
        //    //SPID
        //    table.AddCell(PhraseCell(new Phrase("Service Provider:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
        //    phrase = new Phrase(new Chunk(dr["Address"] + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
        //    table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
        //    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
        //    cell.Colspan = 2;
        //    cell.PaddingBottom = 10f;
        //    table.AddCell(cell);
        //    //Asset Group
        //    table.AddCell(PhraseCell(new Phrase("Asset Group:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
        //    phrase = new Phrase(new Chunk(dr["Address"] + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
        //    table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
        //    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
        //    cell.Colspan = 2;
        //    cell.PaddingBottom = 10f;
        //    table.AddCell(cell);
        //    //Asset manufacturer
        //    table.AddCell(PhraseCell(new Phrase("Asset manufacturer:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
        //    phrase = new Phrase(new Chunk(dr["Address"] + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
        //    table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
        //    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
        //    cell.Colspan = 2;
        //    cell.PaddingBottom = 10f;
        //    table.AddCell(cell);
        //    //FID
        //    table.AddCell(PhraseCell(new Phrase("Frequency :", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
        //    phrase = new Phrase(new Chunk(dr["Address"] + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
        //    table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
        //    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
        //    cell.Colspan = 2;
        //    cell.PaddingBottom = 10f;
        //    table.AddCell(cell);
        //    //tag type
        //    table.AddCell(PhraseCell(new Phrase("Tag Type:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
        //    phrase = new Phrase(new Chunk(dr["Address"] + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
        //    table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
        //    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
        //    cell.Colspan = 2;
        //    cell.PaddingBottom = 10f;
        //    table.AddCell(cell);
        //    //Current Condition
        //    table.AddCell(PhraseCell(new Phrase("Current Condition:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
        //    phrase = new Phrase(new Chunk(dr["Address"] + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
        //    table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
        //    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
        //    cell.Colspan = 2;
        //    cell.PaddingBottom = 10f;
        //    table.AddCell(cell);
        //    //Current Status
        //    table.AddCell(PhraseCell(new Phrase("Current Status:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
        //    phrase = new Phrase(new Chunk(dr["Address"] + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
        //    table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
        //    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
        //    cell.Colspan = 2;
        //    cell.PaddingBottom = 10f;
        //    table.AddCell(cell);
        //    //Current Condition
        //    table.AddCell(PhraseCell(new Phrase("Current Condition:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
        //    phrase = new Phrase(new Chunk(dr["Address"] + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
        //    table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
        //    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
        //    cell.Colspan = 2;
        //    cell.PaddingBottom = 10f;
        //    table.AddCell(cell);
        //    //ALPID
        //    table.AddCell(PhraseCell(new Phrase("Asset Leased or Purchased:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
        //    phrase = new Phrase(new Chunk(dr["Address"] + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
        //    table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
        //    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
        //    cell.Colspan = 2;
        //    cell.PaddingBottom = 10f;
        //    table.AddCell(cell);
        //    //SPID
        //    table.AddCell(PhraseCell(new Phrase("Service Provider:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
        //    phrase = new Phrase(new Chunk(dr["Address"] + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
        //    table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
        //    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
        //    cell.Colspan = 2;
        //    cell.PaddingBottom = 10f;
        //    table.AddCell(cell);
        //    //Asset Group
        //    table.AddCell(PhraseCell(new Phrase("Asset Group:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
        //    phrase = new Phrase(new Chunk(dr["Address"] + "\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
        //    table.AddCell(PhraseCell(phrase, PdfPCell.ALIGN_LEFT));
        //    cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
        //    cell.Colspan = 2;
        //    cell.PaddingBottom = 10f;
        //    table.AddCell(cell);
        //    //Description
        //    table.AddCell(PhraseCell(new Phrase("Description:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
        //    table.AddCell(PhraseCell(new Phrase(dr["Notes"].ToString(), FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_JUSTIFIED));
        //    document.Add(table);
        //    document.Close();
        //    byte[] bytes = memoryStream.ToArray();
        //    memoryStream.Close();
        //    Response.Clear();        // for downloading the pdf.
        //    Response.ContentType = "application/pdf";
        //    Response.AddHeader("Content-Disposition", "attachment; filename=Employee.pdf");
        //    Response.ContentType = "application/pdf";
        //    Response.Buffer = true;
        //    Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //    Response.BinaryWrite(bytes);
        //    Response.End();
        //    Response.Close();
        //}
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
        cell.VerticalAlignment =PdfPCell.ALIGN_TOP;
        cell.HorizontalAlignment = align;
        cell.PaddingBottom = 0f;
        cell.PaddingTop = 0f;
        return cell;
    }
}
