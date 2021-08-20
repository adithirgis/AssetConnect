using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for AssetAddWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class AssetAddWebService : System.Web.Services.WebService
{

    public AssetAddWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string CheckUser(LUT_Asset_Users ui)// whatever you want here write query for that and return the value which we need and then give parameter what is needed.
    {
        AssetTaggingEntities Context = new AssetTaggingEntities();
        var result = (from u in Context.LUT_Asset_Users where u.UserID == ui.UserID select u).FirstOrDefault();
        if (result != null)
        {
            return result.SecurityQ;
        }
        else
        {
            return null;
        }
    }

}
