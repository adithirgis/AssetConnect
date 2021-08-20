using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LogInP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSignIn_Click(Object sender, EventArgs e)
    {
        LUT_Asset_Users ui = new LUT_Asset_Users() { UserID = txtUserID.Text, password = txtPassword.Text };
        UserInfoRepository repo = new UserInfoRepository();


        if (repo.Authenticate(ui))
        {
            Session["UserID"] = ui.UserID;//[key]
            Response.Redirect("MainPage.aspx");

        }
        else
        {
            Response.Redirect("LogInP.aspx");
        }
            }
    }