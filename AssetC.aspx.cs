using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;
using System.Text;


public partial class AssetC : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void btnReg_Click(object sender, EventArgs e)
    {
        Response.Redirect("Regist.aspx");
    }

        protected void SendEmail(object sender, EventArgs e)
    {
        var email = "adithiru095@gmail.com";
        var pass = "sairam009";
        try
        {
            using (MailMessage mm = new MailMessage(email, "adithiru095@gmail.com"))
            {

                mm.Subject ="Query regarding the website";
                mm.Body ="Comments";
                //if (fuAttachment.HasFile)
                //{
                //    string FileName = Path.GetFileName(fuAttachment.PostedFile.FileName);
                //    mm.Attachments.Add(new Attachment(fuAttachment.PostedFile.InputStream, FileName));
                //}
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
   
}