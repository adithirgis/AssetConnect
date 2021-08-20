using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class check3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            List<LUT_Assets_Masters> dt = this.GetData();
            rptMarkers.DataSource = dt;
            rptMarkers.DataBind();
        }
    }
    private List<LUT_Assets_Masters> GetData()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        List<LUT_Assets_Masters> am1 = null;
        am1 = (from am in context.LUT_Assets_Masters select am).ToList();
        return am1;

    }

}