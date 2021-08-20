using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Check4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            BindA();
            List<AssetViewModel> dt = this.GetData();
            rptMarkers.DataSource = dt;
            rptMarkers.DataBind();
           
        }
    }
    private bool btnPast= false;
    private bool btnFuture = false;
    private void BindA()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        List<LUT_Assets_Masters> Am = (from am in context.LUT_Assets_Masters select am).ToList();
        DDAsset.DataTextField = "Name_of_Asset";
        DDAsset.DataValueField = "AID";
        DDAsset.DataSource = Am;
        DDAsset.DataBind();
        DDAsset.Items.Insert(0, " Select Asset Name");
    }
    private List<AssetViewModel> GetData()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        List<AssetViewModel> ah1 = null;
       
       // ah1 = (from ah in context.LUT_History_of_Asset where ah.AID == DDAsset.SelectedIndex && ah.HID==2 select ah).ToList();
        if ( DDAsset.SelectedIndex > 0  && btnPast==true)
        {
            ah1 = (from am in context.LUT_Assets_Masters
                   join ah in context.LUT_History_of_Asset on am.AID equals ah.AID
                   join grp in context.LUT_Asset_Groups on am.AGrpID equals grp.AGrpID
                   join cc in context.LUT_Current_Condition on am.CCID equals cc.CCID
                   join cs in context.LUT_Current_Status on am.CSID equals cs.CSID
                   join mn in context.LUT_Asset_Manufacturers on am.MnfID equals mn.MnfID
                   join sp in context.LUT_Service_Provider_Of_Asset on am.SPID equals sp.SPID
                   join fr in context.LUT_Frequency on am.FID equals fr.FID
                   join sg in context.LUT_Sub_Group on am.SGID equals sg.SGID
                   join tt in context.LUT_Tag_Type on am.TID equals tt.TID
                   join alp in context.LUT_Asset_Leased_or_Purchased on am.ALPID equals alp.ALPID
                   where ah.AID == DDAsset.SelectedIndex && (ah.HID == 0 || ah.HID == 2)
                   select new AssetViewModel
                   {
                       AId = am.AID,
                       Name = am.Name_of_Asset,
                       lng = ah.Current_Location_X,
                       lat = ah.Current_Location_Y,
                       AGrpId = am.AGrpID,
                       CCId = am.CCID,
                       CSId = am.CSID,
                       TTId = am.TID,
                       MnfId = am.MID,
                       SPId = am.SPID,
                       SGId = am.SGID,
                       FId = am.FID,
                       ALPId = am.ALPID,
                       Cam = am.Camera,
                       des = am.Description,
                       AG = grp.Asset_Groups,
                       CC = cc.Current_Condition,
                       CS = cs.Current_Status,
                       Mnf = mn.Asset_Manufacturer,
                       SP = sp.Service_Provider_of_Asset,
                       Fre = fr.Frequency,
                       SG = sg.Sub_Group,
                       TT = tt.Tag_Type,
                       HId=ah.HID,
                       AHId=ah.AHID,
                       ALP = alp.Asset_Leased_or_Purchased
                   }).ToList();

        }
       else if (DDAsset.SelectedIndex > 0 && btnFuture== true)
        {
            ah1 = (from am in context.LUT_Assets_Masters
                   join ah in context.LUT_History_of_Asset on am.AID equals ah.AID
                   join grp in context.LUT_Asset_Groups on am.AGrpID equals grp.AGrpID
                   join cc in context.LUT_Current_Condition on am.CCID equals cc.CCID
                   join cs in context.LUT_Current_Status on am.CSID equals cs.CSID
                   join mn in context.LUT_Asset_Manufacturers on am.MnfID equals mn.MnfID
                   join sp in context.LUT_Service_Provider_Of_Asset on am.SPID equals sp.SPID
                   join fr in context.LUT_Frequency on am.FID equals fr.FID
                   join sg in context.LUT_Sub_Group on am.SGID equals sg.SGID
                   join tt in context.LUT_Tag_Type on am.TID equals tt.TID
                   join alp in context.LUT_Asset_Leased_or_Purchased on am.ALPID equals alp.ALPID
                   where ah.AID == DDAsset.SelectedIndex && (ah.HID == 1 ||ah.HID==2)
                   select new AssetViewModel
                   {
                       AId = am.AID,
                       Name = am.Name_of_Asset,
                       lng = ah.Current_Location_X,
                       lat = ah.Current_Location_Y,
                       AGrpId = am.AGrpID,
                       CCId = am.CCID,
                       CSId = am.CSID,
                       TTId = am.TID,
                       MnfId = am.MID,
                       SPId = am.SPID,
                       SGId = am.SGID,
                       FId = am.FID,
                       ALPId = am.ALPID,
                       Cam = am.Camera,
                       des = am.Description,
                       AG = grp.Asset_Groups,
                       CC = cc.Current_Condition,
                       CS = cs.Current_Status,
                       Mnf = mn.Asset_Manufacturer,
                       SP = sp.Service_Provider_of_Asset,
                       Fre = fr.Frequency,
                       SG = sg.Sub_Group,
                       TT = tt.Tag_Type,
                       HId = ah.HID,
                       AHId = ah.AHID,
                       ALP = alp.Asset_Leased_or_Purchased
                   }).ToList();

            //ah1 = (from ah in context.LUT_History_of_Asset
            //       where ah.AID == DDAsset.SelectedIndex && ah.HID == 1
            //       select ah).ToList();

        }

        else 
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('History of this asset is unavailable.');", true);
        }
        return ah1;

    }
    protected void btnPClick(object sender, EventArgs e)
    {
          btnPast = true;
        btnFuture =false;
        List<AssetViewModel> dt = this.GetData();
        rptMarkers.DataSource = dt;
        rptMarkers.DataBind();
    }
    protected void btnFClick(object sender, EventArgs e)
    {
        btnFuture = true;
        btnPast = false;
        List<AssetViewModel> dt = this.GetData();
        rptMarkers.DataSource = dt;
        rptMarkers.DataBind();
    }
    protected void DDAsset_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnFuture =false;
        btnPast = false;
        List<AssetViewModel> dt = this.GetData();
        rptMarkers.DataSource = dt;
        rptMarkers.DataBind();
    }
}