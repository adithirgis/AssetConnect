using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AssetUserDTO
/// </summary>
public class AssetUserDTO
{
    public AssetUserDTO()
    {
        //
        // TODO: Add constructor logic here 
        //
    }
    public int UsID { get; set; }
    public string UserID { get; set; }
    public string password { get; set; }
    public string SecurityQ { get; set; }
    public string SecurityA { get; set; }
    public string EmailID { get; set; }
    public string PhoneNo { get; set; }
    public string NameOfUser { get; set; }
    public bool IsDeleted { get; set; }
}