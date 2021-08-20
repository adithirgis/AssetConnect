using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contactus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    { }
 protected void AGV_ItemCommand(object sender, ListViewCommandEventArgs e)
    { 
        //int deact = 0;//
        if (e.CommandName == "Deactivate")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            ListViewDataItem item = AGV.Items[index];
            int AGID = Convert.ToInt32(((Label)item.FindControl("AGrpIDLabel")).Text);
            AssetTaggingEntities context = new AssetTaggingEntities();
            //LUT_Asset_Groups ag = new LUT_Asset_Groups();

            var result = (from g in context.LUT_Asset_Groups where g.AGrpID == AGID select g).FirstOrDefault();
            if (result != null)
            {
                result.IsDeleted = true;
                context.SaveChanges();
               

            }
            else
            {
                Response.Write("Record Not Found");
            }

        }
    }
  protected void AGV_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        ListViewItem item = e.Item; // AGV.Items[index];
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

    
