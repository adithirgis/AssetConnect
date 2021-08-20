using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["UserID"] != null)
        //{
        //    //check if they are these pages or not
        //    lblUserID.Text = Convert.ToString(Session["UserID"]);
        //}
        //if (Session["AID"] != null)
        //{
        //    //check if they are these pages or not
        //    lblAID.Text = Convert.ToString(Session["AID"]);
        //}
        //if (Session["UserID"] != null || Session["AID"] != null)
        //{
        //    //check if they are these pages or not
        //    lblUserID.Text = Convert.ToString(Session["UserID"]);
        //    lblAID.Text = Convert.ToString(Session["AID"]);
        //}
        //else
        //{
        //    Response.Redirect("Home.aspx");
        //}
    }
}
