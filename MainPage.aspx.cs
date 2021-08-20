using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MainPage : System.Web.UI.Page
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
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("AssetDetails.aspx");
    }
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        AssetTaggingEntities Context = new AssetTaggingEntities();
        if (txtNameOfAsset.Text != null)
        {
            var result = (from a in Context.LUT_Assets_Masters where a.Name_of_Asset == txtNameOfAsset.Text select a);
            AMG.DataSource = result.ToList();
            AMG.DataBind();
        }
        if (txtAssetCode.Text != null)
        {
            int ch = Convert.ToInt32(txtAssetCode.Text);
            var result = (from a in Context.LUT_Assets_Masters where a.AID == ch select a);
            //foreach (var item in result)
            //{
            //    Console.WriteLine("{0} {1} ", item.AID, item.Name_of_Asset);
            //}
            AMG.DataSource = result.ToList();
            AMG.DataBind();
        }
        if (txtAssetCode.Text != null & txtNameOfAsset.Text != null)
        {
            int ch = Convert.ToInt32(txtAssetCode.Text);
            var result = (from a in Context.LUT_Assets_Masters where a.AID == ch select a);
            //foreach (var item in result)
            //{
            //    Console.WriteLine("{0} {1} ", item.AID, item.Name_of_Asset);
            //}
            AMG.DataSource = result.ToList();
            AMG.DataBind();
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        int ch = Convert.ToInt32(txtAssetCode.Text);
        AssetTaggingEntities Context = new AssetTaggingEntities();
        var result = (from a in Context.LUT_Assets_Masters where a.AID == ch && a.Name_of_Asset == txtNameOfAsset.Text select a).FirstOrDefault();
        Session["AID"] = ch;
        Response.Redirect("EditAssetForm.aspx");


    }
}