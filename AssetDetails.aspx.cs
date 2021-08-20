using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.Entity.Validation;
using System.Data.Entity;
using System.IO;
using System.Data.Spatial;


public partial class Transactions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //PopulateFields();
            BindMnf();
            BindSP();
            BindF();
            BindCS();
            BindCC();
            BindAG();
            BindALP();
            BindTT();
            BindMtn();
            BindSG();

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
        DDAssetGroups.Items.Insert(0, " Select Asset Groups");
    }
    private void BindSG()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        List<LUT_Sub_Group> Sg = (from sg in context.LUT_Sub_Group where sg.IsDeleted == false select sg).ToList();
        DDSubGroup.DataTextField = "Sub_Group";
        DDSubGroup.DataValueField = "SGID";
        DDSubGroup.DataSource = Sg;
        DDSubGroup.DataBind();
        DDSubGroup.Items.Insert(0, " Select Sub Asset Groups");
    }

    private void BindMtn()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        List<LUT_Maintenance> Mtn = (from mtn in context.LUT_Maintenance where mtn.IsDeleted == false select mtn).ToList();
        DDMaintenance.DataTextField = "Maintenance";
        DDMaintenance.DataValueField = "MID";
        DDMaintenance.DataSource = Mtn;
        DDMaintenance.DataBind();
        DDMaintenance.Items.Insert(0, "Select Maintenance");
    }

    private void BindTT()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        List<LUT_Tag_Type> TT = (from tt in context.LUT_Tag_Type where tt.IsDeleted == false select tt).ToList();
        DDTagType.DataTextField = "Tag_Type";
        DDTagType.DataValueField = "TID";
        DDTagType.DataSource = TT;
        DDTagType.DataBind();
        DDTagType.Items.Insert(0, "Select Tag Type");
    }

    private void BindALP()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        List<LUT_Asset_Leased_or_Purchased> ALP = (from alp in context.LUT_Asset_Leased_or_Purchased where alp.IsDeleted == false select alp).ToList();
        DDAssetPurOrLea.DataTextField = "Asset_Leased_or_Purchased";
        DDAssetPurOrLea.DataValueField = "ALPID";
        DDAssetPurOrLea.DataSource = ALP;
        DDAssetPurOrLea.DataBind();
        DDAssetPurOrLea.Items.Insert(0, "Select Leased or Purchased");
    }

    private void BindCC()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        List<LUT_Current_Condition> CC = (from cc in context.LUT_Current_Condition where cc.IsDeleted == false select cc).ToList();
        DDCurrentCondition.DataTextField = "Current_Condition";
        DDCurrentCondition.DataValueField = "CCID";
        DDCurrentCondition.DataSource = CC;
        DDCurrentCondition.DataBind();
        DDCurrentCondition.Items.Insert(0, "Select Current Condition");
    }

    private void BindCS()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        List<LUT_Current_Status> CS = (from cs in context.LUT_Current_Status where cs.IsDeleted == false select cs).ToList();
        DDCurrentStatus.DataTextField = "Current_Status";
        DDCurrentStatus.DataValueField = "CSID";
        DDCurrentStatus.DataSource = CS;
        DDCurrentStatus.DataBind();
        DDCurrentStatus.Items.Insert(0, "Select Current Status");
    }

    private void BindF()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        List<LUT_Frequency> F = (from f in context.LUT_Frequency where f.IsDeleted == false select f).ToList();
        DDFrequency.DataTextField = "Frequency";
        DDFrequency.DataValueField = "FID";
        DDFrequency.DataSource = F;
        DDFrequency.DataBind();
        DDFrequency.Items.Insert(0, "Select Frequency");
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
        DDServiceProvider.Items.Insert(0, "Select Service Provider");
    }

    private void BindMnf()
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        List<LUT_Asset_Manufacturers> Mnf = (from mn in context.LUT_Asset_Manufacturers where mn.IsDeleted == false select mn).ToList();
        DDManufacturer.DataTextField = "Asset_Manufacturer";
        DDManufacturer.DataValueField = "MnfID";
        DDManufacturer.DataSource = Mnf;
        DDManufacturer.DataBind();
        DDManufacturer.Items.Insert(0, "Select Manufacturer");

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        
        LUT_Assets_Masters am = new LUT_Assets_Masters() { };
        AssetTaggingEntities context = new AssetTaggingEntities();
        am.Name_of_Asset = txtNameOfAsset.Text.Length == 0 ? null : txtNameOfAsset.Text;
        am.Date_of_Purchase = Convert.ToDateTime(txtDateOfPurchase.Text);
        if (String.IsNullOrWhiteSpace(txtDepriciationValue.Text))
        {
            am.Depriciation_Value = Convert.ToDouble(DBNull.Value);
        }
        else
        {
            am.Depriciation_Value = Convert.ToDouble(txtDepriciationValue.Text);
        }
        //am.Date_of_Disposal = Convert.ToDateTime(txtDateOfDisposal.Text);
        if (String.IsNullOrWhiteSpace(txtDateOfDisposal.Text))
        {
            am.Date_of_Disposal = Convert.ToDateTime(DBNull.Value);// am.Date_of_Disposal = null;
        }
        else
        {
            am.Date_of_Disposal = Convert.ToDateTime(txtDateOfDisposal.Text);
        }
        am.Purchase_Price = Double.Parse(txtPurchasePrice.Text);
        am.Current_Location_X = Double.Parse(txtLocationX.Text);
        am.Current_Location_Y = Double.Parse(txtLocationY.Text);
        am.AID = Convert.ToInt32(txtAssetCode.Text);
        am.Model = txtModel.Text;
        am.Description= String.IsNullOrWhiteSpace(txtDescription.Text) ? null : txtDescription.Text;
        am.Sub_Model = String.IsNullOrWhiteSpace(txtSubModel.Text)? null: txtSubModel.Text;
        am.MnfID = Convert.ToInt32(DDManufacturer.SelectedValue);
        am.SPID = Convert.ToInt32(DDServiceProvider.SelectedValue);
        am.FID = Convert.ToInt32(DDFrequency.SelectedValue);
        am.CSID = Convert.ToInt32(DDCurrentStatus.SelectedValue);
        am.CCID = Convert.ToInt32(DDCurrentCondition.SelectedValue);
        am.ALPID = Convert.ToInt32(DDAssetPurOrLea.SelectedValue);
        am.TID = Convert.ToInt32(DDTagType.SelectedValue);
       am.MID = Convert.ToInt32(DDMaintenance.SelectedValue);
        am.SGID = Convert.ToInt32(DDSubGroup.SelectedValue);
        am.AGrpID = Convert.ToInt32(DDAssetGroups.SelectedValue);
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
        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Asset Added Sucessfully.');", true);
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        MV.ActiveViewIndex = 1;
        //MV.SetActiveView(AssetDetails2);
    }
    protected void btnPrevious_Click(object sender, EventArgs e)
    {
        MV.ActiveViewIndex = 0;
        //MV.SetActiveView(AssetDetails);
    }
    //private void PopulateFields()
    //{
    //    AssetTaggingEntities context = new AssetTaggingEntities();
    //    LUT_Assets_Masters am = new LUT_Assets_Masters() { };
    //    int aid = Convert.ToInt32(txtAssetCode.Text);
    //    var result = (from a in context.LUT_Assets_Masters where a.AID == aid select a).FirstOrDefault();
    //    if (result != null)
    //    {
    //        txtNameOfAsset.Text = (result.Name_of_Asset);
    //        txtDateOfPurchase.Text = (result.Date_of_Purchase.ToString());
    //        txtDepriciationValue.Text = (result.Depriciation_Value.ToString());
    //        txtDateOfDisposal.Text = result.Date_of_Disposal.ToString();
    //        txtPurchasePrice.Text = result.Purchase_Price.ToString();
    //        txtLocationX.Text = result.Current_Location_X.ToString();
    //        txtLocationY.Text = result.Current_Location_Y.ToString();//already bound so dropdown selected value comes up.
    //        txtModel.Text = result.Model;
    //        txtSubModel.Text = result.Sub_Model;
    //        DDServiceProvider.SelectedValue = result.SPID.ToString();
    //        DDFrequency.SelectedValue = result.FID.ToString();
    //        DDManufacturer.SelectedValue = result.MnfID.ToString();
    //        DDCurrentStatus.SelectedValue = result.CSID.ToString();
    //        DDCurrentCondition.SelectedValue = result.CCID.ToString();
    //        DDAssetPurOrLea.SelectedValue = result.ALPID.ToString();
    //        DDTagType.SelectedValue = result.TID.ToString();
    //        DDMaintenance.SelectedValue = result.MID.ToString();
    //        DDSubGroup.SelectedValue = result.SGID.ToString();
    //        DDAssetGroups.SelectedValue = result.AGrpID.ToString();
    //    }
    //    else
    //    {
    //        Response.Write("Record Not Found");
    //    }
    //}

   
    //public class FormattedDbEntityValidationException : Exception
    //{
    //    public FormattedDbEntityValidationException(DbEntityValidationException innerException) :
    //        base(null, innerException)
    //    {
    //    }

    //    public override string Message
    //    {
    //        get
    //        {
    //            var innerException = InnerException as DbEntityValidationException;
    //            if (innerException != null)
    //            {
    //                StringBuilder sb = new StringBuilder();

    //                sb.AppendLine();
    //                sb.AppendLine();
    //                foreach (var eve in innerException.EntityValidationErrors)
    //                {
    //                    sb.AppendLine(string.Format("- Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
    //                        eve.Entry.Entity.GetType().FullName, eve.Entry.State));
    //                    foreach (var ve in eve.ValidationErrors)
    //                    {
    //                        sb.AppendLine(string.Format("-- Property: \"{0}\", Value: \"{1}\", Error: \"{2}\"",
    //                            ve.PropertyName,
    //                            eve.Entry.CurrentValues.GetValue<object>(ve.PropertyName),
    //                            ve.ErrorMessage));
    //                    }
    //                }
    //                sb.AppendLine();

    //                return sb.ToString();
    //            }

    //            return base.Message;
    //        }
    //    }
    //}
    // EntityValidationErrors is a collection which represents the entities which couldn't be validated successfully, and the inner collection ValidationErrors per entity is a list of errors on property level.

}