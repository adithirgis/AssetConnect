using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditAssetForm : System.Web.UI.Page
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
        if (Session["AID"] != null)
        {


            lblAID.Text = Convert.ToString(Session["AID"]);
        }
        else
        {
            Response.Redirect("MainPage.aspx");
        }
        if (!IsPostBack)
        {

            BindMnf();
            BindSP();
            BindF();
            BindCS();
            BindCC();
            BindALP();
            BindTT();
            BindMtn();
            BindSG();
            BindAG();
            PopulateFields();
        }
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

    private void BindSG()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        List<LUT_Sub_Group> Sg = (from sg in context.LUT_Sub_Group where sg.IsDeleted == false select sg).ToList();
        DDSubGroup.DataTextField = "Sub_Group";
        DDSubGroup.DataValueField = "SGID";
        DDSubGroup.DataSource = Sg;
        DDSubGroup.DataBind();
    }

    private void BindMtn()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        List<LUT_Maintenance> Mtn = (from mtn in context.LUT_Maintenance where mtn.IsDeleted == false select mtn).ToList();
        DDMaintenance.DataTextField = "Maintenance";
        DDMaintenance.DataValueField = "MID";
        DDMaintenance.DataSource = Mtn;
        DDMaintenance.DataBind();
    }

    private void BindTT()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        List<LUT_Tag_Type> TT = (from tt in context.LUT_Tag_Type where tt.IsDeleted == false select tt).ToList();
        DDTagType.DataTextField = "Tag_Type";
        DDTagType.DataValueField = "TID";
        DDTagType.DataSource = TT;
        DDTagType.DataBind();
    }

    private void BindALP()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        List<LUT_Asset_Leased_or_Purchased> ALP = (from alp in context.LUT_Asset_Leased_or_Purchased where alp.IsDeleted == false select alp).ToList();
        DDAssetPurOrLea.DataTextField = "Asset_Leased_or_Purchased";
        DDAssetPurOrLea.DataValueField = "ALPID";
        DDAssetPurOrLea.DataSource = ALP;
        DDAssetPurOrLea.DataBind();
    }

    private void BindCC()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        List<LUT_Current_Condition> CC = (from cc in context.LUT_Current_Condition where cc.IsDeleted == false select cc).ToList();
        DDCurrentCondition.DataTextField = "Current_Condition";
        DDCurrentCondition.DataValueField = "CCID";
        DDCurrentCondition.DataSource = CC;
        DDCurrentCondition.DataBind();
    }

    private void BindCS()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        List<LUT_Current_Status> CS = (from cs in context.LUT_Current_Status where cs.IsDeleted == false select cs).ToList();
        DDCurrentStatus.DataTextField = "Current_Status";
        DDCurrentStatus.DataValueField = "CSID";
        DDCurrentStatus.DataSource = CS;
        DDCurrentStatus.DataBind();
    }

    private void BindF()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        List<LUT_Frequency> F = (from f in context.LUT_Frequency where f.IsDeleted == false select f).ToList();
        DDFrequency.DataTextField = "Frequency";
        DDFrequency.DataValueField = "FID";
        DDFrequency.DataSource = F;
        DDFrequency.DataBind();
    }

    private void BindSP()
    {
        // throw new NotImplementedException(); if nothing then it shows this error
        AssetTaggingEntities context = new AssetTaggingEntities();
        List<LUT_Service_Provider_Of_Asset> SP = (from sp in context.LUT_Service_Provider_Of_Asset where sp.IsDeleted == false select sp).ToList();
        DDServiceProvider.DataTextField = "Service_Provider_of_Asset";
        DDServiceProvider.DataValueField = "SPID";
        DDServiceProvider.DataSource = SP;
        DDServiceProvider.DataBind();
    }

    private void BindMnf()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        List<LUT_Asset_Manufacturers> Mnf = (from mn in context.LUT_Asset_Manufacturers where mn.IsDeleted == false select mn).ToList();
        DDManufacturer.DataTextField = "Asset_Manufacturer";
        DDManufacturer.DataValueField = "MnfID";
        DDManufacturer.DataSource = Mnf;
        DDManufacturer.DataBind();
    }
    private void PopulateFields()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        LUT_Assets_Masters am = new LUT_Assets_Masters() { };
        int aid = Int32.Parse(lblAID.Text.ToString());
        var result = (from a in context.LUT_Assets_Masters where a.AID == aid select a).FirstOrDefault();
        if (result != null)
        {
            txtNameOfAsset.Text = (result.Name_of_Asset);
            txtDateOfPurchase.Text = (result.Date_of_Purchase.ToString());
            txtDepriciationValue.Text = (result.Depriciation_Value.ToString());
            txtDateOfDisposal.Text = result.Date_of_Disposal.ToString();
            txtPurchasePrice.Text = result.Purchase_Price.ToString();
            txtLocationX.Text = result.Current_Location_X.ToString();
            txtLocationY.Text = result.Current_Location_Y.ToString();//already bound so dropdown selected value comes up.
            txtModel.Text = result.Model;
            txtSubModel.Text = result.Sub_Model;
            DDServiceProvider.SelectedValue = result.SPID.ToString();
            DDFrequency.SelectedValue = result.FID.ToString();
            DDManufacturer.SelectedValue = result.MnfID.ToString();
            DDCurrentStatus.SelectedValue = result.CSID.ToString();
            DDCurrentCondition.SelectedValue = result.CCID.ToString();
            DDAssetPurOrLea.SelectedValue = result.ALPID.ToString();
            DDTagType.SelectedValue = result.TID.ToString();
            DDMaintenance.SelectedValue = result.MID.ToString();
            DDSubGroup.SelectedValue = result.SGID.ToString();
            DDAssetGroups.SelectedValue = result.AGrpID.ToString();
            YesW.Checked = result.Warranty; //true if checkbox is checked or else false boolean function 
            YesQ.Checked = result.QR;     //Gets or sets a value indicating whether the control is checked.
            YesP.Checked = result.PM;
            YesN.Checked = result.NFC;
            YesG.Checked = result.GPS;
            YesC.Checked = result.Camera;
            YesB.Checked = result.Barcode;
            YesA.Checked = result.AMC;
            YesR.Checked = result.RFID;
            YesM.Checked = result.Maintenance;
        }
        else
        {
            Response.Write("Record Not Found");
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        LUT_Assets_Masters am = new LUT_Assets_Masters() { };
        int aid = Int32.Parse(lblAID.Text.ToString());
        var result = (from a in context.LUT_Assets_Masters where a.AID == aid select a).FirstOrDefault();
        if (result != null)
        {
            result.Name_of_Asset = txtNameOfAsset.Text;
            result.Description = txtDescription.Text;
            result.Date_of_Purchase = Convert.ToDateTime(txtDateOfPurchase.Text);
            result.Depriciation_Value = Double.Parse(txtDepriciationValue.Text);
            result.Date_of_Disposal = Convert.ToDateTime(txtDateOfDisposal.Text);
            result.Purchase_Price = Double.Parse(txtPurchasePrice.Text);
            result.Current_Location_X = Double.Parse(txtLocationX.Text);
            result.Current_Location_Y = Double.Parse(txtLocationY.Text);
            result.Model = txtModel.Text;
            result.Sub_Model = txtSubModel.Text;
            result.MnfID = Convert.ToInt32(DDManufacturer.SelectedValue);
            result.SPID = Convert.ToInt32(DDServiceProvider.SelectedValue);
            result.FID = Convert.ToInt32(DDFrequency.SelectedValue);
            result.CSID = Convert.ToInt32(DDCurrentStatus.SelectedValue);
            result.CCID = Convert.ToInt32(DDCurrentCondition.SelectedValue);
            result.ALPID = Convert.ToInt32(DDAssetPurOrLea.SelectedValue);
            result.TID = Convert.ToInt32(DDTagType.SelectedValue);
            result.MID = Convert.ToInt32(DDMaintenance.SelectedValue);
            result.SGID = Convert.ToInt32(DDSubGroup.SelectedValue);
            result.AGrpID = Convert.ToInt32(DDAssetGroups.SelectedValue);
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
            context.SaveChanges();
            Response.Redirect("EditAssetDetails.aspx");//label
        }
        else
        {
            Response.Redirect("SearchAssets.aspx");
        }
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        MV.ActiveViewIndex = 1;
        //MV.SetActiveView(EditAssetDetails2);
    }
    protected void btnPrevious_Click(object sender, EventArgs e)
    {
        MV.ActiveViewIndex = 0;
        //MV.SetActiveView(EditAssetDetails1);
    }
}