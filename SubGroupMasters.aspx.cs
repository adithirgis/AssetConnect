using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SubGM : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindAG();
    }

    private void BindAG()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        List<LUT_Asset_Groups> Ag = (from ag in context.LUT_Asset_Groups where ag.IsDeleted == false select ag).ToList();
        DDAssetGroups.DataTextField = "Asset_Groups";
        DDAssetGroups.DataValueField = "AGrpID";
        DDAssetGroups.DataSource = Ag;
        DDAssetGroups.DataBind();
    }

    protected void SGV_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Deactivate")
        {
            //int index = Convert.ToInt32(e.CommandArgument); it identifies item itself
            ListViewItem item = e.Item; // SGV.Items[index];
            int SGID = Convert.ToInt32(((Label)item.FindControl("SGIDLabel")).Text);
            AssetTaggingEntities context = new AssetTaggingEntities();
                       var result = (from sg in context.LUT_Sub_Group where sg.SGID == SGID select sg).FirstOrDefault();
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

    protected void SGV_ItemDataBound(object sender, ListViewItemEventArgs e)   // when refreshed again, data should be bound so here making it remember
    {
        ListViewItem item = e.Item; // SGV.Items[index];
        if (item.FindControl("IsDeleted") == null)
        {
            return;
        }
        bool IsDeleted = Convert.ToBoolean(((HiddenField)item.FindControl("IsDeleted")).Value);
        AssetTaggingEntities context = new AssetTaggingEntities();
        if (IsDeleted)
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