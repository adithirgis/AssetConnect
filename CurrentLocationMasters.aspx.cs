using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CuLM : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CuLV_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Deactivate")
        {
            //int index = Convert.ToInt32(e.CommandArgument); it identifies item itself
            ListViewItem item = e.Item; // CuLV.Items[index];
            int CLID = Convert.ToInt32(((Label)item.FindControl("CLIDLabel")).Text);
            AssetTaggingEntities context = new AssetTaggingEntities();
                        var result = (from cl in context.LUT_Current_Location where cl.CLID == CLID select cl).FirstOrDefault();
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

    protected void CuLV_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        ListViewItem item = e.Item; // CuLV.Items[index];
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