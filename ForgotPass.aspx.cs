using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForgotPass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnCheck_Click(object sender, EventArgs e)
    {
        LUT_Asset_Users ui = new LUT_Asset_Users() { UserID = txtUserID.Text };
        UserInfoRepository repo = new UserInfoRepository();
        var resultU = repo.CheckUser(ui);
        if (resultU != null)
        {
            SecurityQ.Text = resultU; //way to print on screen 
        }
    }

    protected void btnLogIn_Click(object sender, EventArgs e)
    {
        Response.Redirect("LogInP.aspx");
    }

    protected void btnCA_Click(object sender, EventArgs e)
    {
        LUT_Asset_Users ui = new LUT_Asset_Users() { SecurityA = txtSecurityA.Text, UserID = txtUserID.Text };
        UserInfoRepository repo = new UserInfoRepository();

        var resultA = repo.CheckAnswer(ui);
        if (resultA == null)
        {
            /*Session["UserID"] = ui.UserID;*/

            Response.Write("Not Valid Answer");
        }
        else
        {
            txtPassword.Text = resultA;
        }
    }
}