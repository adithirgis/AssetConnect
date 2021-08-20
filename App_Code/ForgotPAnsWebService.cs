using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for ForgotPAnsWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class ForgotPAnsWebService : System.Web.Services.WebService
{

    public ForgotPAnsWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string CheckAnswer(LUT_Asset_Users ui)
    {
        AssetTaggingEntities Context = new AssetTaggingEntities();
        var result = (from u in Context.LUT_Asset_Users where u.SecurityA == ui.SecurityA && u.UserID == ui.UserID select u).FirstOrDefault();
        // you need to store it in the query s result not in ui
        if (result == null)
        {
            return null;
        }
        else
        {
            return result.password;
        }
    }

}
