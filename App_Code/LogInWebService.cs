using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;


/// <summary>
/// Summary description for AssetWebService
/// </summary>
[WebService(Namespace = "http://assetconnect.orgem/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class AssetWebService : System.Web.Services.WebService
{

    public AssetWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }
    //[WebMethod]
    //public List<AssetMasterDTO> AssetList()
    //{
    //    AssetTaggingEntities context = new AssetTaggingEntities();
    //    var result = from a in context.LUT_Assets_Masters select new AssetMasterDTO() { AssetID=a.AID, AssetName = a.Name_of_Asset };
    //    return result.ToList();
    //}
    [WebMethod]
    public List<AssetUserDTO> AssetUserList(/*LUT_Asset_Users ui*/)
    {
        AssetTaggingEntities context = new AssetTaggingEntities();
        var result = from u in context.LUT_Asset_Users select new AssetUserDTO() { UserID = u.UserID, password = u.password };
        return result.ToList();
    }
    [WebMethod]
    public bool Authenticate(LUT_Asset_Users ui)
    {
        AssetTaggingEntities Context = new AssetTaggingEntities();
        var result = (from u in Context.LUT_Asset_Users where u.UserID == ui.UserID && u.password == ui.password select u).FirstOrDefault();
        return result != null;
    }
}

 


//    protected void AGV_ItemCommand(object sender, ListViewCommandEventArgs e)
//    {
//        int deact = 0;//
//        if (e.CommandName == "Deactivate")
//        {
//            int index = Convert.ToInt32(e.CommandArgument);
//            ListViewDataItem item = AGV.Items[index];
//            int AGID = Convert.ToInt32(((Label)item.FindControl("AGrpIDLabel")).Text);
//            AssetTaggingEntities context = new AssetTaggingEntities();
//            LUT_Asset_Groups ag = new LUT_Asset_Groups();

//            var result = (from g in context.LUT_Asset_Groups where g.AGrpID == AGID select g).FirstOrDefault();
//            if (result != null)
//            {
//                result.IsDeleted = true;
//                context.SaveChanges();


//            }
//            else
//            {
//                return;
//                Response.Write("Record Not Found");
//            }

//        }
//    }

//}
