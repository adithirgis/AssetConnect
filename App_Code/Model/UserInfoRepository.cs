using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserInfoRepository
/// </summary>

public class  UserInfoRepository
{
    public bool Authenticate(LUT_Asset_Users ui)
    {
        AssetTaggingEntities Context = new AssetTaggingEntities();
        var result = (from u in Context.LUT_Asset_Users where u.UserID == ui.UserID && u.password == ui.password select u).FirstOrDefault();
        return result != null;

    }
    public List<LUT_Asset_Users> getAssetUsers()
    {
        AssetTaggingEntities Context = new AssetTaggingEntities();
        var result = from u in Context.LUT_Asset_Users  select u;
        return result.ToList();
    }
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