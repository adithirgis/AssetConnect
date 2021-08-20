using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Regist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("AssetC.aspx");  // or we can close this
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        LUT_Asset_Users ui = new LUT_Asset_Users() { };
        ui.NameOfUser = txtName.Text;
        ui.PhoneNo = txtPhoneNo.Text;
        ui.UserID = txtUserID.Text;
        ui.password = txtPassword.Text;// check whether the passwrd is correct then write

        if (ui.password == txtConfirmP.Text)
        {
            ui.EmailID = txtEmailID.Text;
            ui.SecurityQ = txtSecurityQ.Text;
            ui.SecurityA = txtSecurityA.Text;
            AssetTaggingEntities context = new AssetTaggingEntities();
            context.LUT_Asset_Users.Add(ui);
            context.SaveChanges();
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Registration successful.');", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Could not match password! Try again.');", true);
            //Response.Redirect("Registration.aspx");
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        LUT_Asset_Users ui = new LUT_Asset_Users();
        int usid = Convert.ToInt32(txtUsID.Text);
        var result = (from u in context.LUT_Asset_Users where u.UsID == usid select u).FirstOrDefault();
        if (result != null)
        {
            result.SecurityA = txtSecurityA.Text;
            result.NameOfUser = txtName.Text;
            result.SecurityQ = txtSecurityQ.Text;
            result.password = txtPassword.Text;
            result.EmailID = txtEmailID.Text;
            result.PhoneNo = txtPhoneNo.Text;
            result.UserID = txtUserID.Text;
            context.SaveChanges();
            Response.Write("Record changed");//label
        }
        else
        {
            Response.Write("Record Not Found");
        }
    }
    
}