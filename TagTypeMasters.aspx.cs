using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TagTM : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void TV_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Deactivate")
        {
            //int index = Convert.ToInt32(e.CommandArgument); it identifies item itself
            ListViewItem item = e.Item; // TV.Items[index];
            int TID = Convert.ToInt32(((Label)item.FindControl("TIDLabel")).Text);
            AssetTaggingEntities context = new AssetTaggingEntities();
            //LUT_Current_Condition = new LUT_Current_Condition();
            var result = (from t in context.LUT_Tag_Type where t.TID == TID select t).FirstOrDefault();
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
    protected void TV_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        ListViewItem item = e.Item; // TV.Items[index];
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