using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AssetDetails2 : System.Web.UI.Page
{
        protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AID"] != null)                                       // sessions to remember the asset for state management
        {
            lblAID.Text = Convert.ToString(Session["AID"]);
        }
        else
        {
            Response.Redirect("AssetDetails.aspx");
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        LUT_Assets_Masters am = new LUT_Assets_Masters() { };
        int aid = Convert.ToInt32(lblAID.Text);                       // this is for checking if it is in db if not then should redirect itself to first data page
        var result = (from a in context.LUT_Assets_Masters where a.AID == aid select a).FirstOrDefault();
        if (result != null)
        {
            am.Warranty = YesW.Checked;
            am.QR = YesQ.Checked;
            am.PM = YesP.Checked;
            am.NFC = YesN.Checked;
            am.GPS = YesG.Checked;
            am.Camera = YesC.Checked;
            am.Barcode = YesB.Checked;
            am.AMC = YesA.Checked;
            am.RFID = YesR.Checked;
            am.Maintenance = YesM.Checked;
            context.LUT_Assets_Masters.Add(am);
            context.SaveChanges();
            Response.Redirect("AssetDetils2.aspx");
        }
        else
        {
            Response.Redirect("AssetDetils.aspx");
        }
    }
     protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("AssetDetails.aspx");
    }
}