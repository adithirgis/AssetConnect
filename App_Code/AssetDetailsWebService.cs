using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for AssetDetailsWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class AssetDetailsWebService : System.Web.Services.WebService
{

    public AssetDetailsWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public List<LUT_Assets_Masters> AssetMastersA(LUT_Assets_Masters am)
    {
        AssetTaggingEntities Context = new AssetTaggingEntities();
        var result = (from a in Context.LUT_Assets_Masters  select a).ToList();
        return result ;
    }
    [WebMethod]
    public LUT_Assets_Masters AssetLocation(int aid)
    {
        AssetTaggingEntities Context = new AssetTaggingEntities();
        var result = (from a in Context.LUT_Assets_Masters where a.AID==aid select a).FirstOrDefault();
        return result;
    }
    [WebMethod]
    public List<LUT_Assets_Masters> AssetFilt1(int agid, int ccid, int csid)
    {
        AssetTaggingEntities Context = new AssetTaggingEntities();
        List<LUT_Assets_Masters> result = null;
        if (agid > 0 && ccid > 0 && csid == 0)
        { result = (from a in Context.LUT_Assets_Masters where a.AGrpID == agid && a.CCID == ccid select a).ToList(); }
        else if (agid > 0 && ccid > 0 && csid > 0)
        { result = (from a in Context.LUT_Assets_Masters where a.AGrpID == agid && a.CCID == ccid && a.CSID == csid select a).ToList(); }
        else if (agid > 0 && ccid == 0 && csid > 0)
        { result = (from a in Context.LUT_Assets_Masters where a.AGrpID == agid && a.CSID == csid select a).ToList(); }
        else if (agid == 0 && ccid > 0 && csid > 0)
        { result = (from a in Context.LUT_Assets_Masters where a.CSID == csid && a.CCID == ccid select a).ToList(); }
        else
        { result = (from a in Context.LUT_Assets_Masters select a).ToList(); }
        return result;
    }
      //  Install-Package jQuery.Validation
    [WebMethod]
    public LUT_Assets_Masters AssetMasters(int aid, string name, string desc, DateTime dateP, float dp, DateTime dateD, double PP, double CX, double CY, string model, string submodel, int mnf, int sp, int f, int ccid, int csid, int alpid, int tid, int mid, int sgid, int agpid, bool W, bool QR, bool PM, bool NFC, bool Ca, bool Ba, bool GPS, bool AMC, bool Ma, bool RF)
    {
        AssetTaggingEntities Context = new AssetTaggingEntities();
        var result = (from a in Context.LUT_Assets_Masters where a.AID == aid select a).FirstOrDefault();
        if (result != null)
        {
            result.Name_of_Asset = name;
            result.Description = desc;
            result.Date_of_Purchase = dateP;
            result.Depriciation_Value = dp;
            result.Date_of_Disposal = dateD;
            result.Purchase_Price = PP;
            result.Current_Location_X = CX;
            result.Current_Location_Y = CY;
            result.Model = model;
            result.Sub_Model = submodel;
            result.MnfID = mnf;
            result.SPID = sp;
            result.FID = f;
            result.CSID = csid;
            result.CCID = ccid;
            result.ALPID = alpid;
            result.TID = tid;
            result.MID = mid;
            result.SGID = sgid;
            result.AGrpID = agpid;
            result.Warranty = W;
            result.QR = QR;
            result.PM = PM;
            result.NFC = NFC;
            result.GPS = GPS;
            result.Camera = Ca;
            result.Barcode = Ba;
            result.AMC = AMC;
            result.RFID = RF;
            result.Maintenance = Ma;
            Context.SaveChanges();

        }
        return result;
    }
    ////public List<AssetMasterDTO> AssetMasterList()
    //{
    //    AssetTaggingEntities context = new AssetTaggingEntities();
    //    var result = from a in context.LUT_Assets_Masters select new AssetMasterDTO() { };
    //    return result.ToList();
    //}

}
