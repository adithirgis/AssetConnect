using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class SearscAssets : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    { }
  protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("AssetDetails.aspx");
    }

    //protected void btnDelete_Click(object sender, EventArgs e)
    //{
    //    AssetTaggingEntities context = new AssetTaggingEntities();
    //    LUT_Assets_Masters am = (from a in context.LUT_Assets_Masters where a.Name_of_Asset = txtNameOfAsset.Text select a).FirstOrDefault();
    //    if (am != null)
    //    {
    //        context.LUT_Assets_Masters.Remove(am);
    //        context.SaveChanges();
    //        Response.Write("Record deleted");
    //    }
    //    else
    //    {
    //        Response.Write("record not found");
    //    }
    //}
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
        Session["AID"] =ch;
        Response.Redirect("EditAssetDetails.aspx");

        
    }
}