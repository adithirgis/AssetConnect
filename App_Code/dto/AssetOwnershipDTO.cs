using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AssetOwnershipDTO
/// </summary>
public class AssetOwnershipDTO
{
    public AssetOwnershipDTO()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int AOID { get; set; }
    public string Asset_Ownership { get; set; }
    public string Description { get; set; }
    public bool IsDeleted { get; set; }
}