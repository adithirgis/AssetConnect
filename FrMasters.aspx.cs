using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FrMasters : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] != null)
        {
            lblUserID.Text = Convert.ToString(Session["UserID"]);
        }
        else
        {
            Response.Redirect("AssetC.aspx");
        }
    }
    protected void FV_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Deactivate")
        {
            //int index = Convert.ToInt32(e.CommandArgument); it identifies item itself
            ListViewItem item = e.Item; // FV.Items[index];
            int FID = Convert.ToInt32(((Label)item.FindControl("FIDLabel")).Text);
            AssetTaggingEntities context = new AssetTaggingEntities();
            //LUT_Current_Condition = new LUT_Current_Condition();
            var result = (from f in context.LUT_Frequency where f.FID == FID select f).FirstOrDefault();
            if (result != null)
            {
                if (((Button)e.CommandSource).Text == "Deactivate")
                {
                    result.IsDeleted = true;
                    ((Button)e.CommandSource).Text = "Activate";
                    foreach (Control ctrl in item.Controls)
                    {
                        if (ctrl is Label)
                        {
                            ((Label)ctrl).ForeColor = System.Drawing.Color.Gray;
                        }
                    }
                }
                else
                {
                    result.IsDeleted = false;
                    ((Button)e.CommandSource).Text = "Deactivate";
                    foreach (Control ctrl in item.Controls)
                    {
                        if (ctrl is Label)
                        {
                            ((Label)ctrl).ForeColor = System.Drawing.Color.Black;
                        }
                    }
                }
                context.SaveChanges();
            }
            else
            {
                Response.Write("Record Not Found");
            }

        }
    }
    protected void FV_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        ListViewItem item = e.Item; // FV.Items[index];
        if (item.FindControl("IsDeleted") == null)
        {
            return;
        }
        bool isDeleted = Convert.ToBoolean(((HiddenField)item.FindControl("IsDeleted")).Value);
        AssetTaggingEntities context = new AssetTaggingEntities();
        if (isDeleted)
        {
            ((Button)item.FindControl("Deactivate")).Text = "Activate";
            foreach (Control ctrl in item.Controls)
            {
                if (ctrl is Label)
                {
                    ((Label)ctrl).ForeColor = System.Drawing.Color.Gray;
                }
            }
        }
        else
        {
            ((Button)item.FindControl("Deactivate")).Text = "Deactivate";
            foreach (Control ctrl in item.Controls)
            {
                if (ctrl is Label)
                {
                    ((Label)ctrl).ForeColor = System.Drawing.Color.Black;
                }
            }
        }
    }
}